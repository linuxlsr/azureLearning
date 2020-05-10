# From AWS to Azure

This is my first foray into creating resources in Azure with terraform.

Using linuxacademy.com to guide studies:
- Managing Microsoft Azure Applications and Infrastructure with Terraform (very useful for practical application)
- Microsoft Azure Administrator - Exam AZ-103 (death by powerpoint & console demo)
- Microsoft Azure Security Essentials (better at explaining concepts)

As a concept is covered, rather than build in console I would build resources via terraform, usually from the ground up, but occasionally with modules.

## Notes on security
First, declare your .gitignore file first with the files you want to ignore before you create them. Here are mine:
```
.terraform
*.plan
*.state
*.backup
id_rsa.pub          # for vm access
*.tfstate
*.tfvars            # for your secret values
_config.yml         # for when you want to use a theme in your github pages, but irrelevant to your project
```
This deployment experiment uses a local terraform .tfvars file that is not committed to the repo.
The variables used are:
 ```
tenant_id
local_ip  #for access from my home network to the resources public IPs
local_ipv4                          
repo                                
infra                               
action_group_active
security_center_alert_notifications 
security_center_alerts_to_admins
security_center_contact_email
security_center_contact_phone
security_center_pricing_tier
security_center_workspaces
admin_username 
```
## Remote State
In order to not store credentials in github, I cobbled together a tf-init.sh script stored one level up out of the local repo, which initializes the remote backend, using[Backend / Partial Configuration] (https://www.terraform.io/docs/backends/config.html#partial-configuration) as a guide.
```
#!/bin/bash

# test if .terraform exists, and if so, delete it
if [ -a ".terraform" ]
 then
        echo "attempting delete";
        rm -rfv ./.terraform;
 else
        echo "no .terraform to delete"
fi

# test if plan exists, and if so, delete it
if [ -a *.plan ]
 then
        echo "deleting plan"
        rm -f *.plan;
 else
        echo "no .plan to delete";
fi

# replace these with your values from your initial local state deployment
RESOURCE_GROUP_NAME='myResourceGroup' 
STORAGE_ACCOUNT_NAME='myStorageAccountName'
CONTAINER_NAME='myContainerName'

# generates the key and stores it
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# initializes backend with these config values injected into the blank backend block
terraform init \
-backend-config="resource_group_name=$RESOURCE_GROUP_NAME" \
-backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" \
-backend-config="key=$KEY" \
-backend-config="container_name=$CONTAINER_NAME" \
-backend-config="access_key=$ACCESS_KEY"
```

Remember to back up your current state files, just in case.

## Initial Observations
1. Azure clusters their related services, such as storage, where AWS breaks items that use storage into separate granular services.
For example: RDS, DynamoDB, S3, EC2 Volumes, etc all have separate console and cli namespaces. Azure storage has CosmoDB, tables, blob storage, Azure SQL, etc all under 'Storage'.

2. AWS gives you much more granular control over security, and thus if you err it is due to your lack of knowledge. Azure appears to be more security first designed, so things like blob storage is treated as a firewall rule while S3 is only recently private by default.

3. Resource groups are not optional nor tag based like AWS. RGs are a type of super container into which all subordinate resources are placed.

4. Remote state mgt seems a bit easier, as you don't have to worry as much about the state file path, but can create separate storage containers for separate apps, environments, etc.

5. You can use custom policies to auto tag resources that will be deployed, instead of manually applying a map of tags at each resource. You can also use compliance rules to identify if resources have the correct tags or not. Approaching tagging from an architectural level rather than resource level.

6. Resource group locks are cool, similar to lifecycle policies and rds but at the resource group level, keep someone from blowing all your stuff away with one click.

7. Azure vm backups are significantly easier to implement than AWS Backup Plan.

8. I do appreciate the email warning I get when a backup policy protected vm's backup is marked for delete with the rsv set to soft delete.

## Useful Links
 - [Device authentication link, for Azure's docker cli](https://microsoft.com/devicelogin)
 - [VM instance sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes)
 - [Azure Service Limits](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
 - [Managed DB Pricing](https://azure.microsoft.com/en-us/pricing/details/sql-database/managed/) 
 - [Cost Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)
 - [SQL Server Version List](https://en.wikipedia.org/wiki/History_of_Microsoft_SQL_Server)

 
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
 
 Recovery Service Vault Names can't have underscores, only letters, numbers and hyphens. 
 
 storage shares have quota limits, unlike s3 which is unlimited.
 
 Potential gotcha with security group rule priority order. Can get lengthy, may have to break up rule sets by resource types.

 Databases have two pieces, the database and the instance specs, rather than being treated as a consolidated service type.
 
 If you set a password as a value, make sure it is complex or you'll trip the default password policy.
 
 mysql_server name is part of endpoint dns, so it has to be unique. Good luck guessing. 
 
 you can't apply tags to a mysql_database resource, for some rando reason. 
 
 The azure vm module creates a default open ssh sg and applies it to the network interface. Doesn't allow attaching of custom sg rule or modification of defaults by input. Better to build your own custom module, for vm as well and network, which doesn't provide the necessary subnet ids. Sigh. It appears to get overridden by the sg that is applied to the subnet, but don't like having two conflicting SGs.
 
 can't add variables in the variables.tf or test.tfvars, but did successfully use external data provider to get my vpn ip and apply it to the sg source_address_prefix, so that deprecates the need for a manual local_ip var. 
 
 Deleting a resource protected by a backup policy is like trying to delete an rds instance with snapshots, you can't kill it till all the backups are gone. Got stuck with a VM that won't go away because a backup remains in the vault.
[unable to destroy VM protected items #4276](https://github.com/terraform-providers/terraform-provider-azurerm/issues/4276) 
 workaround: ```terraform state rm  azurerm_backup_protected_vm.first-vm-backup-protect```
