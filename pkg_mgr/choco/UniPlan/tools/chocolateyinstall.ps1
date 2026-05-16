$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$os = Get-CimInstance -ClassName Win32_OperatingSystem
$architecture = $os.OSArchitecture

if ($architecture -match 'ARM') {
    $url = 'https://github.com/dStudios-735453/UniPlan_releases/releases/download/v01.05.2026-0806/UniPlan_0.0.1_arm64-setup.exe'
    $checksum = '1ABBA177BD7988277662E4EC532F1DBE583124EA472E34E1397EBBC7239C2284'
} else {
    $url = 'https://github.com/dStudios-735453/UniPlan_releases/releases/download/v01.05.2026-0806/UniPlan_0.0.1_x64-setup.exe'
    $checksum = '4BE92F168060C5BEC8A0835F1BADBB0B026F76087C8DE2AAA0FE0B3BE6C1529C'
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  installerType = 'exe'
  url           = $url
  softwareName  = 'UniPlan*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
