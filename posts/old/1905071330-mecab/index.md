# mecab



wondows平台, pip安装MeCab:


```
pip install mecab-python3
```

出现问题:

```
 'mecab-config' 不是内部或外部命令，也不是可运行的程序或批处理文件。
```

![1552982337981](assets/1903191558-mecab/1552982337981.png)



在网上找了一些资料, 一些日文资料写的云里雾里的, 比如这篇[Windows環境でのMeCab(Python)のインストール(没有必要打开)](https://qiita.com/satetsu007/items/187e5a3f0ed0b898b152).

然后找到一篇中文的[windows10+py36+MeCab安装总结](https://blog.csdn.net/ZYXpaidaxing/article/details/81913708), 按照步骤安装成功!



===我是分割线===



上文的有些步骤可以精简, 具体步骤可以如下:



1 在pip安装之前, 需要先安装[MeCab.exe](https://taku910.github.io/mecab/#download)

![1552985336863](assets/1903191558-mecab/1552985336863.png)

懒得麻烦, [点我直接下载](https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7WElGUGt6ejlpVXc)



2 安装, 中间有个选择字典编码, 选择`UTF-8`

![1552985925895](assets/1903191558-mecab/1552985925895.png)

3 安装python依赖包

首先, 需要把MeCab安装路径下的`./bin/libmecab.dll`和`./sdk/libmecab.lib`拷贝到python的`./Lib/site-packages`下面.

然后, 就可以使用`pip install mecab-python-windows`安装依赖包了.



4 测试

```python
import MeCab
mecab = MeCab.Tagger("-Ochasen")  # `-Owakati` 只做分词
print(mecab.parse("pythonが大好きです"))
```



参考:

https://segmentfault.com/q/1010000015969023

https://blog.csdn.net/ZYXpaidaxing/article/details/81913708

https://www.jianshu.com/p/8f0ce2cff8d9

http://www.flickering.cn/nlp/2014/06/%E6%97%A5%E6%96%87%E5%88%86%E8%AF%8D%E5%99%A8-mecab-%E6%96%87%E6%A1%A3/





---

## MeCab使用

```python
# date: 2019/3/21 10:53
# author: wang ke
# concat: ke.wang@ctrip.com
# ================================

"""MeCab test.
---
MeCab output format(http://taku910.github.io/mecab/):
    -Owakati: only segment
        python が 大好き です
    -Ochasen: ChaSen compatible(segment and tag?)
        python	python	python	名詞-固有名詞-組織
        が	ガ	が	助詞-格助詞-一般
        大好き	ダイスキ	大好き	名詞-形容動詞語幹
        です	デス	です	助動詞	特殊・デス	基本形
        EOS
    -Oyomi: Yomi given(only translate?)
        pythonガダイスキデス
    -Odump: all information output
        0 BOS BOS/EOS,*,*,*,*,*,*,*,* 0 0 0 0 0 0 2 1 0.000000 0.000000 0.000000 0
        3 python 名詞,固有名詞,組織,*,*,*,* 0 6 1292 1292 45 5 1 1 0.000000 0.000000 0.000000 12857
        8 が 助詞,格助詞,一般,*,*,*,が,ガ,ガ 6 9 148 148 13 6 0 1 0.000000 0.000000 0.000000 11729
        21 大好き 名詞,形容動詞語幹,*,*,*,*,大好き,ダイスキ,ダイスキ 9 18 1287 1287 40 2 0 1 0.000000 0.000000 0.000000 13008
        48 です 助動詞,*,*,*,特殊・デス,基本形,です,デス,デス 18 24 460 460 25 6 0 1 0.000000 0.000000 0.000000 12875
        56 EOS BOS/EOS,*,*,*,*,*,*,*,* 24 24 0 0 0 0 3 1 0.000000 0.000000 0.000000 11634
    "":
        python	名詞,固有名詞,組織,*,*,*,*
        が	助詞,格助詞,一般,*,*,*,が,ガ,ガ
        大好き	名詞,形容動詞語幹,*,*,*,*,大好き,ダイスキ,ダイスキ
        です	助動詞,*,*,*,特殊・デス,基本形,です,デス,デス
        EOS
"""

import MeCab


def format_tag_result(x):
    pieces = []
    for i in x.splitlines()[:-1]:
        i = i.split()
        v = (i[0], i[-1])
        pieces.append(v)

    return pieces


mecab_tagger = MeCab.Tagger("-Ochasen")  # `-Owakati` 只做分词
text = "pythonが大好きです"

print(format_tag_result(mecab_tagger.parse(text)))
```





### mecab ipadic字典提取



因为ipadic字典是用csv保存的, 因此还是很好提取的.

需要注意的是, 在打开csv时, 选择的文本编码是`shift-jis`.

比如说提取地点`Noun.place.csv`

![1553162622677](assets/1903191558-mecab/1553162622677.png)





## wikipedia dictionary download(日本语)

https://www.zhihu.com/question/19803440

https://zh.wikipedia.org/wiki/Wikipedia:%E6%95%B0%E6%8D%AE%E5%BA%93%E4%B8%8B%E8%BD%BD



google wikipedia dictionary 日本語ダウンロード

[Wikipedia:データベースダウンロード](https://ja.wikipedia.org/wiki/Wikipedia:%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)



下面是翻译成中文的

![1553223683713](assets/1903191558-mecab/1553223683713.png)



日文: https://dumps.wikimedia.org/jawiki/latest/

中文: https://dumps.wikimedia.org/chwiki/latest/



随便下载一个: chwiki-latest-geo_tags.sql

注意, 这是sql文件, 即为可执行的文件, 包含创建数据库和插入数据, 并不是数据库文件, 这个可以直接使用文本编辑软件打开



但是里面好像并没有什么...

![1553224006791](assets/1903191558-mecab/1553224006791.png)



中文搞错了, 应该是这个: https://dumps.wikimedia.org/zhwiki/latest/

