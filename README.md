# CICD Infrastructure

### Tools
- AWS Cli - v2.9.5
- Terraform - v1.3.5

### Resources that it launches
- 1 S3 bucket for the terraform state
- 1 S3 bucket to store jenkins backups
- 1 Virtual private cloud
- 1 Internet gateway
- 1 Public subnet
- 1 Security group
- 1 Key pair
- 4 EC2 Instances (for jenkins, jenkins worker, sonarqube, and grafana)

## Steps to launch the infrastructure
First of all, if you want to set up the project you must of course install the tools mentioned above.

#### 1. Review the variables
Please pay attention to the variables in case you need to change any settings.
Some cautions: `t2.micro` instances are too small to deploy **sonarqube** and may be too small for the **jenkins worker** depending on the workload you put on it.
You can overwrite the default values when you run the `terraform -var` command, but still be careful.

#### 2. Create a key pair
Create a key pair for the connection to the EC2 instances, make sure the keys are named `cicd` for the private key and `cicd.pub` for the public key. You can create them with the following command
```sh
ssh-keygen -t rsa -b 4096
```

#### 4. Prepare your AWS credentials
For example you can run this commands.
```
export AWS_ACCESS_KEY_ID=<your_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
export AWS_REGION=<your_aws_region>
```

#### 5. Check **jenkins** backup
If you don't have a **Jenkins** backup and just want to start it from scratch, simply comment out the lines in the `instances.tf` file, to skip those steps.

#### 6. Prepare s3 bucket for terraform state
First comment out the backend lines in `main.tf`, because you obviously don't have it yet.
```
terraform init
terraform apply -target module.backen
```
And now uncomment the backend statement again, remember to re-run the `terraform init` command.

#### 6. Finally run the terraform commands
```
terraform init
terraform apply \
  -var aws_access_key_id=$AWS_ACCESS_KEY_ID \
  -var aws_secret_access_key=$AWS_SECRET_ACCESS_KEY \
  -var jenkins_backup_revision=the_backup_filename.tar.gz
```