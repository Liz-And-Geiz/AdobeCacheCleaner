@echo off
set Dir=C:\Users\%username%\AppData\Roaming\Adobe\Common\Media Cache Files\
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"���ļ�"') do set size=%%~a
echo ·����%Dir%
if "%size%"=="0" goto Z else goto O

:Z
echo "Ŀ¼Ϊ��" 
pause
Exit

:O
echo �ܴ�СΪ��%size:,=% Byte
if "%size%" gtr "1073741824" goto C
if "%size%" gtr "1048576" goto B
if "%size%" gtr "1024" goto A

:A
set /a sizekb=%size%/1024
echo �ܴ�СΪ��%sizekb:,=% KB
pause
goto X

:B
set /a sizemb=%size%/1048576 
echo �ܴ�СΪ��%sizemb:,=% MB
pause
goto X

:C
set /a "sizegb=%size%/1073741824"
echo �ܴ�СΪ��%sizegb:,=% GB
pause
goto X

:X
echo �Ƿ�ʼִ�С����Pr���桱����
pause
del "C:\Users\Franklin\AppData\Roaming\Adobe\Common\Media Cache Files\*.*"
echo ���
pause
Exit