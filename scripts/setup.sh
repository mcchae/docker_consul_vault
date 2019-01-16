#!/bin/bash

## CONFIG LOCAL ENV
echo "[*] Config local environment..."
#alias vault='docker-compose exec vault vault "$@"'
vault()
{
	docker-compose exec vault vault "$@"
}
export -f vault

## INIT VAULT
echo "[*] Init vault..."
vault operator init > ./dhv/keys.txt
export VAULT_TOKEN=$(grep 'Initial Root Token: ' ./dhv/keys.txt | awk '{print substr($NF, 0, 26)}')

## UNSEAL VAULT
echo "[*] Unseal vault..."
KEY=$(grep 'Key 1:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}
KEY=$(grep 'Key 3:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}
KEY=$(grep 'Key 5:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}

## AUTH
echo "[*] Auth..."
vault login ${VAULT_TOKEN}

## CREATE USER
echo "[*] Create user... Remember to change the defaults!!"
vault auth enable  userpass
vault policy write admin ./config/admin.hcl
vault write auth/userpass/users/webui password=webui policies=admin

## CREATE BACKUP TOKEN
echo "[*] Create backup token..."
vault token create -display-name="backup_token" | awk '/token/{i++}i==2' | awk '{print "backup_token: " $2}' >> ./dhv/keys.txt

## MOUNTS
#echo "[*] Creating new mount point..."
#vault mounts -address=${VAULT_ADDR}
#vault mount  -address=${VAULT_ADDR} -path=assessment -description="Secrets used in the assessment" generic
#vault write  -address=${VAULT_ADDR} assessment/server1_ad value1=name value2=pwd

