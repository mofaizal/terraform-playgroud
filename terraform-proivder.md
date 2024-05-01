
# Provider

In Terraform, a provider is responsible for understanding and interacting with a specific infrastructure platform, such as cloud providers (AWS, Azure, GCP), SaaS providers (GitHub, Datadog), or on-premises solutions (VMware, OpenStack). Providers serve as the bridge between Terraform and the APIs of these platforms, enabling Terraform to manage resources within them.

Here are examples of Terraform providers for AWS, Azure, and GCP:

**Azure Provider**
The Azure provider enables Terraform to manage resources in Microsoft Azure. It supports various Azure services, including virtual machines, storage accounts, databases, and networking components.

**Terraform Block**

The terraform {} block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. For each provider, the source attribute defines an optional hostname, a namespace, and the provider type. Terraform installs providers from the Terraform Registry by default. In this example configuration, the azurerm provider's source is defined as hashicorp/azurerm, which is shorthand for registry.terraform.io/hashicorp/azurerm.

You can also define a version constraint for each provider in the required_providers block. The version attribute is optional, but we recommend using it to enforce the provider version. Without it, Terraform will always use the latest version of the provider, which may introduce breaking changes.

**Resource**

Use resource blocks to define components of your infrastructure. A resource might be a physical component such as a server, or it can be a logical resource such as a Heroku application.

Resource blocks have two strings before the block: the resource type and the resource name. In this example, the resource type is azurerm_resource_group and the name is rg. The prefix of the type maps to the name of the provider. In the example configuration, Terraform manages the azurerm_resource_group resource with the azurerm provider. Together, the resource type and resource name form a unique ID for the resource. For example, the ID for your network is azurerm_resource_group.rg.

```
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

```

**AWS Provider**
The AWS provider allows Terraform to interact with Amazon Web Services (AWS) resources. It supports a wide range of AWS services, such as EC2 instances, S3 buckets, RDS databases, and more.

```terraform 
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

```

**Google Cloud Platform (GCP) Provider**
The GCP provider allows Terraform to interact with resources in Google Cloud Platform. It supports GCP services like Compute Engine, Cloud Storage, Cloud SQL, and Kubernetes Engine.

```
provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}

```
