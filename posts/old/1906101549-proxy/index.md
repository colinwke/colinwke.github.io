# proxy


## 2025-09-21 update

clash X可能不在维护, macos 推荐clash-party

- https://github.com/mihomo-party-org/clash-party/releases

- https://github.com/clashdownload/Clash/tree/main



## 原文

用了一个很久的(从18年到现在(25年), 稳定, 简单), 名字叫`MEWU`, **强烈推荐**

![image-20231110151107673](assets/1906101549-proxy/image-20231110151107673.png)

套餐列表

![image-20231110150942264](assets/1906101549-proxy/image-20231110150942264.png)

- [https://sbirdo.me](https://sbirdo.me/auth/register?code=VEpvbz7ADA)
- 特点
  - 简单(中文的, 有详细教程, 提供了软件的下载链接), 成本低(可以每月付, 最低10元, 有1元的体验版)
  - 点我的`邀请链接`会给我返利哟, 算对我的支持吧 [[邀请链接](https://sbirdo.me/auth/register?code=VEpvbz7ADA)]



另外一个, 有个朋友一直在用的

- <https://home.shadowsocks.ch/cart.php>
- 特点
  - 用的人挺多, 目前稳定性应该是非常好的
  - 但是只能年付, 虽然算下来也是每月10元, 但是成本还是算高
  
  

还有一个, 另外一个朋友在用的, 需要自己搭, 我还没有试过, 后面换的话可能会试

- [自建ss服务器教程](https://github.com/Alvin9999/new-pac/wiki/自建ss服务器教程)
- https://zoomyale.com/2016/vultr_and_ss
- [科学上网-vultr-vps-搭建-shadowsocks-ss-教程](https://medium.com/@jackme256/科学上网-vultr-vps-搭建-shadowsocks-ss-教程-新手向-968613081aae)
- 特点
  - 设置较为复杂, 自己买服务器, 好像成本也挺高的, 但是流量较于前两个多



### clashX

clashX download: https://github.com/yichengchen/clashX/releases

with switch omega

- https://github.com/Dreamacro/clash/issues/173
- https://maofun.com/739.html
- https://switchyomega.org/



```
网址协议	代理协议	代理服务器	代理端口	
(默认)	SOCKS5 127.0.0.1 7897(# 注意代理端口为低端代理端口)

# 不代理的地址列表
127.0.0.1
::1
localhost
*.58corp.com*
10.*
```

### 公司内网被代理不能正常访问(公司内网)

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
    <string>192.168.0.0/16</string>
    <string>10.0.0.0/8</string>
    <string>172.16.0.0/12</string>
    <string>127.0.0.1</string>
    <string>localhost</string>
    <string>*.local</string>
    <string>timestamp.apple.com</string>
    <!--上面的不要删, 在下面添加你想要忽略的域名-->
</array>
</plist>
<!-- proxyIgnoreList.plist -->
<!-- 或者直接在`网络/wifi设置/详细信息/代理`中设置 -->
```

注意: 不要使用增强模式, 增强模式会忽略所有的ignore(绕过代理)



###  2024-06-03 update

使用系统代理, Safari可以访问Google, 否则不能访问, 所以系统代理就是底层完全代理?

但是在系统代理下Chrome使用SwitchyOmega的[直接连接]仍然不能访问Google? 需要使用[系统代理]才能访问



```
## 在终端里面输入
ping google.com ## 全局模式失败, 规则模式成功
```

系统代理 -> 系统层面的代理, 由其他扩展或系统层面控制

proxy -> proxy是映射到了本地的一个端口进行代理

当配置成功后, 需要开启系统代理才能使用, 否则无法正常使用代理(代理软件为灰色)!

1. https://clashxpro.org/all-proxy-client/
2. https://clashverge.org/
3. https://clashverge.org/clash-verge-download/







[TOC]




