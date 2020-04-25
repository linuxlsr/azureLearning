# mysql

## Creates a MySQL database server and schema on Azure.

## usage
```hcl
module "mysql" {
  source = "tbd"
  db_name = "mydb"
  location = "mylocation"
  admin_username = "myadminusername"
  password = "mysuperstrongnotstoredingithubpassword"
}
```

### Note: this is a new module that uses foreverXZC/terraform-azurerm-mysql as reference to address some issues I encountered. As this is my first module, I chose not to fork and rewrite for a pull request.


