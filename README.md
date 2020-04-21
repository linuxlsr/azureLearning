# From AWS to Azure

This is my first foray into creating resources in Azure with terraform.

Using linuxacademy to guide studies:
- Microsoft Azure Administrator - Exam AZ-103 (death by powerpoint & console demo)
- Microsoft Azure Security Essentials (better at explaining concepts)

As a concept is covered, rather than build in console I would build resources via terraform, usually from the ground up, but occasionally with modules.

## Notes on security
This deployment experiment uses a local terraform .tfvars file that is not commmited to the repo.
The variables used are:
 
 - tenant_id
 - local_ip  #for access from my home network to the resources public IPs
 - local_ipv4                          
 - repo                                
 - infra                               
 - action_group_active
 - security_center_alert_notifications 
 - security_center_alerts_to_admins
 - security_center_contact_email
 - security_center_contact_phone
 - security_center_pricing_tier
 - security_center_workspaces

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
 
 Some resource name tags can only be 32 characters and no special charaters. I suspect this is do to the name being used as a public & unique endpoint and conforming to a very narrow set of DNS name rules.
 
 OMS workspace names have to be unique.
 
 Subnet names for azure firewall resources must be exactly 'AzureFirewallSubnet'. WTF? Does this mean I declare subnets twice?
 
 azure firewall rules can not be updated, only destroyed and recreated
 
 Interpolating variables in heredoc json not working for me, yet.

 Azure Firewall is not cheap. One rule for day cost nearly $20 without traffic.
 
 Security Center is like Trusted Advisor, with 30 days free and cost per asset. Nice dashboard.
 
 MFA is not available for free, but tied to additional service plans and Office 365 integration, unlike AWS which does it for free. Sigh. Make sure your Microsoft account that owns your subscription is a secure as possible.
 