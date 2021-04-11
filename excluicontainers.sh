#!/bin/bash
clear

echo "####### Lista dos containers - Docker #########" 
docker ps -a 
echo ""

echo  "selecione o nome do container a pesquisar... " 
read name
clear

echo "========= Resultado da pesquisa:  ============" 

docker ps -a |grep -i $name 
docker ps -a |grep -i $name |awk '{print $1}' > containers.txt
file=$(cat containers.txt)
cat "" > containers.txt
echo ""

echo "----- Deseja excluir? $name <Enter>  -----"
read
docker rm -f $file
clear

###### 
if [  $? -eq  0 ]; 
  then
  echo "*****  excluidos com sucesso ******"
  else
    echo "algo deu errado"
fi

