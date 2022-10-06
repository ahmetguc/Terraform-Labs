# Terraform-Labs

Terraform Notes: 

On this repo, I have use terraform on aws provider to deploy ec2 instances, dynamoDB, lambda function, load balancers, s3 bucket and vpc services. I have deployed each of the services separately with various project folder and also all together under the multiple folder. I have deployed these aws services with terraform both from my MacOs and also Ubuntu VM. 

1. Add a user with access key checked inside IAM service with AdministrativeAccess checked. Save Download.csv file which contains your access and secret key for use in AWS CLI and Terraform CLI.
2. Installing Terraform on MacOs: https://learn.hashicorp.com/tutorials/terraform/install-cli
3. Installing AWS CLI Tool: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
4. Configure AWS with "configure aws" command on terminal and enter your access, secret key, region name and output format. 
5. Create a folder and a terraform file ending with .tf extension which is your configuration file. You can use https://registry.terraform.io for editing existing modules on various providers and their services.
6. Once your terraform configuration file blocks are ready for automating the infrastructure use "terraform init" command to initialize terraform.
7. Use "terraform plan" command to see the output detailing terraform's gamelpay on how it will achieve the desired state configuration described in your .tf configuration files. 
8. Use "ls -al" command to verify the new contents in this directory. 
9. Use "terraform fmt" command to fix formatting of your .tf configuration files.
10. Use "terraform validate" command to check on potential syntax issues on your .tf configuration files.
11. Once everything looks good, you can use "terraform apply" command to deploy your desired infrastructure which triggers terraform to recrate the plan. 
12. Use "terraform output" command to extract the value of an output variable from the state file.
13. Use "terraform destroy" to shut down and delete all the services and infrasturce you have deployed.

Install and Configure Terraform with AWS Provider on Ubuntu 22.04.1 LTS VM:

1. Add a user with access key checked inside IAM service with AdministrativeAccess checked. Save Download.csv file which contains your access and secret key for use in AWS CLI and Terraform CLI (Creating  a Terraform IAM user with admin privileges)
2. sudo apt update && sudo apt upgrade -y (update and Upgrade Ubuntu packages in preparation for AWS and Terraform tools)
3. sudo apt install wget unzip curl git (install unzip, wget, curl, git and AWS CLI tools)
4. curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o “awscliv2.zip" (download AWS CLI tools)
5. unzip awscliv2.zip (unzip the zip file)
6. sudo ./aws/install (runs the installer)
7. which aws (verify that AWS CLI is installed properly, ex: /usr/local/bin/aws)
8. aws configure (paste your AWS Secret Access Key from the csv file, type us-east-2 for region name and yaml for default output format)
9. aws sts get-caller-identity (verify that your credentials work)
10. wget https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_amd64.zip (install terraform cli)
11. unzip terraform_1.2.9_linux_amd64.zip (unzip the download)
12. sudo install terraform /usr/local/bin/terraform (install terraform into ex: /usr/local/bin/
13. terraform version (verify installation)
14. sudo snap install code —classic (install visual studio code)
15. code (launch visual studio code)


![Screen Shot 2022-10-06 at 4 44 58 PM](https://user-images.githubusercontent.com/68933712/194416051-11f5d18c-5b73-4603-8f4b-3f5b95885c94.png)

