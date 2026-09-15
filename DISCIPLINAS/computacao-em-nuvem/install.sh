#!/bin/bash

set -e

echo "=========================================="
echo " Ambiente de Computação em Nuvem"
echo "=========================================="

echo
echo "1. Atualizando os repositórios..."
sudo apt update

echo
echo "2. Instalando dependências..."
sudo apt install unzip gnupg software-properties-common wget -y

echo
echo "3. Verificando a AWS CLI..."

if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI já está instalada:"
    aws --version
else
    echo "AWS CLI não encontrada. Instalando..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
        -o /tmp/awscliv2.zip
    rm -rf /tmp/aws
    unzip -q /tmp/awscliv2.zip -d /tmp
    sudo /tmp/aws/install
    rm -rf /tmp/aws /tmp/awscliv2.zip
    echo
echo "AWS CLI instalada:"
    aws --version
fi

echo
echo "4. Verificando o Terraform..."

if command -v terraform >/dev/null 2>&1; then
    echo "Terraform já está instalado:"
    terraform --version
else
    echo "Terraform não encontrado. Instalando..."

    if [ ! -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]; then
        wget -O- https://apt.releases.hashicorp.com/gpg | \
            gpg --dearmor | \
            sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    else
        echo "Chave do HashiCorp já configurada."
    fi

    if [ ! -f /etc/apt/sources.list.d/hashicorp.list ]; then
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
            sudo tee /etc/apt/sources.list.d/hashicorp.list
    else
        echo "Repositório do HashiCorp já configurado."
    fi

    sudo apt update
    sudo apt install terraform -y

    echo
echo "Terraform instalado:"
    terraform --version
fi

echo
echo "=========================================="
echo " Ambiente instalado com sucesso!"
echo "=========================================="
echo
echo "AWS CLI:"
aws --version
echo
echo "Terraform:"
terraform --version
echo
echo "=========================================="
echo " Próximo passo: autenticação AWS"
echo "=========================================="
echo
echo "Obtenha as credenciais temporárias no"
echo "AWS Academy Learner Lab:"
echo
echo "AWS Details -> AWS CLI -> Show"
echo
echo "Configure com:"
echo
echo "  aws configure"
echo
echo "Depois configure o Session Token:"
echo
echo "  aws configure set aws_session_token \"SEU_SESSION_TOKEN\""
echo
echo "Teste com:"
echo
echo "  aws sts get-caller-identity"
echo
