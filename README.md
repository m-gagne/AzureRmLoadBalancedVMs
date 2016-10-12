# Load Balanced Virtual Machine Demo

## deploy.ps1 & template.json

Azure Resource Manager template to configure 2 or more Virtual Machines in an availability set that are load balanced.

To deploy run (in Powershell) `./deploy.ps1 -subscriptionId <id> -resourceGroupName <name> -resourceGroupLocation <location> -deploymentName <name> -skipLogin <$False|$True>`

## setupVM.ps1

> NOTE: You will need Windows Management Framework 5.0 on the target server. If running in Azure you should be fine. If you are testing on a local VM, [download it here](https://www.microsoft.com/en-us/download/details.aspx?id=50395)

Powershell script to be run on the host VM to install [Chocolatey](https://chocolatey.org/), [git](https://chocolatey.org/packages/git), and execute the DSC (Desired State Config) `webServerConfig` to install IIS, .NET 4.5 & point to this [sample web app](https://github.com/m-gagne/ServerInfoDemoApp-DotNet).
 