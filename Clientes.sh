#!/bin/bash
#---------------------------------------------#
# Script para cadastro de contato dos clientes
#
# Autor:
#---------------------------------------------#

#### Variaveis ###
CLIENTES="/root/clientes"

#### Funcoes #####
uso () {
    echo
    echo "Parametros aceitos 1, 2, ou 3:
    1) Consultar
    2) Adicionar
    3) Remover" ; echo

    echo "Exemplo: $0 1" ; echo
    exit
}


consultar () {
    echo
    echo "### CONSULTAR CLIENTES ###"
    echo
	# Se encontrar algum cliente
    if [[ `ls $CLIENTES 2> /dev/null` ]]
    then
        
		
		
		
		
		
    else
        echo "Não existe nenhum cliente cadastrado!"
    fi
}

adicionar () {
    echo
    echo "### ADICIONAR CLIENTE ###"
    echo
    

}

remover () {
    echo
    echo "### REMOVER CLIENTE ###"
    echo
    echo "Listando os clientes cadastrados..."
    ls $CLIENTES ; echo
    
}


#### Verificacoes ####
# $# => conta a quantidade de parametros
# Quantidade de parametros diferente de 1 ?
if [ "$#" -ne 1 ]
then
    echo
    echo "*** Obrigatorio informar um parametro ***"
    uso # Chamada da funcao "uso"
fi

#### Execucao ####
# Chamada das funcoes principais
case $1 in
    1)
    consultar ;;

    2)
    adicionar ;;

    3)
    remover ;;

    *)
    uso ;;
esac