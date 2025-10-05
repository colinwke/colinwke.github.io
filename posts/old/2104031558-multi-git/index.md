# 多git协作






多git有两种状态

- 多个git账号(user, email)
- 多个认证(identities)



## 设置多个git账号

前提: git版本号(`git --version`)>=2.13

`vim ~/.gitconfig`

注意: 路径`gitdir:`后面要加斜杠`/`

```toml
# specify multiple users with git
# refs: https://stackoverflow.com/a/43654115 and https://stackoverflow.com/a/48088291
# use `git config --get user.email` to check config is working

# default user config
# specify multiple users with git
# refs: https://stackoverflow.com/a/43654115 and https://stackoverflow.com/a/48088291
# use `git config --get user.email` to check config is working


[core]
    # git show chinese charactor # https://stackoverflow.com/a/4416780/6494418
    quotepath = false

[user]
  name = wangke
  email = wangkest@qq.com

# specific for working
[includeIf "gitdir:/Users/wangke/working/"]  # 末尾加斜杠
  path = ~/.gitconfig_working
  
# specific for working2
# [includeIf "gitdir:/Users/wangke/working/2/"]  # 末尾加斜杠
#   path = ~/.gitconfig_working2
```

然后配置刚才指定的配置文件

`vim ~/.gitconfig_working`

```toml
[user]
  name = working_name
  email = working_name@working_name.com
```

`vim ~/.gitconfig_working2`

```toml
[user]
  name = working_name2
  email = working_name2@working_name.com
```

然后在已配置路径下的`~/这个路径下使用私人账号/`或者`~/这个路径下使用工作账号/`执行命令, 可发现可以自动选择用户了

```sh
cd ~/该路径下使用私人账号/
git config --get user.email
```



## refs

- https://gist.github.com/bgauduch/06a8c4ec2fec8fef6354afe94358c89e

