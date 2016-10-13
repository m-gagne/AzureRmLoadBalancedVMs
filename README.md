# Load Balanced Virtual Machine Demo

This project includes an [Azure Resource Manager](https://azure.microsoft.com/en-us/documentation/articles/resource-group-overview/) (ARM) template for deploying Virtual Machines which are load balanced and configured using the best practices (Vnet, Subnet, Security Groups etc.) outlined in this [blog post](http://gotsomething.com/2016/05/30/how-to-load-balance-virtual-machines-in-azure/). Also included is a [custom script extension](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-extensions-customscript/) that is executed on the host Windows Server VM that installs IIS & a demo website.

## Key files

### template.json

This is the Azure Resource Manager template to configure 2 or more Virtual Machines in an availability set that are load balanced.

### deploy.ps1

You can deploy this template by running (in Powershell) `./deploy.ps1 -subscriptionId <id> -resourceGroupName <name> -resourceGroupLocation <location> -deploymentName <name>`

### setupVM.ps1

This is the powershell script which is executed on the host VM after it is created. 

> NOTE: You will need Windows Management Framework 5.0 on the target server. If running in Azure you should be fine. If you are testing on a local VM you can [download it here](https://www.microsoft.com/en-us/download/details.aspx?id=50395).

This Powershell script will install [Chocolatey](https://chocolatey.org/), [git](https://chocolatey.org/packages/git), and execute the DSC (Desired State Config) `webServerConfig` to install IIS, .NET 4.5 & point to this [sample web app](https://github.com/m-gagne/ServerInfoDemoApp-DotNet).


## Getting started

Simply clone this repo and run in Powershell (in Powershell) 

    ./deploy.ps1 -subscriptionId <id> -resourceGroupName <name> -resourceGroupLocation <location> -deploymentName <name>
