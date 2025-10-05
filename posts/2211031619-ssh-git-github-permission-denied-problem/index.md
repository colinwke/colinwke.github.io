# ssh git github permission denied problem




## 问题描述

原来在/etc/hosts配置了github的ip解析, 突然有一天push很慢, 甚至经常timeout. 然后自己把hosts中关于github的映射都删除了, 但是链接不上了github了, 自己有用飞机软件.



### 具体表象

重新生成了ssh-key, 也配置到github上了, 使用`ssh -T git@github.com`验证时要求输入密码, 但是任何密码都permission denied.

```bash
$ ssh -T git@github.com
The authenticity of host 'github.com (10.252.108.57)' can't be established.
ED25519 key fingerprint is SHA256:XXXXXXXXXCssXNTIE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
git@github.com's password:
Permission denied, please try again.
git@github.com's password:
Permission denied, please try again.
git@github.com's password:
git@github.com: Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).
```

试了多种方法, 各种密码, 这一步一直验证失败





### 解决方案

首先在[这里](https://superuser.com/questions/1743034/still-requiring-ssh-password-after-setting-ssh-key-on-github)看到了`dns pollution`的概念, 然后具体搜索关键词`dns pollution ssh -T git@github.com`找到了[解决方案](https://juejin.cn/post/7103738143513247781), 自己配置github的ip解析.

我遇到的问题和[解决方案](https://juejin.cn/post/7103738143513247781)略有区别, 我解析到的github的ip并不是本机ip(127.0.0.1), 而是另一个看着挺正常的ip.



具体的的解决方法, 查询`github.com`, `ssh.github.com`的ip地址, 然后配置到hosts

方法1: 使用[ipaddress](https://www.ipaddress.com/)查询

方法2: 使用bash查询

```sh
nslookup github.com 8.8.8.8 | awk '{print $2}' | tail -n 3 | tr '\n' ' ' | awk '{print $2,$1}'
nslookup ssh.github.com 8.8.8.8 | awk '{print $2}' | tail -n 3 | tr '\n' ' ' | awk '{print $2,$1}'
```

把查询的ip映射添加到hosts里面

sudo open -a "Sublime Text" /etc/hosts

```sh
# github
# https://juejin.cn/post/7103738143513247781
# nslookup ssh.github.com 8.8.8.8 | awk '{print $2}' | tail -n 3 | tr '\n' ' ' | awk '{print $2,$1}'
20.205.243.166 github.com
20.205.243.160 ssh.github.com
```



现在使用验证`ssh -T git@github.com`成功通过!



## 参考链接

- https://juejin.cn/post/7103738143513247781

- https://www.shouxicto.com/article/5947.html

- https://docs.gitlab.com/ee/user/ssh.html#generate-an-ssh-key-pair

- https://docs.github.com/cn/authentication/connecting-to-github-with-ssh

- https://docs.github.com/en/github-ae@latest/authentication/troubleshooting-ssh/error-permission-denied-publickey

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

- https://stackoverflow.com/a/72236267/6494418

  





```sh
git push
To igit.58corp.com:RecruitBusiness/AdRetrievalSys/lego_scf_zpdsp.git
 ! [rejected]            4.1.43_dev_wangke_2022-12-22 -> 4.1.43_dev_wangke_2022-12-22 (non-fast-forward)
error: failed to push some refs to 'igit.58corp.com:RecruitBusiness/AdRetrievalSys/lego_scf_zpdsp.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

[wangke@colin service] $ git pull
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint: 
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.

```



solution

```bash
# https://stackoverflow.com/questions/20467179/git-push-rejected-non-fast-forward
git fetch
git rebase YOUR_BRANCH_NAME
git push origin feature/my_feature_branch

or 
# https://docs.github.com/en/get-started/using-git/dealing-with-non-fast-forward-errors
git fetch origin
git merge origin YOUR_BRANCH_NAME
git pull origin YOUR_BRANCH_NAME
```



new error

```bash
[wangke@colin service] $ git pull origin 4.1.43_dev_wangke_2022-12-22 
From igit.58corp.com:RecruitBusiness/AdRetrievalSys/lego_scf_zpdsp
 * branch                4.1.43_dev_wangke_2022-12-22 -> FETCH_HEAD
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint: 
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.

```

solution

```sh
git config --global pull.ff only
git config pull.ff only
```



```sh
git pull -a
fatal: Not possible to fast-forward, aborting.

# git pull --no-ff
or
git pull --rebase ## Git push rejected "non-fast-forward" --ff-only

# then 
git push
```


