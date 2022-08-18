#!/bin/bash

clear
while true; do
echo "==========================================================
    Digite o número do componente a ser instalado:

1 - Docker Engine
2 - Docker compose
3 - Zerotier

A - Atualizar programas instalados

0 - Sair
==========================================================="
#Lembrar de adicionar o QGIS ao script
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in

	1)
		echo "Update"
			apt-get update
			clear

		echo "Remover Versões antigas e instalando dependencias"
      		apt-get remove docker docker-engine docker.io containerd runc
			apt-get update
			clear
			apt-get install ca-certificates curl gnupg lsb-release -y

		echo "Adicionando a chave GPG oficial do Docker"
			mkdir -p /etc/apt/keyrings
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

		echo "Configurando repositorio"
			echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
			clear

		echo "Instalando Docker Engine"
			apt-get update
			clear
 			apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
			clear

		echo "Criando vm de Hello-word"
			clear
			docker run hello-world;;

	2)
		echo "Update"
			apt-get update
			clear

		echo "Instalando pacote"
			apt-get install docker-compose-plugin -y
			clear

		echo "Listando versões do repositorio"
			apt-cache madison docker-compose-plugin

		echo "##### Versão Atual instalada #####"
			docker compose version
		echo "Caso seja necessario outra versão, utilize o comando abaixo"
		echo "apt-get install docker-compose-plugin=<VERSION_STRING>"
		echo "onde <VERSION_STRING> é, por exemplo, 2.3.3~ubuntu-focal";;

	3)
		echo "Update"
			apt-get update
			clear

		echo "Instalando pacote"
			curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
			if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi			
			clear;;

	A)
			apt update
			clear
			apt upgrade -y;;

    0)
        echo "Saindo..."
        	exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;

	esac

done
