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
