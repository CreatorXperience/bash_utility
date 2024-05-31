#!/bin/bash

ca_key="$(openssl genrsa -aes256 -out ca-key.pem 4096)"

if [[ $? -eq 0 ]];then echo "creating private key for certificate authority" ;fi

ca="$(openssl req -new  -x509 -days 365 -key ca-key.pem -out ca.pem -sha256)"

if [[ $? -eq 0 ]];then echo "creating public key self signedcertificate" ;fi

sleep 1


function create_cert(){
if [[ $1 = "server" ]];then
key="$(openssl genrsa -out $4.pem 4096)"
else 
key="$(openssl genrsa -out $3.pem 4096)"
fi

sleep 1

if [[ $? -eq 0 ]];then echo "generating server's private key" ;fi

if [[ $1 = "server" ]];then

csr="$(openssl req -new -subj "/CN=$2" -out server.csr -key $4.pem -sha256)"
if [[ $? -ne 0 ]];then kill -SIGKILL $(pgrep secure.docker.s);fi
else

csr="$(openssl req -new -subj "/CN=$2" -out client.csr -key $3.pem -sha256)"

if [[ $? -ne 0 ]];then kill -SIGKILL $(pgrep secure.docker.s);fi
fi

if [[ $? -eq 0 ]];then echo "generating server certificate signing request" ;fi

if [[ "$1" = "server" ]];then

echo subjectAltName = DNS:$2,IP:$3 > extfile.cnf

echo extendedKeyUsage = serverAuth >> extfile.cnf

elif [[ $1 = "client" ]];then

  echo extendedKeyUsage = clientAuth > extfile.cnf

else
  
  echo "first argument must be either client or server"

fi

echo "creating attribute configuration file for server"

sleep 1

if [[ "$1" = "server" ]];then
cert=$(openssl x509 -req -days 365 -sha256  -in server.csr -out server-cert.pem -CA ca.pem -CAkey ca-key.pem -CAcreateserial -extfile extfile.cnf)
if [[ $? -ne 0 ]];then kill -SIGKILL $(pgrep secure.docker.s);fi
else
cert=$(openssl x509 -req -days 365 -sha256  -in client.csr -out client-cert.pem -CA ca.pem -CAkey ca-key.pem -CAcreateserial -extfile extfile.cnf)
if [[ $? -ne 0 ]];then kill -SIGKILL $(pgrep secure.docker.s);fi
fi

if [[ $? -eq 0 ]];then echo "signing server certificate signing request" ;fi

rm extfile.cnf *.csr  
}

read -p "Server's Ip: " serverip
sleep 1 
read -p "Server's hostname: " serverhostname
sleep 1
create_cert server  $serverhostname $serverip  server-key
echo "successfully created server key"
sleep 2
read -p "Client hostname" clienthostname
read -p "Client Ip" clientip
sleep 1
create_cert client $clienthostname client-key

scp -P 22 {ca,client-key,client-cert}.pem $clienthostname@$clientip:~/.docker/

scp -P 22 {ca,server-key,server-cert}.pem $serverhostname@$serverip:~/
