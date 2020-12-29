#!/bin/bash
#---------------------------------------------#
# Script para cadastro de contato dos clientes
#
# Autor: ALEXANDRE CABRAL
#---------------------------------------------#

#### Variaveis ###
CLIENTES="/root/clientes"

#### Funcoes #####
adicionar () {
  echo "#####ADICIONAR CLIENTE#####"
  read -p "INFORME O NOME DO CLIENTE: " cliente1 
  read -p "INFORME O NOME DA EMPRESA: " empresa1
  read -p "INFORME O TELEFONE: " telefone
  echo "### CRIANDO O DIRETORIO /ROOT/CLIENTES/$empresa1 ###" ; sleep 2
  mkdir -p /root/clientes/$empresa1
  echo "================================" >> cliente.txt #ou $CLIENTES/$empresa1/cliente.txt
  echo "EMPRESA: $empresa1" >> cliente.txt #ou $CLIENTES/$empresa1/cliente.txt
  echo "CLIENTE: $cliente1" >> cliente.txt #ou $CLIENTES/$empresa1/cliente.txt
  echo "TELEFONE: $telefone " >> cliente.txt #ou $CLIENTES/$empresa1/cliente.txt
  echo "================================" >> cliente.txt #ou $CLIENTES/$empresa1/cliente.txt
   `mv cliente.txt $CLIENTES/$empresa1`
  echo "## SALVANDO CONTATO DO CLIENTE EM /root/clientes/$empresa1/cliente.txt ##"
}

remover () {
echo "REMOVER"
echo "LISTANDO OS CLIENTES CADASTRADOS..." ; sleep 2
echo " `ls $CLIENTES`"
read -p "INFORME O NOME DA EMPRESA QUE DESEJA REMOVER: " empresa1
echo "REMOVENDO O CLIENTE DA $empresa1 !"
echo "O DIRETORIO /root/clientes/$empresa1 sera REMOVIDO....." ; sleep 3
`rm -rf $CLIENTES/$empresa1`
echo "DIRETORIO $empresa1 REMOVIDO COM SUCESSO! "

}

uso () {
    echo
    echo "Parametros aceitos 1, 2, ou 3:
    1) Consultar
    2) Adicionar
    3) Remover" ; echo

    read -p "DIGITE A OPCAO DESEJADA: " opcao
     case $opcao in
      1) consultar ;;
      2) adicionar ;;
      3) remover ;;
      *) echo "invalido!" ;;
     esac
 echo "Exemplo: $0 1" ; echo
    exit
}


consultar () {
    echo
    echo "### CONSULTAR CLIENTES ###"
    echo                          
    read -p "INFORME O NOME DA EMPRESA QUE DESEJA CONSULTAR: " empresa1
        # Se encontrar algum cliente
    echo "CONSULTANDO BASE DE CLIENTES..." ; sleep 2

##if [[ `ls $CLIENTES 2> /dev/null` ]]

if [[ -e $CLIENTES/$empresa1/cliente.txt ]]
then
 echo "============================================="
  echo " `sed -n 3,5p $CLIENTES/$empresa1/cliente.txt`"
else
 echo "CLIENTE NÃO EXISTE"
fi
read -p "DESEJA FAZER UMA NOVA CONSULTA?[s/n]: " opcao
case $opcao in
   s) consultar ;;
   n) echo "Saindo..." ; exit ;;
   *) echo "Opcao Invalida" ;;
   esac
}
echo "========================================================="
echo "TRABALHO PRATICO MODULO 1  - `date +%c`"
echo "========================================================="
uso

                          