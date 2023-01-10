$ErrorActionPreference = "Continue"
$ProcessNames = @('authtap32.exe','authtap64.exe','changeling32.exe','changeling64.exe','cyclorama32.exe','cyclorama64.exe','groundling32.exe','groundling64.exe','inspector32.exe','inspector64.exe','lacuna32.exe','lacuna64.exe','procwall32.exe','procwall64.exe','redcloak.exe')
foreach ($process in $ProcessNames){
taskkill.exe /IM $process /F
}
Start-Process msiexec.exe -Wait -ArgumentList '/x C:\redcloak.msi /qn'
Remove-Item -Path 'c:\Program Files (x86)\Dell SecureWorks' -Recurse -Force
Remove-Item -Path HKLM:\SOFTWARE\RedCloak -Recurse -Force
Remove-Item -Path HKLM:\SYSTEM\ControlSet001\Services\redcloak -Recurse -Force
Remove-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\redcloak -Recurse -Force
