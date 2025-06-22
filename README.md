# ansible-terraform-integration
This repo is all about how you can integrate the Terraform with Ansible using Terraform provisioners to automate most of your tasks 


## Steps

### Step 1:
```bash
git clone https://github.com/HimanshuAwasthi24/ansible-terraform-integration.git
cd ansible ansible-terraform-integration
code .
```
### Step 2:
Open terraform.tfvars and change the following values <br>
1. ami_value = "Enter your AMI ID here"
2. subnet_id_value = "Entrer your Subnet ID here"
3. instance_type_value = "t2.micro"
4. vpc_id_value = "Enter your VPC ID here"
5. key_name_value = "Enter your Key Name here"
6. private_key_path = "Enter the path to your private key file here"
<br>

## Run following commands carefully to see the changes
```bash
terraform init
terraform plan
terraform apply
```
