# KNN算法的C语言实现

## k-NN(k-Nearest Neighbors) k-近邻算法

概述

- k-近邻算法采用测量不同的特征值之间的距离方法进行分类

k-近邻算法的一般流程

1. 收集数据：可以使用任何方法
2. 准备数据：距离计算所需要的数值，最好是结构化的数据格式
3. 分析数据：可以使用任何方法
4. 训练算法：此步骤不适用于k-近邻算法
5. 测试算法：计算错误率
6. 使用算法：首先需要输入样本数据和结构化的输出结果，然后使用k-近邻算法判定输入数据分别属于哪个分类，最后应用对计算出的分类执行后续的处理

对未知类别属性的数据集中的每个点依次执行以下操作

1. 计算已知类别数据集中的点与当前点的距离
2. 按照距离递增次序排序
3. 选取与当前点距离最小的k个点
4. 确定前k个点所在类别的出现频率
5. 返回前k个点出现频率最高的类别作为当前点的预测分类

### 按照上述步骤，可以实现k-近邻算法

#### k-近邻算法的C语言实现

``` c
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define SIZE_ATTR 3 /* 属性维度 */
#define SIZE_TRAIN 500 /* 训练集大小 */
#define SIZE_TEST 500 /* 测试集大小 */
#define K 7 /* 所选k值 */

#define FILE_TRAIN "train.txt"

/* 记录所构成的结构体变量 */
typedef struct _DataVector {
	int id; /* 标号 */
	float attr[SIZE_ATTR]; /* 属性 */
	int label; /* 类别 */
} DataVector;

/* 把记录中的属性换成距离后的结构体变量 */
typedef struct _DistanceVector {
	int id; /* 标号 */
	int label; /* 类别 */
	float distance; /* 距离 */
} DistanceVector;

/* 属性的结构体变量
可以先对属性值做一个分析，再做下一步针对性处理（如归一化特征值处理） */
typedef struct _AttrValue {
	float max; /* 属性的最大值 */
	float min; /* 属性的最小值 */
	float length; /* 属性的长度 */
} AttrValue;

/* 定义全局变量 */
DataVector trainSet[SIZE_TRAIN]; /* 训练集 */
DataVector testSet[SIZE_TEST]; /* 测试集 */
DistanceVector knn[SIZE_TRAIN]; /* 距离存储 */
AttrValue av[SIZE_ATTR]; /* 属性的属性 */

/* 从文件中加载数据到内存 */
void loadDataFromFile(FILE *fp, char *fileName, DataVector *dv, int length) {
	int i, j;

	if ((fp = fopen(fileName, "r")) == NULL) {
		printf("open \"%s\" failured!/n", fileName);
		exit(1);
	}
	for (i = 0; i < length; ++i) {
		for (j = 0; j < SIZE_ATTR; ++j) {
			fscanf(fp, "%f ", &dv[i].attr[j]);
		}
		fscanf(fp, "%d\n", &dv[i].label);
	}
	fclose(fp);
}

/* 准备数据 */
void loadData() {
	FILE *fp = NULL;

	loadDataFromFile(fp, FILE_TRAIN, trainSet, SIZE_TRAIN);
	loadDataFromFile(fp, FILE_TRAIN, testSet, SIZE_TEST);

	printf("loading data success!\n");
}

/* 数据分析（预处理）
计算每个属性长度，为归一化特征值准备 */
void preProcess() {
	int i, j;

	/* 初始化 */
	for (i = 0; i < SIZE_ATTR; ++i) {
		av[i].max = trainSet[0].attr[i];
		av[i].min = trainSet[0].attr[i];
	}
	/* 计算属性最大最小值 */
	for (i = 0; i < SIZE_TRAIN; ++i) {
		for (j = 0; j < SIZE_ATTR; ++j) {
			if (trainSet[i].attr[j] > av[j].max) {
				av[j].max = trainSet[i].attr[j];
			} else if (trainSet[i].attr[j] < av[j].min) {
				av[j].min = trainSet[i].attr[j];
			}
		}
	}
	/* 计算属性长度 */
	for (i = 0; i < SIZE_ATTR; ++i) {
		av[i].length = av[i].max - av[i].min;
	}
}

/* 归一化特征值
公式：newValue = (oldValue - min) / (max - min) */
float autoNorm(float oldValue, AttrValue *av) {
	return (oldValue - (av->min)) / (av->length);
}

/* 距离计算
这里计算的是欧式距离 */
float calcDistance(DataVector d1, DataVector d2) {
	float sum = 0.0;
	float newValue;
	int i;

	for (i = 0; i < SIZE_ATTR; ++i) {
		newValue = autoNorm((d1.attr[i] - d2.attr[i]), av+i);
		sum += newValue * newValue;
	}
	return (float) sqrt(sum);
}

/* 把每个数据的属性向量转化为距离 */
void transDistance(DataVector dv) {
	int i;

	for (i = 0; i < SIZE_TRAIN; ++i) {
		/* 对距离进行赋值 */
		knn[i].id = i;
		knn[i].label = trainSet[i].label;
		knn[i].distance = calcDistance(trainSet[i], dv);
	}
}

/* 对所有距离进行排序，选取距离最小的k个数据向量（此处使用直接选择排序） */
void knnSort() {
	int i, j, k;
	DistanceVector temp;

	for (i = 0; i < K; ++i) {
		k = i;
		/*  从无序序列中挑出一个最小的元素 */
		for (j = i + 1; j <= SIZE_TRAIN; ++j) {
			if (knn[k].distance > knn[j].distance) {
				k = j;
			}
		}
		temp = knn[i];
		knn[i] = knn[k];
		knn[k] = temp;
	}
}

/* 预测分类 */
int forecastClassification() {
	int freq[K] = {0};
	int maxFreq = 0;
	int i, j, k = 0;

	/* 确定前k个点所在类别出现的概率
	这里有点欠妥，因为分类最多能出现k个，出现了重复类别重复计算*/
	for (i = 0; i < K; ++i) {
		for (j = 0; j < K; ++j) {
			if (knn[j].label == knn[i].label) {
				freq[i]++;
			}
		}
	}
	/* 找到最大频率 */
	for (i = 0; i < K; ++i) {
		if (freq[i] > maxFreq) {
			maxFreq = freq[i];
			k = i;
		}
	}
	/* 得到最大频率的类别 */
	return knn[k].label;
}

/* 对测试数据进行测试 */
void test() {
	int i;
	int k = 0;

	loadData();
	preProcess();

	/* 对每一条测试数据进行计算 */
	for (i = 0; i < SIZE_TEST; ++i) {
		transDistance(testSet[i]);
		knnSort();
		if (testSet[i].label == forecastClassification()) {
			printf("1");
		} else {
			printf("0");
			++k;
		}
	}
	printf("\nTest end, wrong time is %d, the correct rate is %.2f%%\n", k, (float) (SIZE_TEST - k)/SIZE_TEST*100);
}

void main() {
	test();
	system("pause");
}
```

参考资料

- 机器学习实战. Peter Harrington

测试材料

- 机器学习实战源代码/Ch02/datingTestSet2.txt


另外，代码还有许多可以改进之处，比如当所取K值为偶数时，预测概率为50%时的下一步处理等
