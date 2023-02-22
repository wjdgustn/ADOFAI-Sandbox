set memory=8192
set ADOFAIDir=D:\SteamLibrary\steamapps\common\A Dance of Fire and Ice

@echo off
title ADOFAIVM

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

if not exist ADOFAIVM mkdir ADOFAIVM

cd ADOFAIVM

if not exist adofai.wsb (
echo ^<Configuration^>
echo   ^<VGpu^>Enable^</VGpu^>
echo   ^<Networking^>Disable^</Networking^>
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