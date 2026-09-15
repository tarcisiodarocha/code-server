#!/bin/bash
set -e

echo "=========================================="
echo " Programação Paralela e Concorrente"
echo "=========================================="
echo
echo "1. Atualizando os repositórios..."
sudo apt update
echo
echo "2. Instalando o compilador C/C++..."
sudo apt install build-essential -y
echo
echo "3. Instalando o OpenMPI..."
sudo apt install openmpi-bin libopenmpi-dev -y
echo
echo "=========================================="
echo " Verificando instalações"
echo "=========================================="
echo
echo "GCC:"
gcc --version
echo
echo "G++:"
g++ --version
echo
echo "OpenMPI:"
mpirun --version
echo
echo "Compilador MPI para C:"
mpicc --version
echo
echo "Compilador MPI para C++:"
mpic++ --version
echo
echo "=========================================="
echo " Ambiente de Programação Paralela e"
echo " Concorrente instalado com sucesso!"
echo "=========================================="
