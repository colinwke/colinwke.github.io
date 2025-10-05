# 五月阅读




## 2019-5-12

最近计划学习一下深度学习框架, kaggle是个不错的平台, 就找了其中的比赛[Jigsaw Unintended Bias in Toxicity Classification](<https://www.kaggle.com/c/jigsaw-unintended-bias-in-toxicity-classification>). 在比赛的第四段, 描述了比赛的背景, 和技术中存在的问题:

> Here’s the background: When the Conversation AI team first built toxicity models, they found that the models [incorrectly learned to associate](https://medium.com/the-false-positive/unintended-bias-and-names-of-frequently-targeted-groups-8e0b81f80a23) the names of frequently attacked identities with toxicity. Models predicted a high likelihood of toxicity for comments containing those identities (e.g. "gay"), even when those comments were not actually toxic (such as "I am a gay woman"). This happens because training data was pulled from available sources where unfortunately, certain identities are overwhelmingly referred to in offensive ways. Training a model from data with these imbalances risks simply mirroring those biases back to users.
>
> 谷歌翻译: 以下是背景：当对话AI团队首次构建毒性模型时，他们发现模型错误地学会将频繁攻击身份的名称与毒性联系起来。模型预测含有这些身份（例如“同性恋”）的评论很可能具有毒性，即使这些评论实际上并不具有毒性（例如“我是同性恋女性”）。发生这种情况是因为训练数据是从可用来源中提取的，不幸的是，某些身份以令人反感的方式被压倒性地提及。从具有这些不平衡的数据中训练模型可能会将这些偏差反映回用户。

简单说来就是大样本覆盖小样本的问题, 也是高频扰乱低频的问题, 这个问题在大多数场景都是存在的, 例如在淘宝购物中, 食品类的产品买了又买, 且一次也可以买多件, 但是对于电器类的产品, 一次一般只买一件, 且买了后很长一段时间都不会再买. 通常包含了这两个类品的数据构建模型时, 高频的数据就会对低频的数据造成影响.

这从另一个方面也反应了模型的偏差和方差问题, 也是过拟合和欠拟合问题, 对于"电器"和"食品"的分类, 可以考虑分开建模的方法, 即食品单独建一个模型, 电器单独建一个模型, 或者设置加权的损失函数.

似乎电器和食品的例子和这个比赛也有不同, 这个比赛是关于一个词语的偏差, 可能在比赛中还是更应该注意偏差和方差, 还有评价指标的设定(召回还是精确).
