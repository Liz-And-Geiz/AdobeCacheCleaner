@echo off
set Dir=C:\Users\%username%\AppData\Roaming\Adobe\Common\Media Cache Files\
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"个文件"') do set size=%%~a
echo 路径：%Dir%
if "%size%"=="0" goto Z else goto O

:Z
echo "目录为空" 
pause
Exit

:O
echo 总大小为：%size:,=% Byte
if "%size%" gtr "1073741824" goto C
if "%size%" gtr "1048576" goto B
if "%size%" gtr "1024" goto A

:A
set /a sizekb=%size%/1024
echo 总大小为：%sizekb:,=% KB
pause
goto X

:B
set /a sizemb=%size%/1048576 
echo 总大小为：%sizemb:,=% MB
pause
goto X

:C
set /a "sizegb=%size%/1073741824"
echo 总大小为：%sizegb:,=% GB
pause
goto X

:X
echo 是否开始执行“清空Pr缓存”任务
pause
del "C:\Users\Franklin\AppData\Roaming\Adobe\Common\Media Cache Files\*.*"
echo 完成
pause
Exit