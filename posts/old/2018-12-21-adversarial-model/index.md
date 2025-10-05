# adversarial-model


## 损失函数

在GAN中, Adversarial Model的功能是判别样本是否来自于Generative Model.

而Generative Model的目标是最大化的混淆Adversarial Model.



判别模型的目标函数
$$
\max_{ D } E_{ x \sim P_{ r } } [ \log D ( x ) ] + E_{ x \sim P_{ g } } [ \log ( 1 - D ( x ) ]
$$
这难道不是最大化判别模型交叉熵损失吗?

但是, 当最大化交叉熵损失的时, 也就是全部样本分错的情况, 也不能混淆对抗模型呢?

事实上, GAN的目标函数就是交叉熵损失!
$$
H ( p , q ) = - \sum _ { i } p _ { i } \log q _ { i } = - y \log \hat { y } - ( 1 - y ) \log ( 1 - \hat { y } )
$$

- $x \sim P _ { r }$ 对应着$y$, 对应着$1 - y$

- 最小化交叉熵损失, 就是最大化对抗损失的负数



再来看看GAN的目标函数

> D and G play the following two-player minimax game with value function $V (G; D)$

$$
\min _ { G } \max _ { D } V ( D , G ) = \mathbb { E } _ { \boldsymbol { x } \sim p _ { \text { data } } ( \boldsymbol { x } ) } [ \log D ( \boldsymbol { x } ) ] + \mathbb { E } _ { \boldsymbol { z } \sim p _ { \boldsymbol { z } } ( \boldsymbol { z } ) } [ \log ( 1 - D ( G ( \boldsymbol { z } ) ) ) ]
$$
为了表现出交叉熵的形式, 可以变形为
$$
\max _ { G } \min _ { D } V ( D , G ) = - \mathbb { E } _ { \boldsymbol { x } \sim p _ { \text { data } } ( \boldsymbol { x } ) } [ \log D ( \boldsymbol { x } ) ] - \mathbb { E } _ { \boldsymbol { z } \sim p _ { \boldsymbol { z } } ( \boldsymbol { z } ) } [ \log ( 1 - D ( G ( \boldsymbol { z } ) ) ) ]
$$

- 当更新G的时候, 使该目标函数最大! 也就是G尽量的混淆D
- 当更新D的时候, 使该目标函数最小! 也就是D尽量的判别G



## 最大化混淆和最大化损失

当更新G的时候, 需要最大化损失函数

但是, 不是全部分错的时候损失函数函数最大吗? 但是这个时候也不能混淆D呀!

这个时候, 因为只考虑了G, 而没有考虑D!

结合目标函数的交叉熵损失形式

- 当更新G时, 固定D, G的目的是最大化分错, 因此我们需要最大化交叉熵损失

- 当更新D时, 固定G, D的目的是最大化辨别, 因此我们需要最小化交叉熵损失

然后这两个模型就开始推太极了(two-player-game), 对于一个生成的样本, 其真实标记为1

- 当更新G时, 固定D, G的目的是最大化分错, 让D预测的标记趋近于0
- 当更新D时, 固定G, D的目的是最大化辨别, 让D预测的标记趋近于1

然后两兄弟开始推太极, 最后收敛到了0.5

---

## refs

- https://blog.csdn.net/u010089444/article/details/78946039















