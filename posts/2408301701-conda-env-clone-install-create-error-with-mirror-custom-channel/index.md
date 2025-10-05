# conda-env-clone-install-create-error-with-mirror-custom-channel


[TOC]

## 问题原因

突然不能克隆`base`环境了

```sql
rm -rf pyspark3602; conda create --name pyspark3602 --clone base
Source:      /home/hdp_lbg_ectech/wangke/app/anaconda3
Destination: /home/hdp_lbg_ectech/wangke/app/anaconda3/envs/pyspark3602
The following packages cannot be cloned out of the root environment:
 - http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/linux-64::conda-4.9.2-py36h5fab9bb_0
 - defaults/linux-64::conda-build-3.10.5-py36_0
Packages: 195
Files: 64657

...

CondaHTTPError: HTTP 404 NOT FOUND for url <http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/noarch/keras-applications-1.0.8-py_1.tar.bz2>
Elapsed: 00:00.351600

An HTTP error occurred when trying to retrieve this URL.
HTTP errors are often intermittent, and a simple retry will get you on your way.
```

### 第一个问题

这里的主要问题是使用了清华的镜像. 清华镜像只有文件`.conda`后缀, 没有`.tar.bz2`后缀的文件,所以报`CondaHTTPError: HTTP 404 NOT FOUND for url`错误导致不能创建环境

http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/noarch/keras-applications-1.0.8-py_1.tar.bz2 *不存在*

https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/noarch/keras-applications-1.0.8-py_1.conda *存在*

### 第二个问题

无论如何修改, 删除不了拷贝base镜像的`清华镜像`(http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/linux-64::conda-4.9.2-py36h5fab9bb_0), 包括`vim ~/.bashrc`清空`channel`, 或者指定一个channel

- https://blog.csdn.net/qq_22498427/article/details/107792922 ## CondaHTTPError: HTTP ERROR 指定一个源
- https://zhuanlan.zhihu.com/p/588734867
- https://blog.csdn.net/u013249853/article/details/90287518 ## conda 中科大与清华园都相继停止服务了 不能下载了 恢复默认源 才能下载



## 猜想, 拷贝源为原有安装源

```sql
conda list | awk '!a[$NF]++'
# packages in environment at /home/hdp_lbg_ectech/wangke/app/anaconda3:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main    http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
aiohttp                   3.8.1                    pypi_0    pypi
anaconda-navigator        1.8.7                    py36_0    defaults
argon2-cffi               20.1.0           py36h1d69622_2    http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
ca-certificates           2024.7.2             h06a4308_0    https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main         # !!不可用(pkgs/main)
findspark                 2.0.1              pyhd8ed1ab_0    https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge # 可用(cloud/conda-forge)
```

原因就是镜像中`pkgs/main`中删除了源代码文件`*.tar.bz2`, 只剩下了`*.conda`, 所以找不到文件报404错误!

但是镜像中`cloud/conda-forge`是存在的, 且可以使用的, 因此配置镜像只使用这一个!!

### 添加 `--offline`参数, `-vv`为debug参数

```sql
rm -rf /home/hdp_lbg_ectech/wangke/app/anaconda3/envs/pyspark3603; conda create -vv --name pyspark3603 --clone base --offline
## 这个没有参数` --no-builds`
错误变成了如下: 
RuntimeError('EnforceUnusedAdapter called with url http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/_libgcc_mutex-0.1-main.tar.bz2\nThis command is using a remote connection in offline mode.\n',)
RuntimeError('EnforceUnusedAdapter called with url http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/_tflow_select-2.3.0-mkl.tar.bz2\nThis command is using a remote connection in offline mode.\n',)
```

即使添加了`--offline`参数, 仍然是需要访问网络的!

- https://github.com/conda/conda/issues/5063
- https://blog.csdn.net/weixin_42414714/article/details/118107150 ## Error记录: RuntimeError:This command is using a remote connection in offline mode.[CondaError]-CSDN博客

```sql
rm -rf /home/hdp_lbg_ectech/wangke/app/anaconda3/envs/pyspark3603; conda create --name pyspark3603 --clone base --channel defaults
# not work
```



## solution

### 1 导出全部包重新安装

可以先导出, 再安装, 见`5 导出环境信息, 重新构建(推荐)`

### 2 删除url信息(not work)

https://blog.csdn.net/weixin_42414714/article/details/118107150 ## Error记录: RuntimeError:This command is using a remote connection in offline mode.[CondaError]-CSDN博客

