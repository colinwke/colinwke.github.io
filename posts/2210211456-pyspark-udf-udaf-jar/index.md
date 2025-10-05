# pyspark udf udaf with jar


## 问题描述

使用scala开发了udaf, 在scala程序中能使用, 无法在pyspark中使用

使用udaf有两种方法: 

*第一种是hive使用*

```python
ss.sql("CREATE TEMPORARY FUNCTION MostFreq22 AS 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF' USING JAR '%s'" % jar_path)
# SparkConf未指定spark.jars
# error
# pyspark.sql.utils.AnalysisException: Can not load class 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF' when registering the function 'MostFreq22', please make sure it is on the classpath
```

当指定了spark.jars, 仍然报错

```python
config("spark.jars", jar_path)  # IMPORTANT for java dependence jar
# 22/10/21 15:16:08 WARN SparkContext: The jar /Users/wangke/working/bussiness_data_offline/python/pyspark/bussiness_data_offline_1.0.9_shaded.jar has been added already. Overwriting of added jars is not supported in the current version.
# ...
# pyspark.sql.utils.AnalysisException: Can not load class 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF' when registering the function 'MostFreq22', please make sure it is on the classpath
```

添加了下面参数, 仍然为找到classpath

```python
SparkSession.builder
.appName(name="wktk_pyspark_env")  # basename(__file__)
.config("spark.jars", jar_path)  # IMPORTANT for java dependence jar
.config("spark.driver.extraLibraryPath", jar_path)
.config("spark.executor.extraLibraryPath", jar_path)
.config("spark.driver.extraClassPath", jar_path)
.config("spark.executor.extraClassPath", jar_path)
.enableHiveSupport()
.getOrCreate())
```

问题1: 为什么找不到classpath? 

1. 因为本地配置错误? 



线上运行

SparkConf配置jar参数, sql不含ADD JAR

```python
ss.sql("""CREATE TEMPORARY FUNCTION MostFreq22 AS 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF'""")
# ERROR
pyspark.sql.utils.AnalysisException: No handler for UDF/UDAF/UDTF 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF'; line 1 pos 7
```

猜想: handler



*第二种为register*

```python
ss.udf.registerJavaUDAF("MostFreq22", "com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF")
# ERROR
pyspark.sql.utils.AnalysisException: Can not load class com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF, please make sure it is on the classpath
```

线上运行

```
# ERROR
pyspark.sql.utils.AnalysisException: class com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF doesn't implement interface UserDefinedAggregateFunction
```





### 好像pyspark3.x和hive不支持Aggx

pyspark.sql.udf.UDFRegistration.registerJavaUDAF

https://github.com/apache/spark/blob/master/sql/core/src/test/java/test/org/apache/spark/sql/MyDoubleAvg.java

```python
    def registerJavaUDAF(self, name, javaClassName):
        """Register a Java user-defined aggregate function as a SQL function.

        .. versionadded:: 2.3.0

        name : str
            name of the user-defined aggregate function
        javaClassName : str
            fully qualified name of java class

        Examples
        --------
        >>> spark.udf.registerJavaUDAF("javaUDAF", "test.org.apache.spark.sql.MyDoubleAvg")
        ... # doctest: +SKIP
        >>> df = spark.createDataFrame([(1, "a"),(2, "b"), (3, "a")],["id", "name"])
        >>> df.createOrReplaceTempView("df")
        >>> q = "SELECT name, javaUDAF(id) as avg from df group by name order by name desc"
        >>> spark.sql(q).collect()  # doctest: +SKIP
        [Row(name='b', avg=102.0), Row(name='a', avg=102.0)]
        """

        self.sparkSession._jsparkSession.udf().registerJavaUDAF(name, javaClassName)

```





## scala调用

```scala
spark.sql("""CREATE TEMPORARY FUNCTION MostFreq22 AS 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF' USING JAR '/Users/wangke/working/bussiness_data_offline/target/bussiness_data_offline_1.0.9_shaded.jar'""")
# ERROR
Exception in thread "main" org.apache.spark.sql.AnalysisException: No handler for UDF/UDAF/UDTF 'com.company.strategy.rank.bussiness.util.udf.MostFreqUDAF'; line 1 pos 7
```

## 结论

1. hive和pyspark目前并不能直接register继承`Aggregator`实现的UDAF(version3.1), 只有java/scala支持, 且注册为`spark.udf.register("MostFreq22", functions.udaf(MostFreq))`
2. hive是支持继承类UserDefinedAggregateFunction的
3. 是否可以添加转化使得pyspark和hive支持Aggregator? 没有成功!

```scala
object UDFHandler {
    def evaluate(): UserDefinedFunction = {
        functions.udaf(MostFreq)
    }
}
```

```python
java_import(sc._gateway.jvm, "com.company.strategy.rank.bussiness.util.udf.UDFHandler")
print(type(sc._gateway.jvm.com.company.strategy.rank.bussiness.util.udf.UDFHandler))
inst = sc._gateway.jvm.com.company.strategy.rank.bussiness.util.udf.UDFHandler()
ss.udf.register("MostFreq22", inst.evaluate)
# ERROR
py4j.Py4JException: Constructor com.company.strategy.rank.bussiness.util.udf.UDFHandler([]) does not exist
```

## 引用

### 开发参考

1. https://spark.apache.org/docs/3.1.1/sql-ref-functions-udf-aggregate.html
2. https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/sql/UserDefinedUntypedAggregation.scala
3. https://stackoverflow.com/a/66819248/6494418
4. https://docs.databricks.com/spark/latest/spark-sql/udaf-scala.html
5. https://blog.csdn.net/Bayerngu/article/details/118035754 handler?
6. https://stackoverflow.com/questions/67776394/no-handler-for-udf-udaf-udtf-spark-udf3 handler by 继承

### 待回答问题

https://stackoverflow.com/questions/73327627/spark-custom-aggregator-register-and-invoke-through-pyspark


[TOC]





## spark UDF different with hive UDF

spark UDF的使用和hive UDF是不一样的

在spark中, 直接在SparkSession中注册(register)即可使用

在hive中, java/scala和python也略有不同

其中java/scala直接通过类进行注册, 然后直接构造函数进行使用

```sql
CREATE TEMPORARY FUNCTION TopFreq AS 'com.bj58.strategy.rank.zhaopin.util.udf.TopFreq' USING JAR '/Users/wangke/working/zhaopin_data_offline/target/zhaopin_data_offline_1.0.9_shaded.jar
```

python看着略微复杂一些

```sql
add file wasbs:///hiveudf.py;

SELECT TRANSFORM (clientid, devicemake, devicemodel)
    USING 'python hiveudf.py' AS
    (clientid string, phoneLabel string, phoneHash string)
FROM hivesampletable
ORDER BY clientid LIMIT 50;
```

其中, python的实现为

```python
import sys

for line in sys.stdin:
   line = line.strip()
   (emp_id,emp_name) = line.split('\t')
   print(emp_id + '\t' + emp_name + '，亲')
```



### refs

https://github.com/zpz/hive-udf
http://xueai8.com/course/178/article
https://cloud.tencent.com/developer/article/1571103
https://dp.58corp.com/data-develop/udf-manager
https://spark.apache.org/docs/3.1.1/sql-ref-functions-udf-hive.html
https://spark.apache.org/docs/latest/sql-ref-functions-udf-hive.html
https://stackoverflow.com/a/52038422/6494418
https://learn.microsoft.com/en-us/azure/hdinsight/hadoop/python-udf-hdinsight 推荐

saprk的udf和hive的udf是区别的, hive的udf需要使用类进行注册(python使用文件)
而spark直接注册方法就可以了

