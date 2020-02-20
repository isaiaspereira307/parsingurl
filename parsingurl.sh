#!/bin/bash
#Criar um script para identificar possiveis hosts em um dominio
#Objetivo:
#Informar o dominio
#Se o sitetiver subdominios na pagina, ele deve retornar o ip dos subdominios encontrados
#modo de uso parsing.sh sitealvo.com.br
wget $1
grep href index.html | cut -d "/" -f3 | grep "\." | cut -d '"' -f1 | sort -u | grep '.com' | grep -v 'li' > lista
for url in $(cat lista);do host $url;done | grep "has address"
