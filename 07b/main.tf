  module "linuxservers" {
    source              = "Azure/compute/azurerm"
    location            = "Central India"
    vm_os_simple        = "UbuntuServer"
    public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
  }

  module "windowsservers" {
    source              = "Azure/compute/azurerm"
    location            = "Central India"
    vm_hostname         = "mywinvm" // line can be removed if only one VM module per resource group
    admin_password      = "P@ssw0rd@123"
    vm_os_simple        = "WindowsServer"
    is_windows_image    = "true"
    public_ip_dns       = ["winsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
  }

  module "network" {
    source              = "Azure/network/azurerm"
    version             = "~> 1.1.1"
    location            = "Central India"
    allow_rdp_traffic   = "true"
    allow_ssh_traffic   = "true"
    resource_group_name = "terraform-compute"
  }

  output "linux_vm_public_name"{
    value = "${module.linuxservers.public_ip_dns_name}"
  }

  output "windows_vm_public_name"{
    value = "${module.windowsservers.public_ip_dns_name}"
  }
