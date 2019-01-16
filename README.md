# docker-compose for vault with consul

## [consul](https://www.consul.io)

consul 오픈스로의 docker conainerize 내용입니다.

consul은 아파치의 [Zookeeper](https://zookeeper.apache.org) 와 같은 분산 시스템 코디네이션 서비스 시스템으로서 [hashicorp](https://www.hashicorp.com) 라는 회사에서 만든 코디네이션 서비스 시스템입니다.

> * [분산 코디네이터 Zookeeper(주키퍼) 소개](http://bcho.tistory.com/1016) 참고
> * [Consul에 대해서](http://longbe00.blogspot.com/2017/08/consul.html) 참고
> * [여러 호스트에 Consul 설치 후 연동하기](http://teddykwon.com/2017/01/18/consul-install.html) 참고
> * [Real-time Service Configuration으로 Consul을 신주소 서비스에 적용한 사례](http://woowabros.github.io/tools/2018/10/08/location-service-with-rcs.html) 참고

## Vault

사용자가 암호 등을 안전하게 보관하기 위한 금고 (Safe 또는 Vault)를 만드는 개념은 쉬울 것 같으면 서도 쉽지 않습니다. 로컬에 어떤 식으로 저장을 하더라도 해당 소스가 공개되어 있고 저장하는 방식을 알게되면 역으로 해독이 가능하기 때문입니다.

그래서 시간을 들여 찾아 보니 원격으로 해당 기능을 제공하는 서비스가 여러 있었고 그 중에서도 가장 편하고 안전하게 저장하고  가져오는 등의 작업과 이미 dockerize 되어 있는 것을 찾았으니 바로, [HashiCorp](https://www.hashicorp.com) 사의 [Vault](https://www.vaultproject.io) 라는 것이었습니다.

[Securing secrets with python and vault](https://modularsystems.io/blog/securing-secrets-python-vault/) 블로그를 찾아서 확 인하다가 [ryanhartje/containers의 consul-vault](https://github.com/ryanhartje/containers/tree/master/consul-vault)를 찾았고 해당 vault의 docker image 를 별도로 구성해 봅니다.
결국 위의 내용도 다시 컨터에너를 내렸다 올리면 초기화 되는 문제가 있어 다음의 것으로 해결하였습니다.

[Docker + Consul + Vault: A Practical Guide](https://www.marcolancini.it/2017/blog-vault/)

### 참고
> * [Docker + Consul + Vault: A Practical Guide](https://www.marcolancini.it/2017/blog-vault/)
> * [marco-lancini/docker_vault 의 내용을 최신 버전에 맞게 수정 및 재가공](https://github.com/marco-lancini/docker_vault)
> * [tolitius/cault(실패)](https://github.com/tolitius/cault)
> * [Securing secrets with python and vault](https://modularsystems.io/blog/securing-secrets-python-vault/)
> * [What is HashiCorp Vault? How to Secure Secrets Inside Microservices](https://cloudacademy.com/blog/hashicorp-vault-how-to-secure-secrets-inside-microservices/)
> * [HashiCorp의 비밀정보 관리 도구 Vault의 구성](https://blog.outsider.ne.kr/1266)
> * [hvac python Vault module](https://hvac.readthedocs.io/en/stable/index.html)


## 사용 방법

``` sh
start.sh
```

로 시작하고,

``` sh
stop.sh
```
으로 멈춥니다.

기존에 데이터를 그대로 살려둔 상태로 다시 
``` sh
start.sh
```
시작하여 서비스를 시작할 수 있고,

또한,

``` sh
backup.sh
```
을 실행하면 `dhv/backup/backup_yyyy-mm-dd` 로 백업파일이 생성됩니다.

만약 모든 데이터를 지우고 새롭게 시작하고 싶다면,

`start.sh`로 시작한 상태에서

``` sh
stop_clean_all.sh
```
를 실행하면 됩니다.


어느 분께는 도움이 되셨기를..
