# Load Balanced Virtual Machine Demo

## deploy.ps1 & template.json

Azure Resource Manager template to configure 2 or more Virtual Machines in an availability set that are load balanced.

To deploy run `deploy.ps1`

To customize see `parameters` section of `template.json`


## setupVM.ps1

Powershell script to be run on the host VM to install [Chocolatey](https://chocolatey.org/), [git](https://chocolatey.org/packages/git), and execute the DSC (Desired State Config) `webServerConfig` to install IIS, .NET 4.5 & point to this [sample web app](https://github.com/m-gagne/ServerInfoDemoApp-DotNet).
 