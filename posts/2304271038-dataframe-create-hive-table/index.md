# save DataFrame as partition of hive table


使用DataFrame直接创建hive表, 并作为其中的一个分区数据

### test 1

```scala
table
    .write
    .format("hive")
    .mode("overwrite")
    .option("path", inputPath + "_table")
    .insertInto(tableName)
```

error, 需要先创建表

```
Exception in thread "main" org.apache.spark.sql.AnalysisException: Table not found: hdp_lbg_ectech_ads.zp_compensate_ad_detail_test1;
```

### test 2

首先判别表是否存在

```scala
def checkTableExist(tableName: String): Boolean = {
    // https://www.mikulskibartosz.name/save-spark-dataframe-as-partitioned-hive-table/
    val tableDbName = tableName.split("\\.")
    // Dog.print(tableName, tableDbName.mkString(".."))
    SparkEnvir.ss.sql(s"SHOW TABLES IN ${tableDbName(0)}")
        .where(col("tableName") === tableDbName(1))
        .count() == 1
}
```

表存在则直接插入, 表不存在则创建

```scala
ss.sql("SET hive.exec.dynamic.partition=true")
ss.sql("SET hive.exec.dynamic.partition.mode=nonstrict")
ss.sql("SET hive.exec.max.dynamic.partitions.pernode=400")

val writer: DataFrameWriter[Row] = table
    .write
    .mode("append") // overwrite
    .format("parquet") // difference of hive and parquet(different with format(SERDE, INPUT, OUTPUT))
    .option("path", outputTablePath) // external table
val tableExist = SparkUtils.checkTableExist(tableName)
if (tableExist) {
    Dog.print(s"[insertInto(tableName)] ${tableName}")
    writer.insertInto(tableName)
} else {
    Dog.print(s"[saveAsTable(tableName)] ${tableName}")
    writer
        .partitionBy("dt")
        .saveAsTable(tableName)
}
```

这里创建表时没有问题的, path下会根据partition自动生成路径, path/partition_name=xx

但是insertInto(tableName)一直在hanging状态, 这里还未排查出原因, 怀疑是external path的问题?

这里另外需要注意的是, 创建表需要partition信息, 而insertInto就不需要partition信息了, 会根据表名的metadata获取partition信息. [参考](https://www.mikulskibartosz.name/save-spark-dataframe-as-partitioned-hive-table/)

### test 3(worked)

创建表使用saveAsTable, 添加分区数据使用parquet, 然后使用`MSCK REPAIR TABLE ${tableName}`更新数据路径的映射.

```scala
ss.sql("SET hive.exec.dynamic.partition=true")
ss.sql("SET hive.exec.dynamic.partition.mode=nonstrict")
ss.sql("SET hive.exec.max.dynamic.partitions.pernode=400")

val writer: DataFrameWriter[Row] = table
    .coalesce(1)
    .write
    .mode("append") // overwrite
    .format("parquet") // difference of hive and parquet(different with format(SERDE, INPUT, OUTPUT))
    .option("path", outputTablePath) // external table
    .option("partitionOverwriteMode", "dynamic")
    // .partitionBy("dt")
val tableExist = SparkUtils.checkTableExist(tableName)
if (tableExist) {
    Dog.print(s"[insertInto(tableName)] ${tableName}")
    writer.parquet(outputTablePath)
    // writer.insertInto(tableName)
} else {
    Dog.print(s"[saveAsTable(tableName)] ${tableName}")
    writer.saveAsTable(tableName)
}

ss.sql(s"MSCK REPAIR TABLE ${tableName}")

val selectExample = s"SELECT * FROM ${tableName} WHERE dt=${date}"
Dog.print("[selectExample] " + selectExample)
ss.sql(selectExample).show()
SparkEnvir.close()
```

### 其他

#### 1 使用DDL生成建表sql

```scala
def getCreateTableSql(df: DataFrame, tableName: String, partitioned: Array[String]): String = {
    // https://stackoverflow.com/a/69365683/6494418
    val schemaDDL = df.schema.toDDL
    val partitionedStr = partitioned.map(_ + " STRING").mkString(",")
    val createTableSql = s"CREATE TABLE ${tableName} (${schemaDDL}) PARTITIONED BY (${partitionedStr})"
    Dog.print("[df.schema.fields] " + df.schema.fields.mkString(", "))
    Dog.print("[create table sql] " + createTableSql)
    Dog.print("[schemaDDL       ] " + schemaDDL)
    createTableSql
}
```

#### 2 format parquet 和format hive的区别

两者的区别在于序列化方式不同, 查看建表语句`show create table tableName`

parquet

```json
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
```

hive

```json
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
```

#### 3 其他方式

之前使用DataFrame创建hive表的一个分区一直使用的是手动的, hivesql的

```sql
---- CREATE TABLE IF NOT EXIST
CREATE EXTERNAL TABLE IF NOT EXISTS ${table_name} (
    ${col_normal_str}
)
COMMENT "create by wangke09"
PARTITIONED BY (
    ${col_partition_str}
)
ROW FORMAT DELIMITED
    FIELDS TERMINATED BY "${fields_terminated}"
    LINES  TERMINATED BY "\n"
STORED AS TEXTFILE LOCATION "${table_location}";

---- LINK DATA
ALTER TABLE ${table_name}
ADD IF NOT EXISTS PARTITION(${partition_valued})  -- partition valued and sep by(,), like dt='1', bg='2'
LOCATION "${partition_location}";  
-- link partition_location to partition_valued(no need align to partition_valued like table_location/1/2)

---- DROP TABLE IF EXISTS ${table_name};
---- SELECT * FROM ${table_name} WHERE ${partition_valued_and} ORDER BY RAND() LIMIT 500;
```

主要使用add partition去链接external data, 现在可以用更简单的方式创建表和连接表, 但是可能会有下面问题(未验证):

1. external path的格式, 如果不是创建表的标准格式, MSCK REPAIR可能不能扫描(未测试), 这种情况只有通过add partition链接数据
2. parquet是一种序列化方法(类似json, hive?, csv, 等), 非文本格式, 不能直接使用hadoop -text 查看原数据
3. 创建表不能添加comment, 需要自己修改metadata

#### 4 是否可以直接使用parquet创建表?

#### 5 NULL值处理

不处理null值检索全部列(`*`)貌似非常的慢, 最后做缺失值填充



## json reader

json没有

```scala
var rawData: DataFrame = ss.read.json(files: _*).repartition(numPartition).cache()
```





### refs

1. https://www.jianshu.com/p/c1b0dc86f9b0 msck repair
2. https://www.mikulskibartosz.name/save-spark-dataframe-as-partitioned-hive-table/ 
3. https://stackoverflow.com/a/31371571/6494418
4. https://stackoverflow.com/a/48251020/6494418
5. https://stackoverflow.com/a/45706191/6494418

[TOC]

