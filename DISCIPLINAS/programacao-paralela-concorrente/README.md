# Ambiente de Programação Paralela e Concorrente

Este módulo instala as ferramentas necessárias para o desenvolvimento dos projetos da disciplina de **Programação Paralela e Concorrente**.

O módulo pressupõe que o **Ambiente Base** já esteja instalado e funcionando.

Serão instalados:

- Compilador C/C++
- OpenMPI

> **Atenção:** execute todos os comandos deste documento dentro da sessão da EC2.

---

## 1. Instalar o compilador C/C++

Instale o compilador GCC e as ferramentas de desenvolvimento:

```bash
sudo apt install build-essential -y
```

Verifique:

```bash
gcc --version
```

Verifique também o compilador C++:

```bash
g++ --version
```

---

## 2. Instalar o OpenMPI

Instale o OpenMPI e os arquivos necessários para desenvolvimento:

```bash
sudo apt install openmpi-bin libopenmpi-dev -y
```

Verifique:

```bash
mpirun --version
```

Também é possível verificar o compilador MPI para C:

```bash
mpicc --version
```

E para C++:

```bash
mpic++ --version
```

---

## 3. Verificar o ambiente

Execute:

```bash
gcc --version
```

```bash
g++ --version
```

```bash
mpirun --version
```

```bash
mpicc --version
```

```bash
mpic++ --version
```

Se todos os comandos apresentarem suas respectivas versões, o ambiente de desenvolvimento para **Programação Paralela e Concorrente** está pronto.
