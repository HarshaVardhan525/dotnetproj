variable "resource_group_name" {
    description = "The name of the resource"
    type = string
    default = "rg-quickcart"
}

variable "location" {
    description = "The location of the resource"
    type = string
    default = "centralindia"
}

variable "asp_name" {
    description = "The name of the App service"
    type = string
    default = "asp-netflix"
}

variable "app_name" {
    description = "The name of the App"
    type = string
    default = "webapp-quickcart"
}