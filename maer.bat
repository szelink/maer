@echo off&color 3
chcp 65001
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"
echo 当前运行路径是:%CD%
echo 已获取管理员权限

:: 获取当前用户Desktop路径
set  cerPath1=%USERPROFILE%\Desktop\*.net.crt
set  cerPath2=%USERPROFILE%\Desktop\*.net.pfx
 :: 判定存在
if exist "%cerPath1%" (
   echo "证书文件1存在，路径：%cerPath1%"
) else (
 
 echo "证书文件1不存在，建议重新下载"
 
)
if exist "%cerPath2%" (
   echo "证书文件2存在，路径：%cerPath2%"
) else (
 
 echo "证书文件2不存在，建议重新下载"
 
)
cd %USERPROFILE%\Desktop
CERTUTIL -addstore  -user  -f -v  "CA"  "*.net.crt"
::将证书导入个人可信

CERTUTIL -addstore -enterprise -f -v root "*.net.crt"
::将证书导入本地计算机上的受信任的根证书颁发机构

CERTUTIL   -p vf0I07uC -importpfx "*.net.pfx"
::在本地计算机上将pfx导入Personal

CERTUTIL -addstore  "TRUSTEDPEOPLE" "*.net.crt"
::将证书导入本地计算机上的受信任人员
::最终用win+r,certmgr.msc查看
pause