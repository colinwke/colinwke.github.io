# 谈一谈熵


在迁移学习中, 领域判别损失如下:

![1543385011496](assets/cross-entropy-loss/1543385011496.png)

咋一看还看不懂了, 交叉熵损失也就是logloss不是这个样子的吗:

$$
H(x)\ =\ -\sum_{i}p_{i}\log q_{i}\ =\ -y\log{\hat{y}}-(1-y)\log(1-{\hat{y}})
$$
其实也是啊, 可以从两个角度进行解释:

首先

- 在Logistic Regression的公式推导中, 是使用的最大似然的对数**取反**来作为的损失, 也就是**负的极大似然的对数**.

其次

- 可以从熵的角度进行解释, 对于二分类任务来讲, 真实标记为类别, 预测的结果为概率, 因此为两个类别预测的熵.

## 交叉熵损失是熵吗?



显然不是, 熵可没有真实的标记!

交叉熵损失可以衡量两个分布的距离, 在二分类中, 一个分布为预测的概率, 一个分布为真实的标记.



## 这篇文章写得不错!

### 信息量

一个事件x的信息量是：
$$
I(x)=-log(p(x))
$$
解读：如果一个事件发生的概率越大，那么信息量就越小。如果是1，也就是100%发生，那么信息量为0。

### 熵

![img](assets/cross-entropy-loss/Binary_entropy_plot.svg.png)

是对信息量求期望值。
$$
H(X)=E[I(x)]=-\sum\limits_{x∈X}p(x)\log p(x)
$$
举例： 如果10次考试9次不及格，一次及格。 假设事件为xAxA代表及格事件，那么这个事件的熵为：
$$
H_A(x)=-[p(x_A)\log(p(x_A))+(1-p(x_A))\log(1-p(x_A))]=0.4690
$$
其实也和后续的逻辑回归的二分类的损失函数有类似。

### KL散度

相对熵(relative entropy)又称为KL散度（Kullback-Leibler divergence），KL距离，是两个随机分布间距离的度量。记为DKL(p||q)。它度量当真实分布为p时，假设分布q的无效性。
$$
\displaylines{
\begin{align}
D_{KL}(p||q)&=E_p[\log \frac{p(x)}{q(x)}]=\sum\limits_{x∈\mathcal{X}} p(x)\log \frac{p(x)}{q(x)} \\\\
 &= \sum\limits_{x∈\mathcal{X}} [p(x)\log p(x)-p(x)\log q(x)]\\\\
 &= -H(p)-\sum\limits_{x∈\mathcal{X}} p(x)\log q(x)\\\\
 &= -H(p)+E_p[-\log q(x)]
\end{align}
}
$$
当p=q的时候，散度为0.

### 交叉熵

假设有两个分布p，q，则它们在给定样本集上的交叉熵定义如下：
$$
\begin{align*}
CrossEntropy(p,q)&=E_p[-\log q]\\\\
&=-\sum\limits_{x∈\mathcal{X}} p(x)\log q(x)\\\\
&=H(p)+D_{KL}(p||q)
\end{align*}
$$
当p分布是已知，则熵是常量；于是交叉熵和KL散度则是等价的。最小化交叉熵等价于最小化KL距离。

### 对应到logistic regression

在逻辑回归中我们用交叉熵来定义损失函数的。那么来再推导一次。详细参考：
https://blog.csdn.net/iterate7/article/details/78992027
p:真实样本分布，服从参数为p的0-1分布，即X~B(1,p)
q:待估计的模型，服从参数为q的0-1分布，即X~B(1,q)

0-1分布，我们把其中一种事件的结果发生的概率定为p，那么另一种结果的概率就是1-p，两者的概率和是1.[贝努力分布]

$$
\begin{align*}
CrossEntropy(p,q)&=-\sum\limits_{x∈\mathcal{X}} \textbf{p(x)}\log \textbf{q(x)} \\\\
&=-[P_p(x=1)\log P_q(x=1)+P_p(x=0)\log P_q(x=0)]\\\\
&=-[p\log q+(1-p)\log (1-q)]\\\\
&=-[\textbf{y}\log \textbf{h}_{\theta}(x)+(1-\textbf{y})\log (1-\textbf{h}_{\theta}(x))] \\\\
\end{align*}
$$
这里q则是假设函数。

对所有的训练样本平均值交叉熵为：
$$
J = -\frac{1}{m}\sum\limits_{i=1}^m[y^{(i)}\log h_{\theta}(x^{(i)})+(1-y^{(i)})\log (1-h_{\theta}(x^{(i)}))]
$$

### 总结

信息量代表的是一种不确定性；
熵代表的是不确定性的期望值；
确定的事件的熵为0；
KL散度代表的是利用熵的概念来表示分布之间的距离；
交叉熵等价于KL散度；熵是常量，因为训练数据的分布已知。
在逻辑回归中用交叉熵作为损失函数的原因是：交叉熵可以等价于KL散度；交叉熵越小，则p和q分布差异越小，拟合更好。
用最大似然方法推导的损失函数和最大熵的方式结果是一致的，最大似然方法的推导可以参考：https://blog.csdn.net/iterate7/article/details/78992027
实际中，选用交叉熵易于计算。

### 引用

https://blog.csdn.net/iterate7/article/details/78992027

https://en.wikipedia.org/wiki/Cross_entropy

https://www.zhihu.com/question/65288314/answer/244601417




