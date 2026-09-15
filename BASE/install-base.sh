#!/bin/bash

set -e

echo "=========================================="
echo " Instalação do Ambiente Base"
echo "=========================================="

echo
echo "1. Atualizando o Ubuntu..."
sudo apt update
sudo apt upgrade -y

echo
echo "2. Instalando o Git..."
sudo apt install git -y

echo
echo "Git instalado:"
git --version

echo
echo "3. Criando o workspace..."
mkdir -p /home/ubuntu/workspace

echo
echo "4. Instalando o code-server..."
curl -fsSL https://code-server.dev/install.sh | sh

echo
echo "Versão do code-server:"
code-server --version

echo
echo "5. Configurando o code-server..."
mkdir -p ~/.config/code-server
read -s -p "Digite a senha do code-server: " CODE_SERVER_PASSWORD
echo
cat > ~/.config/code-server/config.yaml <<EOF2
bind-addr: 0.0.0.0:8080
auth: password
password: $CODE_SERVER_PASSWORD
cert: true
EOF2

echo
echo "6. Iniciando o code-server..."
sudo systemctl enable --now code-server@ubuntu

echo
echo "=========================================="
echo " Ambiente Base instalado com sucesso!"
echo "=========================================="
echo
echo "Status do code-server:"
sudo systemctl is-active code-server@ubuntu
echo
echo "Workspace:"
echo "/home/ubuntu/workspace"
echo
echo "Acesse pelo navegador:"
echo "https://<IP-PUBLICO-DA-EC2>:8080"
