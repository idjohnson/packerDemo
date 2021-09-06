
source "azure-arm" "my-example" {
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  

  tenant_id= "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"

  # VHD style
  # resource_group_name = "packerdemo"
  # storage_account = "idjvirtualmachines"
  # capture_container_name = "images"
  # capture_name_prefix = "packer"

  # Managed Image style
  managed_image_resource_group_name = "packerdemo"
  managed_image_name = "myPackerImage"

  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "18.04-LTS"

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
    script          = "./setup-azcli.sh"
  }
}

# /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync
# DEBIAN_FRONTEND=noninteractive && sudo apt-get upgrade -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef -y --allow-downgrades --allow-remove-essential --allow-change-held-packages