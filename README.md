# From AWS to Azure

This is my first foray into creating resources in Azure with terraform.

## Notes on security
This deployment experiment uses a local terraform .tfvars file that is not commmited to the repo.
The variables used are:
 
 - tenant_id
 - local_ip  #for access from my home network to the resources public IPs
 - action_group_active

## initial Observations
1. Azure clusters their services, such as storage, where AWS breaks items that use storage into separate granular services.
For example: RDS, DynamoDB, S3, EC2 Volumes, etc all have separate console and cli namespaces. Azure storage has CosmoDB, tables, blob storage, Azure SQL, etc all under 'Storage'.

2. AWS gives you much more granular control over security, and thus if you err it is due to your lack of knowledge. Azure appears to be more security first designed, so things like blob storage is treated as a firewall rule while S3 is only recently private by default.



## Useful links
 - [Device authentication link, for Azure's docker cli](https://microsoft.com/devicelogin)
 - [VM instance sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes)
 - [Azure Service Limits](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
 
 ## Gotchas
 VMs cost, even if they are not running, unlike AWS EC2 which doesn't charge for stopped instances, only their storage
 
 Some resource name tags can only be 32 characters and no special charaters. I suspect this is due to the name being used as a public & unique endpoint and conforming to a very narrow set of DNS name rules.
 
 OMS workspace names have to be unique.