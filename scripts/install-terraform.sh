# !/bin/bash
sudo yum install -y yum-utils
sudo wget https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip
sudo unzip ./terraform_1.3.5_linux_amd64.zip -d /usr/local/bin