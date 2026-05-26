variable "rgx" {}
variable "stx" {}

resource "azurerm_resource_group" "rg" {
    for_each = var.rgx

    name = each.value.name
    location = each.value.location
}

resource "azurerm_storage_account" "storage" {
    for_each = var.stx
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type

}
