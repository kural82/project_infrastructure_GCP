#!/bin/bash 
wget https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_amd64.zip
unzip -f vault_1.10.0_linux_amd64.zip 
mv vault ~/bin
PATH=$PATH:${HOME}/bin

vault version