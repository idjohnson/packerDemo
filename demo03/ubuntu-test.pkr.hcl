
source "azure-arm" "my-example" {
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  

  tenant_id= "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"

  # VHD style
  # resource_group_name = "${var.myrg}"
  # storage_account = "${var.mysa}"
  # capture_container_name = "images"
  # capture_name_prefix = "packer2"

  # Managed Image style
  managed_image_resource_group_name = "${var.myrg}"
  managed_image_name = "myPackerImage2"

  os_type = "Linux"

  # Market Place images
  # image_publisher = "Canonical"
  # image_offer = "UbuntuServer"
  # image_sku = "18.04-LTS"

  custom_managed_image_resource_group_name = "${var.myrg}"
  custom_managed_image_name = "myPackerImage"

  location = "East US"
  vm_size = "Standard_DS2_v2"

  azure_tags = {
    dept = "engineering"
  }
}

build {
  sources = ["sources.azure-arm.my-example"]
  
  provisioner "shell" {
    
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo {{ .Path }}"
    script          = "./setup-azcopy.sh"
  }
}

# /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync
# DEBIAN_FRONTEND=noninteractive && sudo apt-get upgrade -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef -y --allow-downgrades --allow-remove-essential --allow-change-held-packages
