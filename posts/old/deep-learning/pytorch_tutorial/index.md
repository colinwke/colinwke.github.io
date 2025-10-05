# pytorch tutorial


tutorial 地址: [pytorch: Training a Classifier](https://pytorch.org/tutorials/beginner/blitz/cifar10_tutorial.html).

当使用新的数据集进行测试时, 出现的问题及解决的方法.

## Problem 1

error:

``` python
RuntimeError: invalid argument 0: Sizes of tensors must match except in dimension 0. Got 484 and 549 in dimension 2 at /pytorch/aten/src/TH/generic/THTensorMath.cpp:3616
```

location:

``` python
images, labels = data_iter.next()
```

solution:

``` python
数据集中的图像大小不一致.
需要使用`transforms.Resize([height, width])`把所有图像缩放到同一大小.
```

## Problem 2

error:

``` python
RuntimeError: invalid argument 2: size '[-1 x 400]' is invalid for input with 719104 elements at /pytorch/aten/src/TH/THStorage.cpp:80
```

location:

``` python
x = x.view(-1, 16 * 5 * 5)
```

solution:

``` python
`Tensor.view()` 相当于 `numpy.reshape()` 方法, 即重塑形状.
其中`-1`表示依据其他维度进行推理得出的维度.
这里的参数需要计算得出, 不同的输入尺寸需要计算对应的参数!
---
我们来计算一下, 计算公式见下面的图片.
---
input size = 3*32*32
-
class Net_t1(nn.Module):
    def __init__(self):
        super(Net_t1, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)

    def forward(self, x):
        x = F.relu(self.conv1(x))
        x = self.pool(x)
        x = F.relu(self.conv2(x))
        x = self.pool(x)
        x = x.view(-1, 16 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x
-
1 torch.Size([4, 6, 28, 28]), conv1, (32 - 5) / 1 + 1 = 28, padding=0
2 torch.Size([4, 6, 14, 14]), pool, 28 / 2 = 14
3 torch.Size([4, 16, 10, 10]), conv2, (14 - 5) / 1 + 1 = 10, padding=0
4 torch.Size([4, 16, 5, 5]), pool, 10 / 2 = 5
5 torch.Size([4, 400]), view, 16 * 5 * 5 = 400
6 torch.Size([4, 120]), full_connect
7 torch.Size([4, 84]), full_connect
8 torch.Size([4, 10]), full_connect
---
input size = 3*224*224
-
class Net_t2(nn.Module):
    def __init__(self):
        super(Net_t2, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 53 * 53, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 31)

    def forward(self, x):
        x = F.relu(self.conv1(x))
        x = self.pool(x)
        x = F.relu(self.conv2(x))
        x = self.pool(x)
        x = x.view(-1, 16 * 53 * 53)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x
-
1 torch.Size([4, 6, 220, 220]), conv1, (224 - 5) / 1 + 1 = 220, padding=0
2 torch.Size([4, 6, 110, 110]), pool, 220 / 2 = 110
3 torch.Size([4, 16, 106, 106]), conv2, (110 - 5) / 1 + 1 = 106, padding=0
4 torch.Size([4, 16, 53, 53]), pool, 106 / 2 = 53
5 torch.Size([4, 44944]), view, 16 * 53 * 53 = 44944
6 torch.Size([4, 120]), full_connect
7 torch.Size([4, 84]), full_connect
8 torch.Size([4, 31]), full_connect
```

![1540383351683](assets/pytorch_tutorial/1540383351683.png)

## Problem 3

error:

``` python
RuntimeError: Assertion `cur_target >= 0 && cur_target < n_classes' failed.  at /pytorch/aten/src/THNN/generic/ClassNLLCriterion.c:93
```

location:

``` python
loss = criterion(outputs, labels)
```

solution:

``` python
预测的标签向量和实际的标签向量维度不一致!
设置输出层(最后一层)神经元个数为真实的标签个数.
```

## Problem 4

error:

``` python
RuntimeError: Expected object of type torch.FloatTensor but found type torch.cuda.FloatTensor for argument #2 'weight'
```

location:

``` python
net = Net().to(device)
```

solution:

``` python
在做计算时, 需要把所有需要计算的量都放在`device`上面. 因此不仅网络需要放在`device上面`, `inputs`和`labels`也要放在`device`上面.
```

## 其他

1. `torchvision.datasets.ImageFolder()`会自动加载标签信息.
   - 可以通过上述语句返回的对象调用`len(dataset)`返回样本个数, 调用`dataset.classes`返回标签集合.

# 2018-10-30

## pytorch中的可训练性设置

在代码中看到两种设置

```python
# method 1
for param in base_network.parameters():
    param.requires_grad = False
# method 2
base_network.train(False)
```

字面意思都是不训练`base_network`, 但是两个训练的结果不同.

### requires_grad

- 是pytorch中变量自动求导的一个属性[[AUTOGRAD MECHANICS]](https://pytorch.org/docs/master/notes/autograd.html).
- 当设置为`False`时, 反向传播时不使用梯度更新变量.
- 他的作用是用来冻结模型中的部分(freeze part of your model).

### Module.train(mode)

![1540889233643](assets/pytorch_tutorial/1540889233643.png)

[pytorch doc: Module.train(mode)](https://pytorch.org/docs/master/nn.html#torch.nn.Module.train)

针对于特有模型的特有表现, 比如`Dropout`, `BathNorm`等模型中, 不是需要梯度更新的参数(Dropout: mean, std).

> Even the parameters are the same, it doesn’t mean the inferences are the same.
>
> For dropout, when `train(True)`, it does dropout; when  `train(False)` it doesn’t do dropout (identitical output).
>
> And for batchnorm, `train(True)` uses batch mean and batch var; and `train(False)` use running mean and running var.  [[link]](https://discuss.pytorch.org/t/model-train-true-and-model-train-false-give-different-results-for-the-same-input/5825/2)
>
> For dropout (there’s even no parameter in dropout), the dropout position is changing when train is True.
> For BatchNorm, the `train(True)` will use the batch norm instead of `running_mean` and `running_var` and also `running_mean` and `running_var` will also change. [[link]](https://discuss.pytorch.org/t/model-train-true-and-model-train-false-give-different-results-for-the-same-input/5825/8)
>
> A layer doesn’t have `requires_grad`, only Variables have. `running_mean` and `running_var` are buffers, and are updated during forwarding. I assume `train(True)` will still use the batch mean and batch var. [[link]](https://discuss.pytorch.org/t/model-train-true-and-model-train-false-give-different-results-for-the-same-input/5825/6)

### 如何固定预训练的ResNet

> I am wondering whether to set `.eval()` for those frozen layers since it may still update its running mean and running var. [[link]](https://discuss.pytorch.org/t/how-the-pytorch-freeze-network-in-some-layers-only-the-rest-of-the-training/7088/4)
>
> Setting `.requires_grad = False` should work for convolution and FC layers. But how about networks that have instanceNormalization? Is setting `.requires_grad = False` enough for normalization layers too? [[link]](https://discuss.pytorch.org/t/how-the-pytorch-freeze-network-in-some-layers-only-the-rest-of-the-training/7088/7)

当需要固定要预训练的ResNet, 相当于只做预测任务. 因此只需把模型的状态设置为`.eval()`即可.

``` python
for k in range(200):
    # Make a prediction based on the current network weights
    net.train() # Set to training mode
    pred_tr = net.forward(z_tr) # Pass in input
    loss_tr = lossfn(pred_tr, y_tr) # Compute error between prediction and target

    # Optimize
    optimizer.zero_grad()  # zero the gradient buffers
    loss_tr.backward()     # Run a backward pass through the network
    optimizer.step()       # Update your network parameters

    # Display loss & results on test data
    net.eval() # Set to eval mode
    pred_te = net.forward(z_te)
    loss_te = lossfn(pred_te, y_te) # Compute error between prediction and target
    print('Iter: {}, Training loss: {}, Test loss: {}'.format(k, loss_tr.data[0], loss_te.data[0]))
# ref: https://courses.cs.washington.edu/courses/cse490r/18wi/lecture_slides/02_16/pytorch-tutorial.py
```

refs:

- https://stackoverflow.com/a/48270921/6494418
- https://stackoverflow.com/questions/50233272/pytorch-forward-pass-changes-each-time
- https://discuss.pytorch.org/t/batchnorm-eval-cause-worst-result/15948/6
- https://github.com/bethgelab/foolbox/issues/74
- https://courses.cs.washington.edu/courses/cse490r/18wi/lecture_slides/02_16/pytorch-tutorial.py

[pytorch save model](https://stackoverflow.com/questions/42703500/best-way-to-save-a-trained-model-in-pytorch)

# 2018-10-31

1. 当数据为图片时, 并且图片的标签是按照文件夹表示的, 使用`torchvision.datasets.ImageFolder()`读取数据后, 使用`torch.utils.data.DataLoader()`配置数据时, 一定要加入参数`shuffle=True`, 不然网络无法训练! 因为一个批量数据中可能就只有一个类别, 无法反向传播, 致使参数不下降, 或者为nan.
2. 若使用GPU进行训练, 在读取`DataLoader`时, 把数据加载到GPU, 而不是在iteration时加入GPU, 将大大提升运行时间!



# 2018-11-13

tensor() 是不能直接和int, 等非tensor类型计算的, 计算结果会成0



# 2018-11-16

## [官网教程](https://pytorch.org/tutorials/beginner/deep_learning_60min_blitz.html)

### pytorch是什么?

基于python的科学计算工具包:

- 基于GPU计算的numpy的替代物
- 深度学习研究平台

#### tensor

就是numpy的`ndarray`, 不同之处在于基于GPU的tensor能加速计算.

> `torch.Tensor` is the central class of the package. If you set its attribute `.requires_grad` as `True`, it starts to track all operations on it. When you finish your computation you can call `.backward()` and have all the gradients computed automatically. The gradient for this tensor will be accumulated into `.grad` attribute.

- Tensor是核心的数据结构
- `.requires_grad`用来追踪Tensor是否需要计算每个算子的梯度
- `.backward()`用来计算梯度

#### function

Tensor和Function是相互联系的, 构成了一个非循环图, 它编码了完整的计算历史.

#### autograd

pytorch中所有神经网络的核心是autograd.

#### gradient

反向传播(backprop)阶段, 损失是一个标量(scalar)

- 因为损失函数也是计算图中的一部分(最上层部分), 然后通过梯度分布在各个label上

### neural networks

> A typical training procedure for a neural network is as follows:
>
> - Define the neural network that has some learnable parameters (or weights)
> - Iterate over a dataset of inputs
> - Process input through the network
> - Compute the loss (how far is the output from being correct)
> - Propagate gradients back into the network’s parameters
> - Update the weights of the network, typically using a simple update rule: `weight = weight - learning_rate* gradient`

#### define the networks

> You just have to define the `forward` function, and the `backward` function (where gradients are computed) is automatically defined for you using `autograd`. You can use any of the Tensor operations in the `forward` function.

#### basic classes

>**Recap:**
>
>- `torch.Tensor` - A *multi-dimensional array* with support for autograd operations like `backward()`. Also *holds the gradient* w.r.t. the tensor.
>- `nn.Module` - Neural network module. *Convenient way of encapsulating parameters*, with helpers for moving them to GPU, exporting, loading, etc.
>- `nn.Parameter` - A kind of Tensor, that is *automatically registered as a parameter when assigned as an attribute to a*`Module`.
>- `autograd.Function` - Implements *forward and backward definitions of an autograd operation*. Every `Tensor`operation, creates at least a single `Function` node, that connects to functions that created a `Tensor` and *encodes its history*.

#### backprop

To backpropagate the error all we have to do is to `loss.backward()`. You need to clear the existing gradients though, else gradients will be accumulated to existing gradients.

Now we shall call `loss.backward()`, and have a look at conv1’s bias gradients before and after the backward.

``` python
net.zero_grad()     # zeroes the gradient buffers of all parameters
loss.backward()     # backprop, calculate gradients
optimizer.step()    # Does the update the weight
```

### training a classifier

代码框架:

1. loading and normalizing data
2. define the neural network
3. define loss function and optimizer
4. train the network
5. test the network

## [Github: pytorch-tutorial](https://github.com/yunjey/pytorch-tutorial)



# 2018-12-10

对于`tensor.detach()`的理解.

> pytorch想做**gpu加速**版的numpy，取代numpy在python中科学计算的地位。
>
> pytorch的python前端在竭力从语法、命名规则、函数功能上与numpy统一，加持的**自动微分**和**gpu加速**功能尽可能地在吸引更大范围内的python用户人群。
>
> [[Link](https://www.zhihu.com/question/305054691/answer/548005678)]

因此, 在使用pytorch的时候, 仅需要注意自动微分就行了!

而`tensor.detach()`就是解决禁用自动微分的方法[[Link](https://discuss.pytorch.org/t/clone-and-detach-in-v0-4-0/16861)].

- (与`tensor.clone()`区别, `tensor.clone()`保持了源`tensor`的`requires_grad`)

简单理解, 就是把计算图中的一部分拆解下来, 而这部分不需要自动微分.

**update**

作用: 利用`detach`截断梯度流[[Link](https://www.cnblogs.com/king-lps/p/8570021.html)]

- > 返回一个新变量，与当前计算图分离。结果将永远不需要改变。
  >
  > 如果输入是易失的，输出也将变得不稳定。
  >
  > **返回的 Variable 永远不会需要梯度**。

#### 参考:

- https://discuss.pytorch.org/t/clone-and-detach-in-v0-4-0/16861/2

- https://blog.csdn.net/u012436149/article/details/76714349
- https://blog.csdn.net/Hungryof/article/details/78035332



### torch.Tensor.register_hook[[link](https://pytorch.org/docs/stable/autograd.html#torch.Tensor.register_hook)]

> `register_hook`(*hook*)[[SOURCE\]](https://pytorch.org/docs/stable/_modules/torch/tensor.html#Tensor.register_hook)
>
> Registers a backward hook.
>
> The hook will be called every time a gradient with respect to the Tensor is computed. The hook should have the following signature:
>
> ```
> hook(grad) -> Tensor or None
> ```
>
> The hook should not modify its argument, but it can optionally return a new gradient which will be used in place of [`grad`](https://pytorch.org/docs/stable/autograd.html#torch.Tensor.grad).
>
> This function returns a handle with a method `handle.remove()` that removes the hook from the module.

登记一个钩子, 在**反向传播**是调用!

refs:

- https://discuss.pytorch.org/t/solved-reverse-gradients-in-backward-pass/3589
- https://discuss.pytorch.org/t/why-cant-i-see-grad-of-an-intermediate-variable/94

# 2018-12-13

- 比赛心得和pytorch（等）踩得坑[[Link](https://www.jianshu.com/p/95b6362f58e4)]

# 2018-12-14 20:35:33

在使用某个工具之前, 一定要先看看别人已经踩过那些坑.

比如说使用github上面的开源代码, 先要看看`issue`里面别人踩过的坑, 然后自己尽量避免, 或者早有准备.

知乎上有一个问题, 里面的回答也非常有建设性: [PyTorch 有哪些坑/bug？](https://www.zhihu.com/question/67209417)

里面的一些回答也非常的不错, 比如:

- [总结一个代码模板](https://www.zhihu.com/question/67209417/answer/268789688)



# 2019-1-7 22:08:19

又找到一个不错的教程

https://github.com/chenyuntc/pytorch-book

作者陈云, 北邮的研究生, 著有<深度学习框架PyTorch：入门与实践>, 热爱分享, 知乎和github都有不错的干货.



# 2019-1-9 17:14:17

https://mp.weixin.qq.com/s/mPmFOm32-ipbiIp8mPSd-A

黄海广老师对官网1.0版本教程的翻译



# 2019-1-13 15:31:59

在XXXLoss的前面不要加softmax?

有些损失需要加, 有些损失已经包含了softmax的计算.

具体来讲

- `nn.BCELoss`前面需要加`nn.Sigmoid()`, 并且输出一维向量
- `nn.BCEWithLogitsLoss`相当于(`nn.Sigmoid()` + `nn.BCELoss`), 因为损失函数包含了归一化
- `nn.CrossEntropyLoss`不需要加`nn.Softmax(dim=1)`, 因为损失函数里面包含了归一化

参考: [pytorch loss function 总结](https://blog.csdn.net/zhangxb35/article/details/72464152)



