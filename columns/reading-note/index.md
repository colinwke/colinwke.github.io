# 阅读笔记




[TOC]

## daily reading list

1. https://weibo.com/u/page/fav/3204084435 微博收藏
   1. https://weibo.com/u/5722964389 GithubDaily
   2. https://weibo.com/u/2194035935 蚁工厂
   3. https://weibo.com/u/5648162302 黄建同学
2. https://www.zhihu.com/collection/688307973 知乎收藏 这个是`7693`登录的
3. http://localhost:4000/dash/feeds wechat rss
   1. http://localhost:4000/dash/feeds/MP_WXS_3520012476 京东零售技术
   2. http://localhost:4000/dash/feeds/MP_WXS_3885737868 阿里技术
   3. http://localhost:4000/dash/feeds/MP_WXS_3014106999 大淘宝技术

 = = = **在这后面添加** = = =

### 2025-09-18 多目标优化损失设计

> 关键字: 多任务 损失
>
> 主要问题: 跷跷板现象, 另外, 这里还需要考虑侧重点是哪里

1. 在训练集上, 一个损失减少, 另一个损失增大(监控多个训练loss)
2. 在测试集上, 同样一个指标提升, 一个指标降低(auc监控)
3. reading list
4. https://zhuanlan.zhihu.com/p/599381053
5. https://zhuanlan.zhihu.com/p/598657351
6. https://zhuanlan.zhihu.com/p/1913992712039957453

### 2025-09-08 唐杰: 从大模型看AGI的发展

概述: 总的来讲还算行, 正好适合我这种有接触但是解除不多的人, 算一个入门的引导!

1. 大模型和AGI研发的重要性
   1. 这个跟操作系统一样, 可能会成为国家壁垒. 
   2. 所以重要性很高, 影响着国家战略, 国民经济, 科技发展.
2. 大模型发展历程. 
   1. 从18年算法创新(pretrain-model), 
   2. 20年模型之战

#### 其他补充

https://mp.weixin.qq.com/s/jzI8kzc6dLX-yWz0aJImXA

1. 大模型(LLM)与AGI的关系

   1. 大模型是AGI的核心基座(基础), 也是实现AGI的重要途径

   2. 大模型的关键挑战: 算力, 数据, 算法

   3. > ChatGPT的优异表现主要依托超⼤规模预训练基座模型GPT-3/3.5/4、有监督指令微调以及基于⼈类反馈的强化学习。

其他引用

1. https://mp.weixin.qq.com/s/kOgyKh2vN-WJvjmig9gK0A
2. https://mp.weixin.qq.com/s/xghvWLVQdNkSYcJ6Y4etBg
   1. word2vec, 学习根据上下文学习静态表示, 因为上下文的关系所以学习到的向量存在语义关系, 好比你问, 中国北京对应的是日本的那个城市, 这里对应可以理解为向量相近??(其实LLM并不是这么实现的, LLM是使用的更多的数据学习到这层关系!!), 但是word2vec学习到的是静态的, 所以有了transformer, 根据**query**学习到一个向量

``` 

O-one resoning open ai
deep seek 
coding agent
open ai dr
AGI
大模型幻觉, double check 
定义agi, 像人一样思考
3 个阶段
预训练, representation -> 加入更多的data -> 加入新的东西是否影响原有的性能
transformer, 对齐, 推理, 现在大大模型, 大的system
图片模型, 的底座 是一样的, 主要的是文字和图片的对齐
本身做的是, 底座 和 任务对齐
自我学习, 自己去找, 尝试
gpt5, 不再局限于对齐, 推理, 而是一个system

3件事
表示学习
编程 先做什么, 再做什么
搜索
计算机大模型的本质

文本, 图像, 对齐, 多模态对齐

对齐 -> 自学习
加数据, 知识量
对齐 -> 编程能力
自我学习 -> 强化学习

大模型到底学习到了什么能力
大模型能力涌现 wei 2022
世界知识 -> 多看书, 知识量 -> 一步推理 -> embedding
抽象
gpt3, pretrain, 一步推理
chat gpt -> 分成之前的3步解决

推理

千亿模型, 什么都不做, 已经能做数学题了
大模型能力涌现真的存在吗? schaeffer, nips 23best, 容忍小部分错误得分
从模型loss角度看能力涌现, du 2024
基座模型训练 scaling law的重要性

全球大模型 竞技榜 排名
open  rouster
https://openrouter.ai/rankings
hugging face
知识环节
1. 结果约束; 2. rlhf, 3. double check , 子学习

pre training, mid training, post training

## 25-09-08 16:58 
大模型背景
国家战略，国民经济，前沿科技
探寻模型的天花板
卡的区别10/1
现在卷的强化学习更吃卡
模型的修正更难
rl国内做的比较弱
```





### 2025-09-01

1. https://www.bilibili.com/video/BV1bBt1zwEAk -- 王炸! NSFW图片, 视频直接生成!新手也能轻松使用的ComfyUI工作流, 超大尺度换装, AI视频, 家具, 服装, 美妆产品统统搞定
   1. https://civitai.com/models
   2. https://www.liblib.art/



### 2025-08-20

1. https://github.com/EvoAgentX/Awesome-Self-Evolving-Agents
2. https://github.com/k1LoW/deck markdown to pdf
3. https://github.com/embedpdf/embed-pdf-viewer
4. https://github.com/dongshuyan/PromptHelper

### 2025-08-15

1. 腾讯广告算法大赛
   1. https://blog.csdn.net/qq_63585949/article/details/149842144 -- 2025 腾讯广告算法大赛 Baseline 项目解析-CSDN博客
   2. https://github.com/lazybearlee/blog/tree/d61f1c8652fbebf1c37e3ebd929cf8bac0daea2c/content/Note/%E7%AE%97%E6%B3%95%E6%AF%94%E8%B5%9B
   3. https://github.com/youyouhuo/learning_node/blob/3cc23e849f3333435163d048fde2f2594b6af657/2025_0409_cvr%E6%A8%A1%E5%9E%8B%E6%A0%B7%E6%9C%AC%E7%A8%80%E7%96%8F%E9%97%AE%E9%A2%98.md?plain=1#L7
   4. https://github.com/mikaizhu/Notes/blob/f04d80456dde566abbd7e8cd1e3528cef1bc6f74/Others/%E8%85%BE%E8%AE%AF%E5%B9%BF%E5%91%8A%E5%A4%A7%E8%B5%9B%E8%B5%9B%E9%A2%98%E6%80%9D%E8%B7%AF.md?plain=1#L3
   5. https://github.com/lazybearlee/blog/blob/d61f1c8652fbebf1c37e3ebd929cf8bac0daea2c/content/Note/%E7%AE%97%E6%B3%95%E6%AF%94%E8%B5%9B/%E8%85%BE%E8%AE%AF%E5%B9%BF%E5%91%8A%E5%A4%A7%E8%B5%9B2025-%E5%A4%9A%E4%BB%BB%E5%8A%A1%E5%AD%A6%E4%B9%A0%E7%9A%84%E5%88%86%E6%9E%90.md?plain=1#L4
   6. https://github.com/lazybearlee/blog/blob/d61f1c8652fbebf1c37e3ebd929cf8bac0daea2c/content/Note/%E7%AE%97%E6%B3%95%E6%AF%94%E8%B5%9B/%E8%85%BE%E8%AE%AF%E5%B9%BF%E5%91%8A%E5%A4%A7%E8%B5%9B2025-%E7%BB%93%E5%90%88%E4%BB%BB%E5%8A%A1%E5%88%86%E6%9E%90Baseline.md?plain=1#L4

