@ECHO OFF
TITLE 绿化

>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

taskkill /f /im Xshell*   >NUL 2>NUL
sc stop "FlexNet Licensing Service"  >NUL 2>NUL
sc delete "FlexNet Licensing Service"  >NUL 2>NUL

:x86
if not exist "%WinDir%\SysWOW64" mkdir "%CommonProgramFiles%\NetSarang"  >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" copy /y XshellCore.tlb "%CommonProgramFiles%\NetSarang" >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Path /d "%~dp0\" >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Version /d "6.0.0125" >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v Company /d "小俊工作室" >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\NetSarang\Xshell\6" /f /v UserName /d "小俊" >NUL 2>NUL
if not exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\NetSarang\License\6\6" /f /v ProductKey /d "181015-111246-999321" >NUL 2>NUL
:x64
if exist "%WinDir%\SysWOW64" mkdir "%CommonProgramFiles(x86)%\NetSarang"  >NUL 2>NUL
if exist "%WinDir%\SysWOW64" copy /y XshellCore.tlb "%CommonProgramFiles(x86)%\NetSarang" >NUL 2>NUL
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Path /d "%~dp0\" >NUL 2>NUL
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Version /d "6.0.0125" >NUL 2>NUL
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v Company /d "小俊工作室" >NUL 2>NUL
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell\6" /f /v UserName /d "小俊" >NUL 2>NUL
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\Wow6432Node\NetSarang\License\6\6" /f /v ProductKey /d "181015-111246-999321" >NUL 2>NUL

ECHO.&ECHO 绿化完成！创建快捷方式？
ECHO.&ECHO 是按任意键，否直接关闭！&PAUSE >NUL 2>NUL & CLS

mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\Xshell 6.lnk""):b.TargetPath=""%~dp0Xshell.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")

ECHO.&ECHO 创建完成！按任意键退出！&PAUSE >NUL 2>NUL & EXIT