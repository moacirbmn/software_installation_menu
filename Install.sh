#!/bin/bash

clear
while true; do
echo "==========================================================
    Digite o número do componente a ser instalado:

1 - IDE Arduino 1.8.4 - 64bits
2 - Kicad
3 - Sublime Text
4 - Inkscape
5 - LibreOffice
6 - Shutter
7 - Skype
8 - Octave
9 - Slack- 64 Bits
10- Atom Edit Text
11- JOSM

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
			sudo apt-get update
			clear

		echo "Instalando IDE Arduino"
      sudo apt-get install wget
      cd /home/
      sudo wget https://downloads.arduino.cc/arduino-1.8.4-linux64.tar.xz
      tar -xvf arduino-1.8.4-linux64.tar.xz;;
	2)
		echo "ADICIONANDO REPOSITORIO AO LINUX"
			sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
			sudo apt-get update
			clear

		echo "INSTALANDO KICAD"
			sudo apt-get install kicad -y;;
	3)
		echo "ADICIONANDO REPOSITORIO AO LINUX"
			sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
		echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
			sudo apt-get update
			clear
		echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
			sudo apt-get upgrade -y
			clear
		echo "INSTALANDO SUBLIME TEXT"
			sudo apt-get install sublime-text-installer;;
  4)
		echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
			sudo apt-get update
			clear
		echo "INSTALANDO POSSIVEIS ATUALIZAÇÕES"
			sudo apt-get upgrade -y
			clear
		echo "INSTALANDO Inkscape"
			sudo apt-get install inkscape -y;;
  5)
		echo "ADICIONANDO REPOSITORIO AO LINUX"
			sudo add-apt-repository -y ppa:libreoffice/ppa
		echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
    		sudo apt-get update
			clear
		echo "INSTALANDO LibreOffice"
			sudo apt-get install libreoffice libreoffice-style-breeze;;
	6)
		echo "ADICIONANDO REPOSITORIO AO LINUX"
			sudo apt-add-repository ppa:shutter/ppa
		echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
			sudo apt-get update
			clear
		echo "INSTALANDO Shutter"
			sudo apt-get install shutter;;
	7)
		echo "INSTALANDO DEPENDENCIAS"
			sudo apt-get install wget -y
			clear
		echo "BAIXANDO SKYPE"
			wget https://go.skype.com/linux.deb
			clear
		echo "INSTALANDO SKYPE"
			sudo dpkg -i linux.deb
			sudo apt-get install -f -y;;
	8)
		echo "ADICIONANDO REPOSITORIO AO LINUX"
			sudo apt-add-repository ppa:octave/stable
		echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
			sudo apt-get update
			clear
		echo "INSTALANDO Octave"
			sudo apt-get install octave;;
	9)
		echo "INSTALANDO DEPENDENCIAS"
			sudo apt-get install wget -y
			clear
		echo "BAIXANDO Slack"
			wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.5.2-amd64.deb
			clear
		echo "INSTALANDO Slack"
			sudo dpkg -i slack-desktop-2.5.2-amd64.deb
			sudo apt-get install -f -y;;
	10)
    echo "ADICIONANDO REPOSITORIO AO LINUX"
      sudo add-apt-repository ppa:webupd8team/atom -y
    echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
      sudo apt-get update
    echo "INSTALANDO Atom"
      sudo apt-get install atom -y;;
  11)
    echo "ADICIONANDO REPOSITORIO AO LINUX"
      echo deb https://josm.openstreetmap.de/apt alldist universe | sudo tee /etc/apt/sources.list.d/josm.list > /dev/null
      wget -q https://josm.openstreetmap.de/josm-apt.key -O- | sudo apt-key add -
    echo "VERIFICANDO SE HÁ ATUALIZAÇÕES"
        sudo apt-get update
    echo "INSTALANDO JOSM"
        sudo apt-get install josm -y;;
	A)
			sudo apt-get update
			clear
			sudo apt-get upgrade -y;;

    0)
        echo "Saindo..."
        	exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;

	esac

done
