
#!/bin/sh
echo "============================== Installing Pre-requsites =============================="


echo "============================== Installing golang =============================="
sudo apt-get -y install golang 

echo "============================== Installing terraform =============================="

sudo apt-get -y update && sudo apt-get  -y install gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get -y update
sudo apt-get -y install terraform


terraform version

echo "Installing golang"

echo "============================== Started Running Test =============================="
go mod init test
go mod tidy
go test -v -timeout=10m

echo "============================== Completed Running Test =============================="