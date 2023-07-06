#!/bin/bash

tools_path=/usr/tools
path=/usr/tools/ScareCrow
git_url="https://github.com/optiv/ScareCrow"

figlet go-lang

# Installing the Go Lang Compiler & Interpreter
#sudo apt install golang-go -y

# Clone the Repository to /usr/tools/ScareCrow
sudo mkdir $tools_path
figlet "Created Dir - tools"
cd $tools_path

figlet git-clone ScareCrow
#sudo git clone $git_url

figlet "Installing Requirement"
# Install Requrirement 
#sudo apt install openssl -y
#sudo apt install osslsigncode -y 
#sudo apt install mingw-w64 -y

cd $path

figlet "Installing Dependencies"
# Installing Dependencies
go get github.com/fatih/color
go get github.com/yeka/zip
go get github.com/josephspurrier/goversioninfo
go get github.com/Binject/debug/pe
go get github.com/awgh/rawreader

figlet "Building the ScareCrow"
# Build the ScareCrow
# Go to the Clonned Directory and type below the command below with 'sudo'
# sudo go build ScareCrow.go

