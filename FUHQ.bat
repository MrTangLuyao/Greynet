@echo off
color f0
CLS
cd C:\
CLS

echo 杀手目标路径 在 此电脑的 C:\3000soft\Red Spider

echo ============================软件开始运行=========================
rem version introduction complete
rem 2.1 set /p key=“请确认激活程序已经填写了正确的许可证号并且运行完成”
rem 2.1 if not "%key%"=="nicktang" goto exitcode
rem 3.0bug echo “请输入许可证号并且按任意按键继续”
goto yesornokey

:yesornokey
set /p key=“请输入许可证号并且按enter键继续”
if "%date:~5,2%" lss "10" (set mm=0%date:~6,1%) else (set mm=%date:~5,2%)
if "%date:~8,2%" lss "10" (set dd=0%date:~9,1%) else (set dd=%date:~8,2%)
if "%time:~0,2%" lss "10" (set hh=0%time:~1,1%) else (set hh=%time:~0,2%)
if "%time:~3,2%" lss "10" (set nn=0%time:~4,1%) else (set nn=%time:~3,2%)
set numberin=%Date:~0,4%%mm%%dd%
set /a boss=%numberin%*99-1
set /a chendengxiong=%numberin%*3345-143
set /a xiaxvyao=%numberin%*2345-756
if not %key%==%boss% goto no
if %key%==%boss% goto yes

:no
if not %key%==%chendengxiong% goto nono
if %key%==%chendengxiong% goto yes

:nono
if not %key%==%xiaxvyao% goto nononono
if %key%==%xiaxvyao% goto yes

:nononono
set /p again= 输入的许可证号错误，输入r重试,输入e退出
if "%again%"=="r" goto yesornokey
if "%again%"=="e" goto exitcode
if "%again%"=="dev" goto developmode

:exitcode
echo 软件已退出,因为许可证错误，goodbye！
exit
pause

:yes
echo 你输入的某一种许可证通过了验证，开始执行程序
pause
CLS
color f4
CLS
echo 以下是使用条款（试行）请仔细阅读
echo 1.FUHQ系列软件 (后文简写为本软件)，本质上是一种解决网络问题和红蜘蛛网络教室的卸载程序一体化的软件，软件本身经查阅资料不违反其他软件使用条例。
echo 2.本软件的目标群体是大众用户，为了解决卸载困难用户优化而来，所产生的行为后果全部归软件使用者自行承担。
echo 3.本软件已经购买不得无理由退款。
echo 4.最终解释权归本软件作者所有。
echo 5.如果您接受条款，则可以享受本软件的部分服务，否则将退出程序。
echo 	请问是否接受全部条款?如果接受请按任意按键继续，不接受请按ctrl+c即可拒绝，同时您不能继续运行FUHQ。
pause
CLS
echo 第一阶段:红蜘蛛杀手
echo !!!红蜘蛛将从磁盘中删除!!!
echo ???你确定要删除 红 蜘 蛛 么???
set /p warning="###最后一次机会，请按任意按键继续，按ctrl+c即可停止运行###"
pause
rem 旧的逻辑 if not "%warning%"=="yes" goto afraid
CLS
cd C:\3000soft\Red Spider
CLS
taskkill /f /t /im ePointer.exe
del /F /S /Q ePointer.exe
taskkill /f /t /im REDAgent.exe
del /F /S /Q REDAgent.exe
color f0
CLS
echo 第一阶段杀手已完成!!!(version 4.0)
echo 马上进行第二阶段网络优化
pause
CLS
netsh interface ip set dns "以太网" static 223.5.5.5
netsh interface ip set dns "以太网1" static 223.5.5.5
netsh interface ip set dns "以太网2" static 223.5.5.5
netsh interface ip set dns "以太网3" static 223.5.5.5
netsh interface ip set dns "以太网4" static 223.5.5.5
netsh interface ip set dns "以太网5" static 223.5.5.5
netsh interface ip set dns "以太网6" static 223.5.5.5
netsh interface ip set dns "以太网7" static 223.5.5.5
netsh interface ip set dns "以太网8" static 223.5.5.5
netsh interface ip set dns "以太网9" static 223.5.5.5
netsh interface ip set dns "以太网10" static 223.5.5.5
netsh interface ip set dns "以太网11" static 223.5.5.5
netsh interface ip set dns "本地连接1" static 223.5.5.5
netsh interface ip set dns "本地连接"2 static 223.5.5.5
netsh interface ip set dns "本地连接3" static 223.5.5.5
netsh interface ip set dns "本地连接4" static 223.5.5.5
netsh interface ip set dns "本地连接5" static 223.5.5.5
netsh interface ip set dns "本地连接6" static 223.5.5.5
netsh interface ip set dns "本地连接7" static 223.5.5.5
netsh interface ip set dns "本地连接8" static 223.5.5.5
netsh interface ip set dns "本地连接9" static 223.5.5.5
netsh interface ip set dns "本地连接10" static 223.5.5.5
netsh interface ip set dns "本地连接11" static 223.5.5.5
netsh interface ip set dns "fuckyou" static 223.5.5.5
netsh interface ip set dns "WLAN" static 223.5.5.5
CLS
ipconfig /flushdns
echo 第二阶段网络优化完成，FUHQ已经全部执行完成!
echo 弘桥网络优化大师(version 2.1) 红蜘蛛杀手(version 4.0) FUHQ (version 1.0.401.211)
echo Bug feedback(email):320680273@qq.com
pause
exit

:afraid
echo 再见！！！
exit
pause

:developmode
echo !!!!!!!!!!!!!!!!DEV mode pass!!!!!!!!!!!!!!
pause
goto yes
