Write-Host "Installing Visual Studio"
$isoPath = "C:\windows\temp\other\vs2015.com_enu.iso"
$rc = Mount-DiskImage -PassThru -ImagePath $isoPath
$driveLetter = ($rc | Get-Volume).DriveLetter
$installPath = Join-Path "${driveLetter}:" "vs_community.exe"
Start-Process -FilePath $installPath -ArgumentList "/quiet /norestart" -NoNewWindow -Wait
Dismount-DiskImage -ImagePath $isoPath
Remove-Item -Force -Path $isoPath
