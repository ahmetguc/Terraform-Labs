# Terraform-Labs

GitHub Terraform Notes

Installing Terraform on MacOs: https://learn.hashicorp.com/tutorials/terraform/install-cli
Installing AWS CLI Tool: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
Configure AWS:

Lab 1 – Install and Configure Terraform with AWS Provider:

- Add a user with access key checked inside IAM service with AdministrativeAccess checked. Save Download.csv file which contains your access and secret key for use in AWS CLI and Terraform CLI (Creating  a Terraform IAM user with admin privileges)
- sudo apt update && sudo apt upgrade -y (update and Upgrade Ubuntu packages in preparation for AWS and Terraform tools)
- sudo apt install wget unzip curl git (install unzip, wget, curl, git and AWS CLI tools)
- curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o “awscliv2.zip" (download AWS CLI tools)
- unzip awscliv2.zip (unzip the zip file)
- sudo ./aws/install (runs the installer)
- which aws (verify that AWS CLI is installed properly, ex: /usr/local/bin/aws)
- aws configure (paste your AWS Secret Access Key from the csv file, type us-east-2 for region name and yaml for default output format)
- aws sts get-caller-identity (verify that your credentials work)
- wget https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_amd64.zip (install terraform cli)
- unzip terraform_1.2.9_linux_amd64.zip (unzip the download)
- sudo install terraform /usr/local/bin/terraform (install terraform into ex: /usr/local/bin/
- terraform version (verify installation)
- sudo snap install code —classic (install visual studio code)
- code (launch visual studio code)

Lab 2 – AWS VPC using Terraform:

- mkdir ~/labs
- mkdir ~/labs/Terraform-Labs/terraform-vpc-demo
- code ~/labs
- Create a file “vpc.tf” under the folder and save the following:
	resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	tags = {
	Name = "main"
	}
	}
- cd ~/labs/Terraform-Labs/terraform-vpc-demo
- terraform init (initializes and runs terraform)
- ls -al (verify the new contents in this directory) 
terraform plan (you will see an output detailing Terraform’s gameplay on how it will achieve the desired state configuration described in your config file: 
- terraform apply (triggers Terraform to recreate the plan