```sql
# not work
find /home/hdp_lbg_ectech/wangke/app/anaconda3/lib/python3.6 -name 'urls*'
./site-packages/jedi/third_party/django-stubs/django-stubs/conf/urls
./site-packages/jedi/third_party/django-stubs/django-stubs/contrib/admindocs/urls.pyi
./site-packages/jedi/third_party/django-stubs/django-stubs/contrib/auth/urls.pyi
./site-packages/jedi/third_party/django-stubs/django-stubs/contrib/flatpages/urls.pyi
./site-packages/jedi/third_party/django-stubs/django-stubs/contrib/staticfiles/urls.pyi
./site-packages/jedi/third_party/django-stubs/django-stubs/core/checks/urls.pyi
./site-packages/jedi/third_party/django-stubs/django-stubs/urls
./site-packages/jedi/third_party/typeshed/third_party/2and3/werkzeug/urls.pyi
./site-packages/pip/_internal/utils/__pycache__/urls.cpython-36.pyc
./site-packages/pip/_internal/utils/urls.py
./site-packages/werkzeug/__pycache__/urls.cpython-36.pyc
./site-packages/werkzeug/urls.py

grep -rnw "." -e 'tsinghua'
./thulac-0.2.1.dist-info/METADATA:7:Author-email: liuzy@tsinghua.edu.cn


### bingo
### bingo
### bingo

grep -rnwI . --include=\*.{json} --exclude-dir={site-packages,envs} -e "tsinghua" | more
grep -rnwI . --include=\*.{json} --exclude-dir={site-packages,envs} -e "tsinghua" | grep 'findspark'
./conda-meta/intel-openmp-2020.2-254.json:4:  "channel": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64",
./conda-meta/intel-openmp-2020.2-254.json:58:  "url": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/intel-openmp-2020.2-254.tar.bz2",
./conda-meta/_libgcc_mutex-0.1-main.json:4:  "channel": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64",
./conda-meta/_libgcc_mutex-0.1-main.json:27:  "url": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/_libgcc_mutex-0.1-main.tar.bz2",
./conda-meta/ipykernel-5.4.3-py36he448a4c_0.json:4:  "channel": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/linux-64",
./conda-meta/ipykernel-5.4.3-py36he448a4c_0.json:1122:  "url": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/linux-64/ipykernel-5.4.3-py36he448a4c_0.tar.bz2",
./conda-meta/_tflow_select-2.3.0-mkl.json:4:  "channel": "http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64",


mv conda-meta conda-meta-bak-2024-08-30
conda list

EnvironmentLocationNotFound: Not a conda environment: /home/hdp_lbg_ectech/wangke/app/anaconda3/envs/pyspark3602

!!!conda install 可以添加 --no-builds 参数
 
## 看来直接删除时不行的!!
## `conda-meta`是环境的必须文件, 包含了整个环境每个包的信息, 没有这个文件夹就不是一个conda环境!!

替换
vim anaconda-navigator-1.8.7-py36_0.json
https://repo.anaconda.com/pkgs/main/linux-64/anaconda-navigator-1.8.7-py36_0.tar.bz2


"channel": "https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/noarch",
"url": "https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/noarch/findspark-2.0.1-pyhd8ed1ab_0.tar.bz2",


```

### 3 修改代码认证

### 4 直接拷贝整个anaconda(推荐, 离线拷贝方法, 无源验证)

其实这样不好, 因为大家都在base上安装的, 但是可以保证一致性, 且不会有`源验证`

使用rsync拷贝

```sql
# 准备环境(清理缓存)
#conda activate base
yes | conda clean --all || echo "ERR_IGN" # no echo will break the app
conda list | grep -E 'pandas|matplotlib|wktk|tensorflow|numpy|findspark'

# 复制
# rsync exclude 匹配的是`sending incremental file list中的路径(envs/py310/ssl/)`
rm -rf "${CONDA_BASE}/envs/${FLAG}" # copy前删除旧的
rsync -av --progress --exclude={'anaconda3/envs','site-packages/torch','site-packages/xgboost','site-packages/thulac'} ${CONDA_BASE} ${CONDA_BASE}/envs/
mv ${CONDA_BASE}/envs/anaconda3 ${CONDA_BASE}/envs/${FLAG}
```

@deprecated(使用压缩打包的方法)

```sh
# 拷贝完整base环境为新的环境
cd /opt/users/wangke/app/anaconda3/envs
conda activate base
yes | conda clean --all
conda list | grep -E 'pandas|matplotlib|wktk|tensorflow|numpy|findspark'



tar --exclude='./envs' --exclude=**/site-packages/torch --exclude=**/site-packages/xgboost --exclude=**/site-packages/thulac -zcvf pyspark360.tar.gz .
mkdir pyspark3602; tar -xvf pyspark3602.tar.gz -C pyspark3602 --strip-components=1

source activate pyspark3602
conda env list ## 也正常了
```