### 2025-08-11

## 如何评价阿里 P10 赵海平对王垠的面试？这里摘取的是赵海平的答复

1. https://www.zhihu.com/question/360622233/answer/944141354 

2. **这里主要思考的是面试官主要了解考察的点是什么地方, 需要什么样的面试者!!**

3. 面试官最好的做法是不回应

4. > 我希望王垠能够意识到这部分才是面试真正考核的部分，应该尽量把自己最拿手最出彩的工作分享给面试官，详细解释为什么难，为什么有意义，为什么对公司有着深远的影响
   >
   > “你写这些有什么意义呢，什么价值呢？”
   >
   > 工牌是2007加入Facebook时公司说可以印上自己喜欢的称呼或者口号，我写的是 “The Greatest Computer Scientist！” 是有一个感叹号的，是希望自己成为一个伟大的计算机科学家，当年的我和王垠一样踌躇满志，但是当年的我一事无成，没有任何资本骄傲和自负，即使今天我也从来不觉得自己有什么了不起的地方

### 2025-08-03

有一个想法: 把固定镜头的录像转化为热力图(必须羽毛球录像), 然后挖掘其中的数据信息, 例如移动热力图, 球路分析等, 看到🍠有基于yolo的产品展示, 想着是否因为背景固定, 所以可以视频中变化的部分生成热力图.

结果是热力图是可以生成的, 但是双打不能识别出人物.

1. https://github.com/yo-WASSUP/Good-GYM
2. https://www.xiaohongshu.com/user/profile/5fdf34b50000000001008057?xsec_token=YBFwY198KYXUS3tsgPdRVRTTHDhoyuVaCofsQMbCt7eRo%3D
3. https://www.xiaohongshu.com/explore/6802ff12000000001c02ed1b?xsec_token=ABs-GvUHkzT0hWGNnbHZ3Bi6uqsVYjGgk4p1AcvfEfZt0=
4. https://www.bilibili.com/video/BV1grZ6YnEtv/?vd_source=b1495c5ba742918aafed5721e31600a2
5. https://www.bilibili.com/video/BV1FgfMYLEXD
6. https://github.com/nethra8902/Badminton-Sport-Analysis-Computer-Vision yolo
7. https://github.com/ChaosAdmStudent/qualitative-badminton-player-analysis
8. https://colab.research.google.com/github/ultralytics/notebooks/blob/main/notebooks/how-to-generate-heatmaps-using-ultralytics-yolo.ipynb heatmaps
9. https://github.com/orgs/ultralytics/discussions/10068
10. https://docs.ultralytics.com/zh/guides/heatmaps/?h=heatmap#heatmap-arguments
11. https://www.bilibili.com/video/BV1NMmkYsEdd

### 2025-07-29

1. https://github.com/cooderl/wewe-rss 微信公众号订阅
   1. https://linux.do/t/topic/121606 实践 done



## 2024-05

### 「最强」自动驾驶如何炼成? 特斯拉FSD进化史: 超深度解读

https://www.bilibili.com/video/BV161421o7uP

**transformer as all you need!**

### 用数据可视化, 看互联网中小厂的日子到底过得怎么样?

https://www.bilibili.com/video/BV1MT421y7jR

1. DAU, 收入
2. 用户增长难, 商业变现难
   1. 没有更多用户, 就挣不到更多的钱; 没有更多钱, 无法支撑获取更多用户
   2. 没有更多钱, 更强烈的商业化, 损害用户体验
3. 广告收入
   1. 用户数量
   2. 广告匹配能力(智能投放) 
   3. 广告主资源
      1. 相比做大头部广告主的投放金额,  更重要的是增加广告主数量
      2. 广告的竞价模式售卖, 增加广告的竞争力, 2倍的广告主贡献3倍的钱
         1. 广告主越多, 竞价越激烈
         2. (现目前wb广告没有竞争力, 提升竞争力)
   4. 闪电扩张
      1. 一家公司在短时间内把增长作为第一优先级, 承担更大风险的同时迅速占领市场
4. qust mobile行业研究报告 https://www.questmobile.com.cn/research/reports

## 2024-04

### reading list

1. https://www.zhihu.com/question/609483833/answer/3420895685?utm_psn=1764604887328141312
2. Agent的九种设计模式(图解+代码) - 产品二姐的文章 - 知乎
   https://zhuanlan.zhihu.com/p/692971105
3. AI领域的agent是什么意思？ - 阿里巴巴大淘宝技术的回答 - 知乎
   https://www.zhihu.com/question/51195225/answer/3462005622
4. 抖音兴趣建模新突破——Trinity：多兴趣/长期兴趣/长尾兴趣三位一体 - 水哥的文章 - 知乎
   https://zhuanlan.zhihu.com/p/681751105
5. 能大致讲一下ChatGPT的原理吗？ - 平凡的回答 - 知乎
   https://www.zhihu.com/question/598243591/answer/3331628116
6. 阿里大模型算法工程师面试，被问麻了。。。。 - AI技术社区的文章 - 知乎
   https://zhuanlan.zhihu.com/p/678982285

### 【大学老师推荐】懒人必用的AI工具｜再也不用亲自做PPT和备课了！科技摸鱼～

https://www.bilibili.com/video/BV12E421M7et 

1. 如何提高工作效率
2. 没有给出他很明确的指令, GPT不是这样子用的! 额外的指令, 追问等

-=-

