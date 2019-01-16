## CONFIG LOCAL ENV
echo "[*] Config local environment..."
#alias vault='docker-compose exec vault vault "$@"'
vault()
{
	docker-compose exec vault vault "$@"
}
export -f vault

## UNSEAL VAULT
echo "[*] Unseal vault..."
KEY=$(grep 'Key 1:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}
KEY=$(grep 'Key 3:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}
KEY=$(grep 'Key 5:' ./dhv/keys.txt | awk '{print substr($NF,0,44)}')
vault operator unseal ${KEY}

