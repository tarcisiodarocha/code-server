---

# Manual de Instalação: Ambiente de Desenvolvimento na AWS (EC2 + code-server + Java + Maven)

Este guia orienta na configuração de uma instância **EC2** na AWS rodando o **Ubuntu Server** (24.04 LTS) com o **`code-server`** (VS Code no navegador), além de **Java** e **Maven** pré-instalados e as permissões de diretório corrigidas.

---

## Passo 1: Atualizar o Sistema

Conecte-se à sua instância via SSH e atualize os pacotes do sistema:

```bash
sudo apt update && sudo apt upgrade -y

```

---

## Passo 2: Instalar o Java (JDK) e o Maven

Instale o ambiente de desenvolvimento para as aulas de sistemas distribuídos:

1. **Instalar o Java Development Kit (JDK):**
```bash
sudo apt install openjdk-17-jdk -y

```


2. **Verificar a instalação do Java:**
```bash
java -version

```


3. **Instalar o Maven:**
```bash
sudo apt install maven -y

```


4. **Verificar a instalação do Maven:**
```bash
mvn -version

```



---

## Passo 3: Criar a Pasta de Projetos e Ajustar Permissões

Para evitar erros de acesso ao abrir pastas no navegador, crie uma pasta dedicada no diretório *home* e garanta que o seu usuário seja o dono dela:

1. **Criar o diretório de projetos:**
```bash
mkdir -p /home/ubuntu/workspace

```


2. **Ajustar as permissões de propriedade do usuário:**
```bash
sudo chown -R $USER:$USER /home/ubuntu/workspace

```



---

## Passo 4: Instalar o `code-server` (VS Code no Browser)

1. **Executar o script oficial de instalação:**
```bash
curl -fsSL https://code-server.dev/install.sh | sh

```


2. **Habilitar e iniciar o serviço systemd:**
```bash
sudo systemctl enable --now code-server@$USER

```



---

## Passo 5: Configurar o Acesso Externo

1. **Editar o arquivo de configuração:**
```bash
nano ~/.config/code-server/config.yaml

```


2. **Modificar o `bind-addr`:**
Altere a linha de `127.0.0.1:8080` para **`0.0.0.0:8080`** e o conteúdo de "SUA_SENHA_AQUI" para uma senha de sua preferência. O arquivo deve ficar semelhante a isto:
```yaml
bind-addr: 0.0.0.0:8080
auth: password
password: "SUA_SENHA_AQUI"
cert: false

```


3. **Salvar e fechar:** Pressione `Ctrl + O`, `Enter` para salvar, e `Ctrl + X` para sair.

4. **Redirecionar a porta 80:**
```bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

```


5. **Reiniciar o serviço:**
```bash
sudo systemctl restart code-server@$USER

```



---

## Passo 6: Liberar a Porta na AWS (Security Group)

1. Acesse o painel da **AWS EC2** e clique na sua instância.
2. Na aba inferior, clique em **Security** e depois no **Security Group** associado.
3. Clique em **Edit inbound rules** (Editar regras de entrada).
4. Caso a regra de de liberação da porta 80 (HTTP) não esteja listada, adicione a seguinte regra:
* **Type:** HTTP
* **Port Range:** `80`
* **Source:** `Anywhere-IPv4` (`0.0.0.0/0`)


5. Clique em **Save rules**.

---

## Passo 7: Acessando a IDE e Usando o Terminal

1. No navegador, acesse:
```text
http://<IP-PUBLICO-DA-AWS>

```


2. Digite a senha configurada no `config.yaml`.
3. Vá em **File > Open Folder...** e selecione `/home/ubuntu/workspace`.
4. Para abrir o terminal integrado e rodar comandos como `mvn clean install` ou compilar seus códigos, use o atalho **`Ctrl + \`` (ou `Ctrl + Shift + ``)**.