\- 📚 使用AI工具: GPT用于生成PPT大纲和配图, `天宫AI`提供高质量信息源, `Kimi Chat`帮助整理长文本内容.
\- 💡 AI使用技巧: 明确指令, 多追问以完善结果, 避免默认的正方形图片, 适合的主题和风格选择.
\- 🖼️ 一键生成PPT: 推荐网站`gamma`, 快速生成PPT模板, 但需自行填充内容, 风格简洁.
\- 💡 AI信息获取: 推荐网站[way to agi](https://www.waytoagi.com/), 关注AI领域的新闻, 工具和发展, 启发思考, 扩大知识视野.
\- 🤖 工具与思考: AI是工具, 不能替代思考, 有效利用AI取决于个人的创意思维.

https://blog.waytoagi.com/

### 用扣子/Coze 揭秘吴恩达的4种 AI Agent 设计模式

https://mp.weixin.qq.com/s/6zrZVeeza5eqCPfHfiwEGw

1. Agent就是一个工具人, AI Agent就是AI工具人
2. 各种设计模式就是不同的workflow(工作流)
3. 设计不同的workflow, 并合理使用大模型的理解, 总结, 等能力, 完成认知指示(prompt)的任务.

#### 扩展阅读

langchain等系列名词

- Agent
- Bot
- Plugin

## 2024-01

### 百度推荐排序技术的思考与实践

https://mp.weixin.qq.com/s/JTNmYJNgoQr26fkT-Oy35g

内容其实一般, 但是很多问题还是非常值得思考的

1. 推荐中的马太效应
   1. embedding中的马太效应导致的问题
2. id类特征的记忆能力和如何做到id更新的泛化能力(例如, 这个id<用户|帖子>是有生命周期的)
3. 特征质量: 特征覆盖率, 单特征AUC

### 推荐算法优化闲聊

https://zhuanlan.zhihu.com/p/665102155

> 算法优化核心是要找到关键问题, 而不是 follow 最新的模型.

### 2023年底跳槽记录

phd, google, Data Scientist, 准备: leetcode, 机器学习八股文

https://zhuanlan.zhihu.com/p/673229826

引用资料

1. https://web.stanford.edu/class/cs224n/slides/ cs224n 课件
2. http://cs231n.stanford.edu/slides/2023/ cs231n 课件
3. Keep looking, don't settle

### 2023开源大模型之年

https://huggingface.co/blog/zh/2023-in-llms

## 2023-12

本地部署chatbot

1. https://zhuanlan.zhihu.com/p/648165951 ChatGLM-6B-0006-低成本部署 on mac
2. https://zhuanlan.zhihu.com/p/633445989 glm推荐
3. https://zhuanlan.zhihu.com/p/665067303
4. https://www.zhihu.com/question/632784220/answer/3309791374 通义千问部署
5. https://zhuanlan.zhihu.com/p/672697840
6. https://zhuanlan.zhihu.com/p/623573505
7. https://help.aliyun.com/zh/eci/user-guide/deploying-tongyi-qiwen-application
8. https://www.zhihu.com/question/596838257
9. https://zhuanlan.zhihu.com/p/649272911
10. https://zhuanlan.zhihu.com/p/669795017 推荐
11. https://zhuanlan.zhihu.com/p/642482701
12. https://zhuanlan.zhihu.com/p/648314447
13. https://zhuanlan.zhihu.com/p/629558941
14. https://zhuanlan.zhihu.com/p/630049721 闭坑指南

### 混合专家模型 (MoE) 详解 5⭐️

https://huggingface.co/blog/zh/moe 

https://mp.weixin.qq.com/s/I1D-mVQCseL4gW9sJLzY2w 微信公众号链接(没有引用的链接, haggingface有) 

#### 引用

1. https://scholar.google.com/citations?user=kukA0LcAAAAJ&hl=en Yoshua Bengio Google scholar
2. https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard chatbot leaderboard
3. https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard open LLM leaderboard
4. https://www.superclueai.com/ https://github.com/CLUEbenchmark/SuperCLUE 中文排行
5. https://cevalbenchmark.com/static/leaderboard.html
6. https://github.com/lucidrains/mixture-of-experts sg(sparse gate)-moe pytorch实现
   1. https://github.com/tensorflow/tensor2tensor/blob/master/tensor2tensor/models/research/moe.py tf实现
   2. https://github.com/lucidrains/st-moe-pytorch st(Stable Transferable)-moe
      1. https://github.com/tensorflow/mesh/blob/master/mesh_tensorflow/transformer/moe.py


### 美团外卖推荐情境化智能流量分发的实践与探索 5⭐️

https://mp.weixin.qq.com/s/SufYXcqJCo1osjWnhECO1A

https://tech.meituan.com/2022/12/08/scenario-aware-ranking-model-for-personalized-recommender-system.html

其他

1. https://github.com/liutaohz/daily-blog-post 技术导航
2. https://github.com/eryajf/read-list 技术导航
3. --
4. https://mp.weixin.qq.com/s/4ZVXdrK1h9zXuxoxw1bHfw 美团多场景建模的探索与实践
5. https://mp.weixin.qq.com/s/v-GN1ors-bWutfsIJcZYbQ 多场景多任务学习在美团到店餐饮推荐的实践(done)
6. https://mp.weixin.qq.com/s/8tECsjN4WQN0YRUwNCNRAg “美团大脑”在美团推荐场景中有哪些知识应用？

引用的论文列表

```R
[1] Zhou G, Zhu X, Song C, et al. Deep interest network for click-through rate prediction. SIGKDD 2018.
[2] Zhou G, Mou N, Fan Y, et al. Deep interest evolution network for click-through rate prediction. AAAI 2019.
[3] Pi Q, Bian W, Zhou G, et al. Practice on long sequential user behavior modeling for click-through rate prediction. SIGKDD 2019.
[4] Pi Q, Zhou G, Zhang Y, et al. Search-based user interest modeling with lifelong sequential behavior data for click-through rate prediction. CIKM 2020.
[5] Qu Y, Cai H, Ren K, et al. Product-based neural networks for user response prediction. ICDM 2016.
[6] Guo H, Tang R, Ye Y, et al. DeepFM: a factorization-machine based neural network for CTR prediction. arXiv:1703.04247, 2017.
[7] Jianxun Lian, et al. xdeepfm: Combining explicit and implicit feature interactions for recommender systems. KDD 2018.
[8] Wang R, Shivanna R, Cheng D, et al. Dcn v2: Improved deep & cross network and practical lessons for web-scale learning to rank systems. WWW 2021.
[9] Devlin J, Chang M W, Lee K, et al. Bert: Pre-training of deep bidirectional transformers for language understanding. arXiv:1810.04805, 2018.
[10] Ma J, Zhao Z, Yi X, et al. Modeling Task Relationships in Multi-task Learning with Multi-gate Mixture-of-experts. KDD 2018.
[11] Sheng X R, Zhao L, Zhou G, et al. One model to serve all: Star topology adaptive recommender for multi-domain ctr prediction. CIKM 2021.
[12] Fedus W, Zoph B, Shazeer N. Switch Transformers: Scaling to Trillion Parameter Models with Simple and Efficient Sparsity. arXiv:2101.03961, 2021.
[13] Zoph B, Bello I, Kumar S, et al. Designing effective sparse expert models. arXiv 2202.08906, 2022.
[14] Chen Z, Deng H Wu Y, Gu Q. Towards Understanding Mixture of Experts in Deep Learning. arXiv:2208.02813, 2022.
[15] Zhou M, Ding Z, Tang J, et al. Micro behaviors: A new perspective in e-commerce recommender systems. WSDM 2018.
[16] Zou X, Hu Z, Zhao Y, et al. Automatic Expert Selection for Multi-Scenario and Multi-Task Search. SIGIR 2022.
[17] Bai T, Xiao Y, Wu B, et al. A Contrastive Sharing Model for Multi-Task Recommendation. WWW 2022
```



### 大模型LangChain框架基础与使用示例

https://mp.weixin.qq.com/s/KrWM3cMywMvYUiawRZ94Gg

LLM best practice

>Prompt指⽤户的⼀系列指令和输⼊, 是决定 Language Model 输出内容的唯⼀输⼊, 主要⽤于帮助模型理解上下⽂并⽣成相关且连贯的输出, 如回答问题, 拓写句⼦和总结问题.

refs:

1. https://zhuanlan.zhihu.com/p/643824681 每个LLM开发者都应该知道的数字

### 不规范的枚举类代码引发的一场事故

https://mp.weixin.qq.com/s/38teLuhPe17h0yuTa9dbcg

- 推荐的几个方法及插件
- 第一件事确定线上代码的一致性
  - arthas jad,
- 插件
  - arthas 命令插件 `Arthas Idea` by 汪小哥
  - 首要的是写代码还是要注意规范, 最好本地装一些扫描工具, 例如 `sonar`风险一定要尽快按照建议修复.

### 10年前, word2vec经典论⽂就预定了今天的NeurIPS时间检验奖

https://mp.weixin.qq.com/s/CI-s6I-l7CwiVIKo4p0IKA

word2vec引用的文章

1. https://mp.weixin.qq.com/s/dKbGR4sCkNpik0Xw41QLVw 从word2vec开始, 说下GPT庞大的家族系谱
2. https://mp.weixin.qq.com/s/P2Ff8IpvrOXOAwhIyoh5RA 词嵌入的经典方法, 六篇论文遍历Word2vec的另类应用

⼤语⾔模型「涌现」出了在⼩规模模型中不存在的能⼒

1. 论⽂证明了所谓的「涌现」能⼒会随着不同的度量或统计⽅式消失(监督方式? 算法方式), ⽽并⾮ ⼈⼯智能的基本属性得到了扩展.

训练数据集的规模可能很快就会受互联⽹上可⽤⽂本数据量的限制

1. 随着重复次数的增加, 增加计算量的价值最终会降⾄ 零. 研究者们进⽽提出并实证验证了⼀个计算最优化的扩展定律(scaling law), 该定律考虑了重复 token 和多余参数价值递减的问题.

## 2023-11

### ChatGPT是如何产生的 - 时间线

你认为『ChatGPT 之父』是 Sam Altman 还是 Ilya Sutskever? - 刘斯坦的回答 - 知乎
https://www.zhihu.com/question/630824378/answer/3294956204

- ChatGPT的发展历史

- ChatGPT和Bert的竞争
  - MLM VS 自回归 https://zhuanlan.zhihu.com/p/335099242

微软称 OpenAI 创始人 Sam Altman, Greg Brockman 将加入, 带来哪些影响? - 西門Leo的回答 - 知乎
https://www.zhihu.com/question/630962018/answer/3295871251

- 同上

### thinking in chat-gpt

https://github.com/AntonOsika/gpt-engineer

gpt的应用在于如何把GLM中的信息给串联起来, 且以什么样的方式串联起来

为了特定的某个问题(应用), gpt可能并没有创建针对性的连接, 为了创建这个连接, 你可能需要输入一定的prompt并给出答案, 来训练模型.

但是对于已经针对某一问题训练而成的gpt, 这时可以变成一个应用, 这个应用基于已有的连接, 把你需要的答案检索出来.

例如应用1: 输入某一个公司的财报, 输出财报的可视化解读及是否值得投资(这里还需要注意模型的实时性问题)

### 推荐算法线上最成功的一次提升是什么?

https://www.zhihu.com/question/487938087/answer/3276892449

> 算法优化核心是要找到关键问题, 而不是 follow 最新的模型.
>
> 这类优化可以叫做问题驱动型优化, 优点是基本上都能拿到收益.
>
> - WB排序的关键问题是什么?
> - 相关帖子少, 如何加入不相关的帖子在带来丰富性的同时, 降低badcase
> - 创意单一
> - 帖子质量差, 导致口碑不好(这个需要针对性的项目引导, 在推cash或转化为目标时不适合优化)
> - 冷启动用户较多, 有pv但没有点击的用户多
> - 软件体验白/黑名单

### 如何利用「深度上下文兴趣网络」提升点击率?

https://mp.weixin.qq.com/s/O3V57CX_d5a_--EZh-piUQ arxiv: https://arxiv.org/abs/2301.12402

仍然使用多个模块去解决点击率预估中存在的问题(优化空间)

1. 上下文聚合模块(PCAM), 类似与深度时空网络, 把历史没有点击的上下文广告信息作为了输入
   1. 貌似这里并没有说明在预估过程中, 如何把没有点击和有点击的上下文作为预估的输入?
2. 上下文融合模块(FCFM)
3. 兴趣匹配模块(IMM), 仍然是用的DIN
   1. TODO: DIN是否存在更多优化的地方

4. 线上优化
   1. 与目标item无关的embedding计算由离线完成(提前计算用户的上下文感知兴趣),在线服务时直接将其作为模型的输⼊ -> 所以这里把上下文作为输入是和点击序列一样的把`历史`上下文+点击作为模型的输入, 而不是把当次的上下文作为模型的输入, 这是和深度时空网络有所区别的

#### 附深度时空网络

阿里 深度时空网络(同一个主题有3个分享人)

1. https://mp.weixin.qq.com/s/VHRV1Z6F8-3o6b-3v-5_BA 秀武
2. https://mp.weixin.qq.com/s/Y2pkH0i3n2yUkJFbgyRqTQ 擎苍
3. https://mp.weixin.qq.com/s/p-kTzgcu7U6x4QBxQh8AwQ 邹衡

## 2023-10

### 线上多参数调整 预估排序

1. https://www.infoq.cn/article/nozs4xy7bvbcf34vzhhu 复杂多目标: Ensemble Sort 和在线自动调参

2. https://zhuanlan.zhihu.com/p/441117034 推荐系统中的多任务学习与多目标排序工程实践(下)
3. https://tech.meituan.com/2015/12/07/rerank-solution-offline.html 美团O2O排序解决方案--线下篇
4. https://help.aliyun.com/document_detail/419538.html 推荐全链路 / 深度定制开放平台 / 选型指导
5. https://juejin.cn/post/7210310775276519484 重排在快手短视频推荐系统中的应用&手淘信息流多兴趣多目标重排技术
6. https://aws.amazon.com/cn/blogs/china/optimization-practice-of-the-ranking-model-of-the-recommendation-system-series/ amazon
7. https://mx-1024.github.io/posts/2020/02/09/62333/ 推荐系统排序优化迭代的一些经验
8. https://zhuanlan.zhihu.com/p/500237779 推荐系统多目标优化专题(2)-融合公式设计思路



## 2023-08

### 围绕 transformers 构建现代 NLP 开发环境

https://mp.weixin.qq.com/s/quyUMyFyoYYub0MJ5EoWVQ 5⭐️

围绕transformers构建现代NLP开发环境 -> 围绕huggingFace构建个性化的NLP开发环境

本文首先介绍了如何重写部分代码, 实现huggingFace个性化(存储, 方法)兼容; 然后是如何基于其他插件进行整个pipeline的管理, 而这个whole pipeline已经具有software2.0的雏形(或者叫形态).

什么是软件2.0

> 他预⾔, 为了实现软件2.0, 需要⼀整套服务于深度模型开发的⼯具栈, 就像传统软件需要 pip, conda 这类包管理器(package manager), GDB 这类 debug ⼯具, Github 这类开源社区⼀ 样, 深度学习也需要模型 debug ⼯具, 模型和数据集的管理器和开源社区.
>
> 但他没有预⾔到的是, 类transformer 架构在之后的年⽉⾥⼤放异彩, 不仅统⼀了 NLP 领域, ⽽ 且 正 在 逐 步 统 ⼀ CV 等 其 他 领 域 . " 预 训 练 - 微 调 " 成 为 业 界 最 常 ⻅ 的 模 型 开 发 范 式 . ⽽ huggingface 公 司 , 借 着 transformers 库 的 东 ⻛ , 以 及 围 绕 它 建 设 的 模 型 开 源 社 区 (huggingface hub), 成为当前 NLP 开发事实上的标准, 连⽬前最⽕的⼤模型, 都选择在 huggingface 发布, 例如 ChatGLM, 这些已经有了软件 2.0 的雏形.

最后的问题可谓这篇文章的点睛之笔

> 随着软件 2.0 ⼯具栈的成熟, 算法开发流程将逐步标准化, ⼯程化, 流⽔线化, 不仅⼤量⾮科班 的玩家都能⽤ LoRA 微调⼤模型, ⽤ diffusers ⽣成⼈物了, 甚⾄连 AI 都能开发软件了, 那么在未来, "算法⼯程师" 这个 title 会变成什么呢, 会调⽤ import transformers 算不算懂 NLP 呢? 这道题作为课后练习, 留给同学们进⾏思考!

对这个问题的思考: 从现有的工作环境中, 包含有AI平台工程, 我想就是把算法开发流程标准化, 工程化, 流水化的工作. 智能类的AI应用且基于算法手段做优化的仍然是算法工程师的主要工作范畴, 算法工程师就是针对某一目标使用某种(算法)手段做最优化的一群人, 对某一目标做优化除了使用现有的*软件2.0*之外, 还涉及到数据优化, 模型优化, 目标优化等算法范畴的工作.

我们再来看看huggingFace(https://huggingface.co/models)

> The AI community building the future.
> The platform where the machine learning community collaborates on models, datasets, and applications.

### LLM

1. https://zhuanlan.zhihu.com/p/589747432 ChatGPT内核: InstructGPT, 基于反馈指令的PPO强化学习

### 多场景/多目标

1. https://zhuanlan.zhihu.com/p/639351273 多目标 or 多场景? -- 推荐系统的细枝末节(第四章)
2. https://zhuanlan.zhihu.com/p/580951049 动态权重在推荐系统中的应用
3. https://zhuanlan.zhihu.com/p/472726462 poso
4. https://mp.weixin.qq.com/s/GdB4le5ZSFHAAETHYxbJSA POSO方法的实际应用和分析思考
   1. POSO: Personalized Cold Start Modules for Large-scale Recommender Systems
   2. https://t.zsxq.com/10fQsAzPr 知识星球链接

## 2023-07

### profile 性能分析

https://mp.weixin.qq.com/s/RKqmy8dw7B7WtQc6Xy2CLA

## 2023-06

### 依赖注入inject与解耦

> 深深耦合在一起了, 如果要换手机, 他就要拿起刀来改造自己, 把自己体内所有方法中的iphone6 都换成 iphoneX
>
> 我也从其中获得了这样的感悟: 如果一个类A 的功能实现需要借助于类B, 那么就称类B是类A的依赖, 如果在类A的内部去实例化类B, 那么两者之间会出现较高的耦合, 一旦类B出现了问题, 类A也需要进行改造, 如果这样的情况较多, 每个类之间都有很多依赖, 那么就会出现牵一发而动全身的情况, 程序会极难维护, 并且很容易出现问题. 要解决这个问题, *就要把A类对B类的控制权抽离出来, 交给一个第三方去做, 把控制权反转给第三方, 就称作控制反转*(IOC Inversion Of Control). 控制反转是一种思想, 是能够解决问题的一种可能的结果, 而依赖注入(Dependency Injection)就是其最典型的实现方法. 由第三方(我们称作IOC容器)来控制依赖, 把他通过构造函数, 属性或者工厂模式等方法, *注入到类A内*, 这样就极大程度的对类A和类B进行了解耦.

Injector对象是Guice的核心, 它负责创建和管理对象的生命周期

### 北极星指标图

https://www.woshipm.com/operate/3291568.html

https://www.woshipm.com/operate/1072916.html

> 北极星指标也叫唯一关键指标, 产品现阶段最关键的指标, 其实简单说来就是公司制定的发展目标, 不同阶段会有不同的目标. 为什么叫"北极星"指标, 其实大概的寓意就是要像北极星一样指引公司前进的方向, 目标制定最好是能符合SMART原则.

## 2023-05

### 你真的懂点击率(CTR)建模吗?

https://mp.weixin.qq.com/s/p13DHPO59d4a_LWKV41lrg

ctr模型性能评价的两个维度:

1. 序的准确性 auc/gauc

2. 值的准确性 copc/logloss

   1. 模型训练的时候是基于全空间坐标系, 评估可能是一个子坐标系, 存在偏差

   2. > 校准本质上是在基础模型之上, 引入了第二个学习目标. 基础模型的目标是在给定解空间拟合数据, 最大化AUC(序的准确性); 校准模型的目标是在后验的统计意义上调整pCTR值的大小, 使得预测值尽可能逼近观测到的统计值(值的准确性). 然而, 这种两段式建模方式, 虽然第二阶段的校准可以尽量保序, 从而不影响模型的AUC表现, 但两段式建模非最优. 因为基础模型预测的pCTR分布代表了模型对数据的归纳; 现在既然已经知道有特定维度上这个归纳不准确, end-2-end联合建模显然能够触及更高的天花板. 这个方向的工作我们团队正在推进.

      这里说的end2end的方法是否可以是把子空间作为特征, 然后做`多场景多任务`学习, 即把子空间作为一个场景?

其他参考

1. https://zhuanlan.zhihu.com/p/262877350 推荐系统采样评估指标及线上线下一致性问题

2. https://blog.csdn.net/u013019431/article/details/102473137 ctr预估中的评估指标及校准

   1. >ctr预估不仅要保序, 即正负样本排序好, 还需要保距, 即pctr之间的比值关系与真实ctr的比值也基本相等, 这也是ctr预估中最难的地方.
      >
      >怎样的模型是个好的ctr预估模型?
      >最理想的模型当然是开了上帝之眼, 预估为5%点击的流量群统计后也是5%, 即在各个流量上的预估都非常准. `这里就是各个场景的统计`
      >
      >logloss主要用于评估模型输出概率与训练数据的概率的一致程度
      >
      >保序回归: 在不改变模型输出auc的情况下根据样本调整每个pctr区间内的预估值, 有点像前面copc部分, 为每个细分流量都进行校准从而保证模型输出在有序的基础上还能保距.

其他思考

1. 各个位置模型/排序策略的效果差异
2. 是否还是预估越准, ecpm就越高, 这里还需要考虑其他排序因子对序的影响
3. 先提升各个场景的准确率(多场景), 再提升模型的准确率(多任务, sim, can)

2023-06-08 update

点击率预估的目标维度我想是人, 而不是物品. 所以在正样本中, 丢弃掉没有点击(非冷启动)用户的样本(没有指导意义的样本)是业务上正确的选择, 因为你还是预估的是有点击(正常用户)对于这些帖子的点击率 ...

### CAN(Co-Action Network)

- https://mp.weixin.qq.com/s/XFXBgMhf5TGCprF46kOOJg 点击率模型特征交叉方向的发展及CAN模型介绍
- https://github.com/CAN-Paper/Co-Action-Network can code
- https://github.com/UIC-Paper/MIMN mimn code
- https://github.com/mouna99/dien dien code
- https://github.com/tttwwy/sim sim code
- https://github.com/ruozhichen/deep_learning/tree/master mmoe
- https://github.com/ShowMeAI-Hub/multi-task-learning/tree/main
- https://github.com/qiaoguan/deep-ctr-prediction
- https://github.com/openbenchmark/BARS

scholar TODO(整理迭代路径)

- https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q=click-through+rate+prediction
- https://scholar.google.com/citations?user=PXO4ygEAAAAJ gaikun
- https://scholar.google.com/citations?user=eUMnOc0AAAAJ zhuxiaoqiang
- https://scholar.google.com/citations?user=n_E0Bg4AAAAJ zhouguorui
- https://scholar.google.com/citations?user=_LnryAgAAAAJ piqi
- https://scholar.google.com/citations?user=3Gq0df8AAAAJ mouna
- https://dblp.org/pid/205/2948.html bianweijie
- https://github.com/wjbianjason bianweijie

可以实践

## 2023-04

### 如何评价 OpenAI 的超级对话模型 ChatGPT ?

https://www.zhihu.com/question/570189639/answer/2804667785

**ChatGPT如何解决 "AI校正(Alignment)"这个问题**

> 感觉驱动器: Alignment就是对模型的校正, 使其精度更高.
> 至于如何进行alignment, 总体来说就是人工干预, 防止模型自主学习过程中的"好坏通吃".
> 就相当于你小时候吃东西(样本), 什么都吃, 不知道什么是好是坏, 这时候父母一方面告诉你什么是好的食物, 什么是坏的食物(强监督式学习), 另一方面惩罚你吃垃圾食品的行为, 奖励你吃健康食品的行为(强化学习). (RLHF)

### 从腾讯离职了, 四年工作总结

https://mp.weixin.qq.com/s/s0hnAdLHIQYxUXQV4aIJLA

普普通通吧, 虽然没有醍醐灌顶, 但是怎么也会有可借鉴之处.

前面一段时间, 和同事闲谈了一个结论, 就是不要替老板操心, 更不能也不可能替老板做决策. 我们能做的是做好自己, 实现自己的价值与在公司的价值. 也即精进自我专业技能, 提升自我核心竞争力, 这样才能无论到哪里, 都有口饭吃.

接受自己的平凡, 接受自己的选择带来的结果, 但也并非是不思进取, 更需要思考在接受的同时怎么能做的更好.

技术上要不断学习, 开拓眼界, 增强自我竞争力(技术沉淀, 技术分享), 注重方法论(系统的, 规范的, 文档化的, 专业的)

加油吧, 已不再是少年.

## 2023-03

### 多场景多任务学习在美团到店餐饮推荐的实践

https://mp.weixin.qq.com/s/v-GN1ors-bWutfsIJcZYbQ

### 快手精排模型实践

https://mp.weixin.qq.com/s/SsgVqei9sL5y7N1GUXOJLg

### 从用户体验洞察到商业价值变现, 以京东为例

https://mp.weixin.qq.com/s/NG39SvW4TGlU0_4I6TfJdQ

> 焦文健 京东 技术与数据中心 数据产品专家 京东零售数据产品专家, 十年大数据和算法智能领域的产品经验, 在客户体验管理, 用户洞察方面有丰富经验, 擅长通过数智化手段助力业务创新.

业务型算法工程师应当具备较好的数据能力, 产品能力, 来解决业务中的问题. 所以这类文章虽然读起来仍然会发现和职业的产品经理, 数据分析师有一定的差距, 但是整体来说还是非常受益的, 毕竟业务型算法工程师是个全栈更好[哭笑].

最近一段时间一直在思考技术驱动和产品驱动的问题, 他们的目标基本上是一致的, 都是以一定的方法去解决业务上的某一问题, 只不过解决的方法论可能不同. 作为算法工程师, 可以多从技术角度思考如何解决问题, 或者在现有的产品上如何去解决问题, 这就设计到数据分析能力和问题建模能力了.

抛开职能的讨论, 回到这篇文章讨论问题: 如今移动互联网基本饱和, 如何从增量时代向存量时代的转变过程总, 有哪些机遇及挑战, 以及经营思路的转变?

**1 这类问题可能有历史可参照**

虽然互联网是还算新兴行业, 但是对于某项新型技术或者产品来说, 他们发展可能都有所参见的.

对于竞争问题, 文章就举例了美的和格兰仕的微波炉之争, 及最后美的如何从泥潭中完成自救与扭亏为盈, 其主要不在价格的竞争, 价格的竞争只会两败俱伤, 或者被反垄断请喝茶, 而是从跟随策略向差异化策略的转变, 持续的以用户&客户的产品创新, 在产品上更具有竞争力(参见boss直聘).

对于存量与增量问题, 文章又举例了添可的品类创新带来的增量, 所以持续的品类创新带来持续的增量? (目前来见, 电子行业多数是的(手机, 相机), 但是很多行业可能已经遇到天花板了, 又如何的创新?)

另一个是微笑曲线

> 微笑曲线的两端, 一个是面向消费者的体验管理, 存量时代已无法仅靠投广告拉流量来 保持增长, 而是应该注重提升消费者体验; 另一个是产品的创新, 通过前文中的实例已经可以看 到产品差异化是可以带来显著增长的.

**2 如何做好用户体验洞察**

主要在于用户/客户需求的精细化识别, 包含画像/行为/认知的洞察. 理解用户/客户的需求是第一要务:

站在平台角度(三方:用户/客户/平台):

- 业务存在的意义是解决用户&客户的需求
- 所以理解用户&客户是当下的第一要务

站在BC角度:

- BC角度没有平台的参与, 所以理解的只有用户(客户是自身)

在传统的行为分析(是否达成服务, 基于行为日志数据)的基础上, 可以增加一些`心智分析`(达成服务的质量, 基于文本数据), 这些对于算法工程师来讲都是easy的.

最后一点是数据产品经理的自我修养. 我理解算法工程师还是可以持续在算法上深入, 可以通过一些case去打开思路, 至于系统的数据分析/产品管理的学习, 需要自己衡量其在实际工作中的重要程度了, 如果主要仍是算法方向, 就得不偿失了.

### 复旦邱锡鹏: 深度剖析 ChatGPT 类大语言模型的关键技术

https://mp.weixin.qq.com/s/S8gPrKzvzpYH1pCJCzGyzA

> 通常以百亿/千亿级参数量作为 LLM 研究的分水岭. 大规模语言模型也被看作是实现通用人工智能(AGI)的希望.

> ChatGPT 的三个关键技术为: 情景学习, 思维链, 自然指令学习
>
> **情景学习(In-context learning)**: 对于一些 LLM 没有见过的新任务, 只需要设计一些任务的语言描述, 并给出几个任务实例, 作为模型的输入, 即可让模型从给定的情景中学习新任务并给出满意的回答结果. 这种训练方式能够有效提升模型小样本学习的能力. (QA: 这个和word2vec所具有的距离关系是否相似? 模型学习的的知识具备一定的数据结构, 而这个数据结构是通用的, 可以通过部分少数描述来组合这种数据结构?)
>
> **思维链(Chain-of-Thought, CoT)**: 对于一些逻辑较为复杂的问题, 直接向大规模语言模型提问可能会得到不准确的回答, 但是如果以提示的方式在输入中给出有逻辑的解题步骤的示例后再提出问题, 大模型就能给出正确题解. 也就是说将复杂问题拆解为多个子问题解决再从中抽取答案, 就可以得到正确的答案. 由于 CoT 技术能够激发大规模语言模型对复杂问题的求解能力, 该技术也被认为是打破比例定律的关键.
>
> **自然指令学习(Learning from Natural Instructions)**: 早期研究人员希望把所有的自然语言处理任务都能够指令化, 对每个任务标注数据. 这种训练方式就是会在前面添加一个"指令", 该指令能够以自然语言的形式描述任务内容, 从而使得大模型根据输入来输出任务期望的答案. 该方式将下游任务进一步和自然语言形式对齐, 能显著提升模型对未知任务的泛化能力. (QA: 指令对于多任务模型来说, 就是监督的label(task), 但是对于LLM模型来说, 他也可以成为label下的input, 所以已经弱化了多任务学习, 而是学习一个task, 但是这个task是复合的)
>
> 人们把 NLP 任务做到 1000 多种, 目前最新模型可以做到 2000 多种 NLP 任务, 接下来再对 NLP 任务进行分类, 比如能力 A, 能力 B, 大模型指令能力, 泛化能力非常强, 学到四五十个任务时就可以泛化到上百种任务. 但距离真正的 ChatGPT 还有一步, 那就是和真实的人类意图对齐, 这就是 OpenAI 做的 GPT. 核心逻辑非常简单, 一开始时让人写答案, 但是成本太高, 改成让人来选答案, 这样对标注员的能力要求稍微低一点, 可以迅速提升迭代和规模. 基于打分再训练一个打分器, 通过打分器自动评价模型的好坏, 然后用强化学习开始迭代, 这种方法可以大规模地把数据模型迭代给转起来, 这是 OpenAI 做的 Instruct GPT 逻辑, **强化学习的人类反馈(RLHF)**.

总结: LLM模型是走向AGI的一个途径, 在图片领域飞速发展后, NLP也迎来了快速发展(Transformer, Bert, GPT), 文本和图像因为数据结构的特殊性, 在模型训练上有更多的挑战和可能. 另外, GPT的应用在特定的垂直领域, 仍然是一个发展的方向.

### GPT-4: 一张手绘草图能生一个网站, 60 秒搞定一个游戏开发!

https://mp.weixin.qq.com/s/wNQK_vPGhj5YOVVRLPmF_g

> "我们花了 6 个月的时间, 利用对抗性测试项目以及 ChatGPT 的经验, 反复调整 GPT-4, 结果在真实性, 可操作性以及拒绝超出道德等边界方面取得了有史以来最好的结果(尽管远非完美)", OpenAI 分享道.

> 微软的 Azure 与 OpenAI 共同设计了一台超级计算机, 搭载了英伟达上万颗 A100 芯片. 基于这台超算, OpenAI 在一年前将 GPT-3.5 作为系统的第一次"测试运行"进行了训练, 在修复一些 Bug 并提高理论基础之上, OpenAI 基于此又训练出了首个能够提前准确预测其训练性能的大模型 GPT-4.

> OpenAI 表示, 他们的目标是开发能够在任何智力任务方面取代人类的 AGI(通用人工智能), 尽管 GPT-4 还没有达到这个目标.
>
> 尽管有这样的能力, GPT-4 与早期的 GPT 模型有类似的局限性: 它不是完全可靠的, 比如, 它也会对事实产生"幻觉", 推理出错误的结果.
>
> 对此, OpenAI 首席执行官 Sam Altman 在推特上说: "它(GPT-4)仍然有缺陷, 仍然有局限性, 但它在首次使用时仍然能给你留下深刻印象. "

https://mp.weixin.qq.com/s/wkTciKHC8jmYacvp3lg8xA GPT-4测试案例

### OpenAI 发布多模态 GPT-4 模型, 会开创哪些新的研究方向?

https://www.zhihu.com/question/589640227

@张俊林 https://www.zhihu.com/question/589640227/answer/2937925226

1. 竞争关系和训练集(模型)缺陷可能导致LLM封闭化发展
2. 训练的高效性仍然是LLM的一个方向(例如模型蒸馏后的小模型)
3. 强化学习仍然是固有数据集的一种增强方式, 可以让模型更加的鲁棒

相关阅读

1. https://www.zhihu.com/question/589639535
2. https://www.zhihu.com/question/584515782

### SIGIR'22 | 大规模推荐系统中冷启动用户预热的融合序列建模

1. 对整个用户向量进行建模, 而不是对用户id进行建模
2. 基于DSSM模型
3. 正负反馈融合建模, 利用充分的负反馈增加模型的信息
4. 交互数据中的二八原则, 是否是二的用户贡献了八的交互

https://mp.weixin.qq.com/s/SmFYTlhYZQr3Tf3Km8cg2g

### 新时期的阿里妈妈广告引擎

https://zhuanlan.zhihu.com/p/523549804

讲的还算全面, 查漏补缺, 主要是对整个服务架构的由全图化架构(服务化?)到serverless化架构, 主要内容有:

1. 整体架构上serverless

   1. 特征抽取, 业务算子; 数据规范, 抽象, 规范; 统一框架, 抽象, 接口, 配置化(数据+算子+模型)
   2. serverless就是在原有全图化的基础上, 再次做拆分和抽象, 实现服务化的拆分为去服务化
   
2. 召回架构

3. 智能出价

   1. 基于公式的出价: 业务整体的限制, 可个性化不高, 业务限制大, 迭代成本高, 尝试的空间不高
   2. 基于模型的出价有更大的个性化空间, 更大的参数空间, 最优化能力更强.

4. 智能创意

   1. 这里创意可以在b端客户发帖时建议多个标题, 供客户筛选, 而线上则简单的选取创意模型保证创意的可控(创意工具化)

## 2023-02

### ~~Java生态圈技术框架,中间件,系统架构汇总~~

https://juejin.cn/post/6844903620979212296

2018年的汇总文章, 但是对java开发的整体框架有一个较好的总结

### 快手精排模型实践

https://mp.weixin.qq.com/s/SsgVqei9sL5y7N1GUXOJLg

1. 业务特点, 时序的重要性, 可能RNN, transformer等不及sum pooling, 那么就需要思考是否是相关性大于时序性了
2. 推荐的相关性和多样性如何保证?

### 阿里新一代Rank技术

https://mp.weixin.qq.com/s/5k2Clf6e_Xnx3Tuedtst0g

1. 阿里巴巴深度学习迭代路径
   1. DIN(18) 多峰兴趣建模
   1. DIEN(19) 多峰兴趣漂移&演化建模
   1. MIMN(19) 长期兴趣建模
   1. SIM(20) life-long兴趣建模
   1. 注意: 这一系列一直致力于`用户兴趣建模`
2. SIM: GSU/ESU
   1. GSU: general search: actioned embedding distance
   2. ESU: exact search: cate tree etc.

### 算法工程师的"天地之间"

https://zhuanlan.zhihu.com/p/495479206

~~系统架构是天, 数据细节是地, 天地之间, 建模能力和技术能力才是算法工程师的术与道~~

系统架构是天, 业务理解是地, 建模能力和工程技术才是算法工程师的核心


## 待读

冷启动

1. https://zhuanlan.zhihu.com/p/377229717
2. https://zhuanlan.zhihu.com/p/548297540

检索

1. https://theory.stanford.edu/~sergei/papers/vldb09-indexing.pdf
2. https://zhuanlan.zhihu.com/p/591048449
3. https://www.zhihu.com/question/68232124/answer/2498391364
4. https://www.zhihu.com/people/leon_zju/posts?page=1

多场景&多目标

1. https://github.com/shenweichen/DeepCTR
2. https://github.com/shenweichen/DeepMatch
3. https://mp.weixin.qq.com/s/Nm5sMkeYJmr-zShVY1WoPQ 一文梳理业界多场景多目标精排建模方案
4. https://mp.weixin.qq.com/s/4FRc-keU_4H8ZCYiKftqaA 多场景多任务推荐方法汇总
5. https://mp.weixin.qq.com/s/0GfIdgnYvQWANTiLh2qH3A 多目标推荐场景下的深度学习实践(58罗景)

chatGLM

1. https://mp.weixin.qq.com/s/kNXAuCiX4I7Tj4iwZSTP2Q 保姆级部署, 但是没有fineturn
2. https://mp.weixin.qq.com/s/JDd7aSZRHIPtJWlSRevzlg 一篇功能介绍和测评的, 还有与其他大模型的对比
3. https://mp.weixin.qq.com/s/51EtMK4SQLR4TvYDi_Uxxw fineturn 推荐
4. https://mp.weixin.qq.com/s/gbdV0L2bD-8ToXVGEKhdpQ 简单部署+论文解读
5. https://mp.weixin.qq.com/s/ob0EBqiTANlePKrDC9_uQA 部署(这个挺详细的)

lora

### UNSORT

1. https://zhuanlan.zhihu.com/p/651080682 KDD 2023 | 搜广推相关论文集锦

2. https://www.zhihu.com/question/515459299/answer/2519427121 羽毛球掌握什么原理后让你球技大涨?
3. https://zhuanlan.zhihu.com/p/673932082 推荐算法架构3：精排（万字长文）
4. 神级程序员都在用什么工具? - 狐哥的回答 - 知乎
   https://www.zhihu.com/question/465346075/answer/2048804228
5. https://zhuanlan.zhihu.com/p/667616967 汇总｜6篇文章带你了解CVR去偏现状
6. https://zhuanlan.zhihu.com/p/660797252 快手内容冷启动推荐模型实践
7. 




[TOC]
