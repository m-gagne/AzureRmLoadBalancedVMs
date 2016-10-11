$env:chocolateyUseWindowsCompression = 'false'
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco install git -Confirm:$false
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
git clone https://github.com/m-gagne/ServerInfoDemoApp-DotNet.git c:\www