# dropout笔记


## 原理

dropout原理, 随机丢弃一些(输入)神经元, 防止参数过拟合

> Applies Dropout to the input.
>
>   Dropout consists in randomly setting a fraction `rate` of input units to 0
>   at each update during training time, which helps prevent overfitting.
>   The units that are kept are scaled by `1 / (1 - rate)`, so that their
>   sum is unchanged at training time and inference time.



## 核心实现

```python
# tensorflow.python.ops.nn_ops.dropout_v2 ln:4174
noise_shape = _get_noise_shape(x, noise_shape)
# Sample a uniform distribution on [0.0, 1.0) and select values larger than
# rate.
#
# NOTE: Random uniform actually can only generate 2^23 floats on [1.0, 2.0)
# and subtract 1.0.
random_tensor = random_ops.random_uniform(
    noise_shape, seed=seed, dtype=x.dtype)
keep_prob = 1 - rate
scale = 1 / keep_prob
# NOTE: if (1.0 + rate) - 1 is equal to rate, then we want to consider that
# float to be selected, hence we use a >= comparison.
keep_mask = random_tensor >= rate
ret = x * scale * math_ops.cast(keep_mask, x.dtype)
if not context.executing_eagerly():
    ret.set_shape(x.get_shape())
    return ret
```



这里并没有`mode==training`了, 返回到上上一层调用, 可以看到mode

```python
# tensorflow.python.keras.layers.core.Dropout.call
def call(self, inputs, training=None):
  if training is None:
    training = K.learning_phase()

  def dropped_inputs():
    return nn.dropout(
        inputs,
        noise_shape=self._get_noise_shape(inputs),
        seed=self.seed,
        rate=self.rate)

  output = tf_utils.smart_cond(training,
                               dropped_inputs,
                               lambda: array_ops.identity(inputs))
  return output
```

综合上面来看, tensorflow dropout的处理方法是在`训练的时候`按照dropout(`rate`)丢弃一些神经元, 丢弃后, 然后在整体上, 又乘以一个scale(` = 1 / keep_prob, keep_prob = 1 - rate`), 所以在预估的时候是不需要做任何处理的.

所以在训练时, 一定要加`training=True or False`?

但是, 这里有一个判定是否是`learning_phase`, 所以, 其实不传也没有问题?

```py
# tensorflow.python.keras.layers.core.Dropout.call ln:149
  def call(self, inputs, training=None):
    if training is None:  # -- see me
      training = K.learning_phase()

    def dropped_inputs():
      return nn.dropout(
          inputs,
          noise_shape=self._get_noise_shape(inputs),
          seed=self.seed,
          rate=self.rate)

    output = tf_utils.smart_cond(training,
                                 dropped_inputs,
                                 lambda: array_ops.identity(inputs))
```

这里可能是错误的, `tf_utils.smart_cond`根据`training`进行下一步调用, 如果第一个参数是`phase_pred`则调用第一个方法(`dropped_inputs`), 否则调用第二个方法(`lambda: array_ops.identity(inputs)`)

## 问题思考

dropout是防止下层参数的过拟合还是上层参数的过拟合呢?

- 按照上面的分析, 可以理解为dropout随机丢弃一些输入, 因此在一定程度上防止下层参数的过拟合

每一层参数都需要dropout来防止过拟合吗?

- 换个角度就是每层都有可能过拟合吗? 这里需要回到dropout在集成学习上的原理, 通过随机丢弃神经元, dropout可以看做是多个网络模型的组合, 当有n个神经元的输入设置dropout=0.5时, 网络相当于有2^n种结构的集成, 因此, 当有dropout输入的神经元越多, 网络的集成度就约复杂, 越能防止过拟合, 这个还要根据实际数据情况设置

是否可以对参数进行dropout?

- 可以是可以, 但是对参数进行dropout后, 对于同一个batch数据, 缺失的特征列都是一样的了, 这样对模型的训练与预估势必会有一些影响
