# Ambiente Base de Desenvolvimento

Ambiente baseado em:

- Ubuntu Server 24.04 LTS
- Amazon EC2
- Git
- code-server
- HTTPS na porta 8080
- `/home/ubuntu/workspace`

O Ambiente Base fornece as ferramentas comuns às disciplinas. As ferramentas específicas de cada disciplina são instaladas pelos módulos em `DISCIPLINAS/`.

---

## 1. Preparação do ambiente AWS

### 1.1 Criar a instância EC2

No painel da AWS, crie uma instância com:

- **Name:** `code-server`
- **AMI:** Ubuntu Server 24.04 LTS
- **Instance type:** `t3.small`
- **Key pair name:** `code-server`
- **Key pair type:** RSA
- **Private key format:** `.pem`

A AWS fará o download do arquivo:

```text
code-server.pem
```

> **Importante:** faça uma cópia de segurança do arquivo `code-server.pem`, por exemplo, no Google Drive. A AWS não permite baixar novamente a chave privada depois de sua criação.

Mantenha as demais opções com os valores padrão e lance a instância.

Aguarde até que ela esteja no estado **Running**.

### 1.2 Configurar o Security Group

Configure as regras de entrada:

| Tipo | Porta | Origem |
|---|---:|---|
| SSH | 22 | `0.0.0.0/0` |
| Custom TCP | 8080 | `0.0.0.0/0` |

> `0.0.0.0/0` permite acesso a partir de qualquer endereço IPv4. Essa configuração é adequada para o laboratório, mas não é recomendada para ambientes de produção.

### 1.3 Conectar à EC2

No painel da AWS:

1. EC2 → **Instances**
2. Selecione `code-server`
3. Clique em **Connect**
4. Selecione **EC2 Instance Connect**
5. Usuário: `ubuntu`
6. Clique em **Connect**

Uma sessão de terminal será aberta no navegador.

> Todos os comandos da próxima seção devem ser executados nessa sessão.

---

## 2. Instalação do ambiente de desenvolvimento

### 2.1 Atualizar o Ubuntu

```bash
sudo apt update
sudo apt upgrade -y
```

### 2.2 Instalar Git

```bash
sudo apt install git -y
git --version
```

### 2.3 Criar o workspace

```bash
mkdir -p /home/ubuntu/workspace
```

### 2.4 Instalar o code-server

```bash
curl -fsSL https://code-server.dev/install.sh | sh
code-server --version
```

### 2.5 Configurar o code-server

```bash
mkdir -p ~/.config/code-server
nano ~/.config/code-server/config.yaml
```

Utilize:

```yaml
bind-addr: 0.0.0.0:8080
auth: password
password: SUA_SENHA
cert: true
```

### 2.6 Iniciar o code-server

```bash
sudo systemctl enable --now code-server@ubuntu
sudo systemctl status code-server@ubuntu --no-pager
```

O serviço deverá apresentar:

```text
Active: active (running)
```

### 2.7 Acessar o code-server

No navegador:

```text
https://<IP-PÚBLICO-DA-EC2>:8080
```

O navegador poderá apresentar um aviso relacionado ao certificado HTTPS. Isso é esperado no laboratório, pois o code-server utiliza um certificado próprio.

### 2.8 Workspace

Os projetos devem ser armazenados em:

```text
/home/ubuntu/workspace
```

Esse diretório será acessível pelo code-server.

---

## 3. Estrutura do ambiente

```text
EC2
└── Ubuntu 24.04
    ├── Git
    ├── /home/ubuntu/workspace
    └── code-server
        └── HTTPS :8080
```

> **Importante:** não instale ferramentas específicas de disciplinas no Ambiente Base. Utilize os módulos existentes em `DISCIPLINAS/`.
