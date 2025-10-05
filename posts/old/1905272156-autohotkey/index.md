# AutoHotKey

## 1 下载AutoHotKey

[官网](<https://www.autohotkey.com/>), [点我直接官网下载](https://www.autohotkey.com/download/1.1/AutoHotkey_1.1.30.03.zip)

![1558966352586](assets/1905272156-AutoHotKey/1558966352586.png)



## 2 编辑脚本

另存下面脚本为`capslock_plus.ahk`

**注:** 下面脚本只适用于AutoHotKey1.XXX, 不使用于2.XXX(V2和其他版本有区别!)[直接下载](assets/1905272156-AutoHotKey/capslock_plus.ahk)

```python
; Autohotkey Capslock Remapping Script
; Colinwke
; More info at: TODO
;
; Functionality:
; - Deactivates capslock for normal (accidental) use.
; - Access the following functions when pressing Capslock:
;     Cursor keys           - J, K, L, I
;     Home, PgDn, PgUp, End - U, O, P, ;
;     Backspace and Del     - Y, H
;
;     Insert                - [
;     Close tab, window     - W, N
;     Previous, next tab    - M, ,
;     Undo, redo            - ., /
;     Menu                  - '
; - Numpad at the right hand resting position when holding Ctrl+Shift+Alt (using keys m,.jkluio and spacebar)
;
; To use capslock as you normally would, you can press WinKey + Capslock
; This script update from Danik's work: https://gist.github.com/Danik/5808330



;================================================================
#Persistent
SetCapsLockState, AlwaysOff


;================================================================
; Capslock + (ikjl) -> (up, down, left, right)

Capslock & i::Send {Blind}{Up DownTemp}
Capslock & i up::Send {Blind}{Up Up}

Capslock & k::Send {Blind}{Down DownTemp}
Capslock & k up::Send {Blind}{Down Up}

Capslock & j::Send {Blind}{Left DownTemp}
Capslock & j up::Send {Blind}{Left Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


;================================================================
; Capslock + (uop;) -> (home, end, pgup, pgdown)

Capslock & u::SendInput {Blind}{Home Down}
Capslock & u up::SendInput {Blind}{Home Up}

Capslock & o::SendInput {Blind}{End Down}
Capslock & o up::SendInput {Blind}{End Up}

Capslock & `;::SendInput {Blind}{PgDn Down}
Capslock & `; up::SendInput {Blind}{PgDn Up}

Capslock & p::SendInput {Blind}{PgUp Down}
Capslock & p up::SendInput {Blind}{PgUp Up}


;================================================================
; Capslock + (nw) -> (close tab|window)

Capslock & n::SendInput {Ctrl down}{F4}{Ctrl up}
Capslock & w::SendInput {Alt down}{F4}{Alt up}


;================================================================
; Capslock + ([hy) -> (insert, backspace, del)

Capslock & [::SendInput {Blind}{Insert Down}
Capslock & y::SendInput {Blind}{Del Down}
Capslock & h::SendInput {Blind}{BS Down}
Capslock & BS::SendInput {Blind}{BS Down}


;================================================================
; Capslock + (m,) -> (prev|next tab)
Capslock & m::SendInput {Ctrl Down}{Tab Down}
Capslock & m up::SendInput {Ctrl Up}{Tab Up}
Capslock & ,::SendInput {Ctrl Down}{Shift Down}{Tab Down}
Capslock & , up::SendInput {Ctrl Up}{Shift Up}{Tab Up}


;================================================================
; Capslock + (./) -> (undo, redo)
Capslock & .::SendInput {Ctrl Down}{z Down}
Capslock & . up::SendInput {Ctrl Up}{z Up}
Capslock & /::SendInput {Ctrl Down}{y Down}
Capslock & / up::SendInput {Ctrl Up}{y Up}

;================================================================
; Capslock + ; -> menu
Capslock & '::Send {Blind}{AppsKey DownTemp}
Capslock & ' up::Send {Blind}{AppsKey Up}


;================================================================
; Numpad using Ctrl+Shift+Alt + m,.jkluio or space

+^!Space:: SendInput {Numpad0}
+^!m:: SendInput {Numpad1}
+^!,:: SendInput {Numpad2}
+^!.:: SendInput {Numpad3}
+^!j:: SendInput {Numpad4}
+^!k:: SendInput {Numpad5}
+^!l:: SendInput {Numpad6}
+^!u:: SendInput {Numpad7}
+^!i:: SendInput {Numpad8}
+^!o:: SendInput {Numpad9}


;================================================================
; Make Capslock & Enter equivalent to Control+Enter
Capslock & Enter::SendInput {Ctrl down}{Enter}{Ctrl up}

; Make Capslock & Alt Equivalent to Control+Alt
!Capslock::SendInput {Ctrl down}{Alt Down}
!Capslock up::SendInput {Ctrl up}{Alt up}


;================================================================
; Make Win Key + Capslock work like Capslock (in case it's ever needed)
#Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else
    SetCapsLockState, AlwaysOn
Return

```



## 3 修改打开方式

修改`*.ahk`的默认打开方式为`AutoHotkeyU64.exe`

## 4 运行

win+r 输入 `shell:startup` 回车, 把脚本拷贝至当前路径下, 使得自动运行生效

双击脚本立即生效



## 5 映射表

![1558965817470](assets/1905272156-AutoHotKey/1558965817470.png)





参考: https://gist.github.com/Danik/5808330

## 其他参考



[capslock+ikjl 代替上下左右按键](<https://jingyan.baidu.com/article/a3761b2bfacc701577f9aa64.html>)

[ahk注释](https://www.zhihu.com/question/22109122): 单行注释用分号`;`，多行同C语言用`/* */`括起。

[按键列表](<https://wyagd001.github.io/zh-cn/docs/KeyList.htm>)

[映射符号](<https://zhidao.baidu.com/question/523242441.html>)

```
如下输入
`;::LCtrl
遇到可能被误引用的字符时，前缀` 比如`" `{ `% ``
```

[比较好的教程](<https://zhuanlan.zhihu.com/p/35379309>), [另一个教程](<https://www.cnblogs.com/jadeboy/p/5274995.html>)

[另外一个神器capslock+](<https://cjkis.me/capslock+/>)

[初学者向导](<https://wyagd001.github.io/zh-cn/docs/Tutorial.htm>)

[指南和概述](<https://ahkcn.github.io/docs/Tutorial.htm>)

[脚本展示](<http://ahkcn.sourceforge.net/docs/scripts/>)

[自启动](<https://blog.csdn.net/Zuostar/article/details/82558130>)

```
在运行里面输入: shell:startup
打开之后把要启动的脚本放进去即可
```

[热键, 组合键](<https://wyagd001.github.io/v2/docs/Hotkeys.htm#combo>)



## 几个capslock

[wsas代替上下左右](<https://github.com/wo52616111/capslock-plus>)

[hjkl代替上下左右](<https://github.com/matrix1001/capslock-plus-plus/blob/master/README-zh.md>)

[ijkl代替上下左右, 推荐](<https://gist.githubusercontent.com/Danik/5808330/raw/4189af0b4c15a173ed66e82331ae998e2cac4406/capslock_remap_alt.ahk>)


