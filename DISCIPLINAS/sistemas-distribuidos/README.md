# Ambiente de Sistemas Distribuídos

Este módulo instala as ferramentas necessárias para o desenvolvimento dos projetos da disciplina de **Sistemas Distribuídos**.

O módulo pressupõe que o **Ambiente Base** já esteja instalado e funcionando.

Serão instalados:

- Java
- Maven
- Compilador Protobuf (`protoc`)
- Go (Golang)

> **Atenção:** execute todos os comandos deste documento dentro da sessão da EC2.

---

## 1. Instalar o Java

Instale o OpenJDK 17:

```bash
sudo apt install openjdk-17-jdk -y
```

Verifique:

```bash
java --version
```

O resultado deverá indicar uma versão do Java 17.

---

## 2. Instalar o Maven

```bash
sudo apt install maven -y
```

Verifique:

```bash
mvn --version
```

O Maven deverá identificar o Java instalado anteriormente.

---

## 3. Instalar o compilador Protobuf

Instale o compilador Protocol Buffers:

```bash
sudo apt install protobuf-compiler -y
```

Verifique:

```bash
protoc --version
```

O resultado deverá apresentar a versão instalada do `protoc`.

---

## 4. Instalar o Go

Instale o Golang:

```bash
sudo apt install golang-go -y
```

Verifique:

```bash
go version
```

---

## 5. Verificar o ambiente

Execute:

```bash
java --version
```

```bash
mvn --version
```

```bash
protoc --version
```

```bash
go version
```

Se todos os comandos apresentarem suas respectivas versões, o ambiente de desenvolvimento para a disciplina está pronto.