### 5 导出环境信息, 重新构建(推荐)

https://www.codeleading.com/article/99734905584/ fxxk

https://blog.csdn.net/qq_35091353/article/details/111194704 ## ubuntu下移植一个服务器的虚拟环境到另一台服务器_condaenvexception: pip failed-CSDN博客 强烈推荐

https://www.jianshu.com/p/42f909d59ae7 ## conda 迁移环境 - 简书

```sql
conda env export --no-builds | grep -v "^prefix: " > environment.yml

# 修改文件
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free
conda config --set show_channel_urls yes

---
name: pyspark3603
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
  - defaults
dependencies:
  - _libgcc_mutex=0.1
  - _tflow_select=2.3.0
...
  - pip:
    - aiohttp==3.8.1
...
---

!!! 注意: 这里默认情况下, pip部分是安装失败的(envs/my_envs/../site-package下是没有pip安装的包的)
Installing pip dependencies: \ Ran pip subprocess with arguments:
['/home/hdp_lbg_ectech/.conda/envs/pyspark3603/bin/python', '-m', 'pip', 'install', '-U', '-r', '/opt/users/wangke/app/anaconda3/envs/condaenv.y6ynuqy0.requirements.txt']
Pip subprocess output:
Looking in indexes: https://pypi.tuna.tsinghua.edu.
Pip subprocess error:
WARNING: Retrying (Retry(total=0, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x7f95c9c0ed30>: Failed to establish a new connection: [Errno -2] 未知的名称或服务',)': /aiohttp/
...
ERROR: Could not find a version that satisfies the requirement aiohttp==3.8.1 (from versions: none)
ERROR: No matching distribution found for aiohttp==3.8.1
failed
CondaEnvException: Pip failed
---
## 所以修复方法有两种, 
方法1: 都使用conda安装; # https://github.com/conda/conda/issues/9628
这里直接修改`environment.yml`, 去除pip的层级


方法2: 分别导出conda部分和pip部分, 使用环境中的pip安装(并不是激活环境后使用pip安装)
即使激活环境也不能直接使用pip安装, 因为默认的pip(which pip)仍然是base的pip, 需要使用环境的pip才能安装正确
https://stackoverflow.com/a/43729857/6494418

pip freeze > requirements.txt  ## 这个是base环境的pip(which pip)
pyspark3604/bin/pip install -r requirements.txt  ## 新建环境下的pip(这个地方也记录了安装的途径, 如果途径无效也无法安装--)
!!! 所以还是复制创建环境?

conda env create -f environment.yml -p /opt/users/wangke/app/anaconda3/envs/pyspark3604
xx conda env create -f environment.yml  ## 这里最好加上prefix, 不然会生成到`~/.conda/envs`路径下

ResolvePackageNotFound:
  - jupyter_client=6.1.11
  - prompt-toolkit=3.0.14
  - findspark=2.0.1
  - python_abi=3.6
  - parso=0.7.1
  - nodejs=12.4.0
  - ipykernel=5.4.3
  - pandoc=2.11.4


## this mean create failed
## 这里需要排查一下, 是不是镜像都换路径了, 改成了不使用build的方式

https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge

```

### 6 指定channel(not work)

https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/channels.html ## Channels — conda 24.7.2.dev64 documentation

```
conda install scipy --channel conda-forge --channel bioconda
conda search scipy --channel file:/<path to>/local-channel --override-channels


conda create -vv --name pyspark3603 --clone base --channel conda-forge --override-channels
```

## 总结

造成原因仍然是因为conda env中环境的定义`conda-meta`中记录的`安装源`, clone时需要访问安装源, 如果安装源不能访问, 则会造成克隆失败(这里是镜像`pkgs/main`中缺少了编译的源文件`*.tar.bz2`, 但是源`cloud/conda-forge`是有的), 但是未找到绕过这个链接的方法.

解决方法有两种:

1. 离线clone 不需要访问网络, 使用rsync进行复制
   1. 使用rsync clone整个项目(exclude, envs)
2. 在线clone 需要访问网络, 导出所有包信息, 再根据包及版本进行安装
   1. export 和 install with export

## 参考

- https://blog.csdn.net/qq128252/article/details/127064929
- https://stackoverflow.com/questions/60077137/conda-how-to-ignore-if-a-conda-channel-is-not-reachable-ignore-unavailableinva ## python - Conda: How to ignore if a conda channel is not reachable? Ignore UnavailableInvalidChannel? - Stack Overflow














