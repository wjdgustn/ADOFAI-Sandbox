REM You can edit below values
set memory=8192
set ADOFAIDir=D:\SteamLibrary\steamapps\common\A Dance of Fire and Ice

REM Do not edit below!!!
set version=1

@echo off
title ADOFAIVM

cd %temp%

if not exist "%ADOFAIDir%" set ADOFAIDir=C:\Program Files (x86)\Steam\steamapps\common\A Dance of Fire and Ice

if not exist "%ADOFAIDir%" (
:enterDir
set /p ADOFAIDir=Enter ADOFAI directory: 

if not exist "%ADOFAIDir%" (
echo.
echo "%ADOFAIDir%" not exist
goto enterDir
)
)

set mainDir=ADOFAIVM%version%
if not exist %mainDir% mkdir %mainDir%

cd %mainDir%

if not exist adofai.wsb (
echo ^<Configuration^>
echo   ^<VGpu^>Enable^</VGpu^>
echo   ^<Networking^>Enable^</Networking^>
echo   ^<MappedFolders^>
echo     ^<MappedFolder^>
echo       ^<HostFolder^>%ADOFAIDir%^</HostFolder^>
echo       ^<SandboxFolder^>C:\Users\WDAGUtilityAccount\ADOFAIOriginal^</SandboxFolder^>
echo       ^<ReadOnly^>true^</ReadOnly^>
echo     ^</MappedFolder^>
echo 	^<MappedFolder^>
echo       ^<HostFolder^>%cd%\scripts^</HostFolder^>
echo       ^<SandboxFolder^>C:\Users\WDAGUtilityAccount\scripts^</SandboxFolder^>
echo       ^<ReadOnly^>true^</ReadOnly^>
echo     ^</MappedFolder^>
echo   ^</MappedFolders^>
echo   ^<LogonCommand^>
echo     ^<Command^>C:\Users\WDAGUtilityAccount\scripts\adofai.bat^</Command^>
echo   ^</LogonCommand^>
echo   ^<MemoryInMB^>%memory%^</MemoryInMB^>
echo ^</Configuration^>
) > adofai.wsb

if not exist scripts mkdir scripts

cd scripts

if not exist adofai.bat (
echo echo D ^| xcopy "C:\Users\WDAGUtilityAccount\ADOFAIOriginal" "C:\Users\WDAGUtilityAccount\ADOFAI" /e
echo start /d "C:\Users\WDAGUtilityAccount\ADOFAI" /b "" "C:\Users\WDAGUtilityAccount\ADOFAI\A Dance of Fire and Ice.exe" %1
) > adofai.bat

cd ..

start "" adofai.wsb
