# save-win10-spotlight


保存win10 spotlight 壁纸到D盘下!



![1546063951450](assets/save-win10-spotlight/1546063951450.png)



1 将下面文本保存为`win10_spotlight.bat`([直接下载](assets/save-win10-spotlight/win10_spotlight.bat))

``` bat
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
```

2 双击执行, 执行后前往`D:\spotlight\`查看



**参考**:

- https://blog.csdn.net/qq_34260368/article/details/78364055
- https://blog.csdn.net/linbounconstraint/article/details/80191846
- https://blog.csdn.net/Anymake_ren/article/details/51125609
- https://stackoverflow.com/questions/17587347/batch-file-to-run-xcopy-without-overwriting-existing-files
