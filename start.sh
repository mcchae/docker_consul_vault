#!/bin/bash

if [ ! -e dhv ];then
	mkdir dhv
fi

docker-compose up -d

sleep 5

vault()
{
		    docker-compose exec vault vault "$@"
}
export -f vault

vault status
if [ ! -e dhv/keys.txt ];then
	./scripts/setup.sh
else
	./scripts/unseal.sh
fi
vault status
