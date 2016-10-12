# Variables
$dscRootPath  = "c:\VmDsc"
$setupScript  = "https://github.com/m-gagne/AzureRmLoadBalancedVMs.git"
$demoAppRepo  = "https://github.com/m-gagne/ServerInfoDemoApp-DotNet.git"
$wwwRoot      = "c:\inetpub\wwwroot"

# Install Chocolatey (package manager for Windows) 
$env:chocolateyUseWindowsCompression = 'false'
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Install git
choco install git -Confirm:$false

# Install Chrome to test webapps easier
choco install googlechrome -Confirm:$false

# Update the Path which should now include git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# Clone the setup scripts
git clone "$setupScript" "$dscRootPath"

# Run the DSC to install IIS, .NET etc.
Start-DscConfiguration -Path "$dscRootPath\WebServerConfig" -Wait -Verbose | Out-File "$dscRootPath\WebServerConfig.log"

# Empty the default wwwroot site
Remove-Item "$wwwRoot\*" -Recurse -Force -Confirm:$false

# Clone the demo app into the
git clone "$demoAppRepo" "$wwwRoot"