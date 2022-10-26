rem https://blog.csdn.net/qq_34260368/article/details/78364055
rem https://blog.csdn.net/linbounconstraint/article/details/80191846
rem https://blog.csdn.net/Anymake_ren/article/details/51125609
rem https://stackoverflow.com/questions/17587347/batch-file-to-run-xcopy-without-overwriting-existing-files

@echo off
MD wallpaper
xcopy "%UserProfile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" "D:\spotlight\" /S /Y /D

D:
cd "D:\spotlight\"
ren * *.jpg
pause
