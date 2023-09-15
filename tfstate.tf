# when originally creating the tfstate resource group and resources, comment out this code. 
# after creating, re-run terraform init and terraform apply to switch the back-end
# terraform {
#   backend "azurerm" {
#     resource_group_name   = "rg-tailspin-tfstate"
#     storage_account_name  = "tailspintfstate"
#     container_name        = "tfstate"
#   }
# }