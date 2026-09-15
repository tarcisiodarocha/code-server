#!/bin/bash
set -e

echo "=========================================="
echo " Ambiente de Sistemas Distribuídos"
echo "=========================================="
echo
echo "1. Atualizando os repositórios..."
sudo apt update
echo
echo "2. Instalando Java 17, Maven, Protobuf e Go..."
sudo apt install openjdk-17-jdk maven protobuf-compiler golang-go -y
echo
echo "=========================================="
echo " Verificando instalações"
echo "=========================================="
echo
echo "Java:"
java --version
echo
echo "Maven:"
mvn --version
echo
echo "Compilador Protobuf:"
protoc --version
echo
echo "Go:"
go version
echo
echo "=========================================="
echo " Ambiente de Sistemas Distribuídos"
echo " instalado com sucesso!"
echo "=========================================="
