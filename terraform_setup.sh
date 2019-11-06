#!/usr/bin/env bash

echo "################################################"
echo "Setup terraform"
echo "################################################"
wget https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_linux_amd64.zip --quiet
unzip terraform_0.9.11_linux_amd64.zip
chmod 0775 terraform
sudo mv terraform /usr/bin/terraform
echo "################################################"
echo "Done"
echo "################################################"
