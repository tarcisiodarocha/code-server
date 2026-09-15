# Ambiente de Computação em Nuvem

Este módulo instala as ferramentas necessárias para o desenvolvimento das atividades da disciplina de **Computação em Nuvem**.

O módulo pressupõe que o **Ambiente Base** já esteja instalado e funcionando.

Serão instalados:

- AWS CLI
- Terraform

> **Atenção:** execute todos os comandos deste documento dentro da sessão da EC2.

---

## 1. Instalar a AWS CLI

Baixe o instalador oficial da AWS CLI:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

Instale o `unzip`:

```bash
sudo apt install unzip -y
```

Extraia o instalador:

```bash
unzip awscliv2.zip
```

Execute a instalação:

```bash
sudo ./aws/install
```

Verifique:

```bash
aws --version
```

---

## 2. Obter as credenciais no AWS Academy Learner Lab

As credenciais utilizadas pela AWS CLI serão fornecidas pelo **AWS Academy Learner Lab**.

No painel do Learner Lab:

1. Acesse o **AWS Academy Learner Lab**.
2. Inicie o laboratório, caso ainda não esteja iniciado.
3. Acesse **AWS Details**.
4. Localize a seção **AWS CLI**.
5. Clique em **Show**.

O Learner Lab apresentará um bloco de configuração semelhante a:

```text
[default]
aws_access_key_id = ASIA...
aws_secret_access_key = ...
aws_session_token = ...
```

Essas credenciais são **temporárias** e devem ser utilizadas enquanto forem válidas.

> **Importante:** o `aws_session_token` é obrigatório. As credenciais do Learner Lab não funcionam corretamente usando apenas Access Key ID e Secret Access Key.

---

## 3. Configurar a AWS CLI

Na sessão da EC2, execute:

```bash
aws configure
```

Informe os valores fornecidos pelo Learner Lab para:

- `aws_access_key_id`
- `aws_secret_access_key`

Na região padrão, informe a região utilizada pelo laboratório. Por exemplo:

```text
us-east-1
```

Para o formato de saída, pode utilizar:

```text
json
```

### Configurar o Session Token

Como o AWS Academy Learner Lab utiliza credenciais temporárias, configure também o token:

```bash
aws configure set aws_session_token "SEU_SESSION_TOKEN"
```

Substitua `SEU_SESSION_TOKEN` pelo valor fornecido em `aws_session_token`.

---

## 4. Verificar a autenticação

Execute:

```bash
aws sts get-caller-identity
```

Se a configuração estiver correta, a AWS retornará informações sobre a identidade autenticada.

Isso confirma que a AWS CLI está autenticada utilizando as credenciais do **AWS Academy Learner Lab**.

---

## 5. Instalar o Terraform

Adicione o repositório oficial da HashiCorp:

```bash
sudo apt update
sudo apt install gnupg software-properties-common -y
```

Adicione a chave de assinatura:

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

Adicione o repositório:

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

Atualize os repositórios:

```bash
sudo apt update
```

Instale o Terraform:

```bash
sudo apt install terraform -y
```

---

## 6. Verificar o Terraform

Execute:

```bash
terraform --version
```

O resultado deverá apresentar a versão instalada do Terraform.

---

## 7. Verificar o ambiente

Execute:

```bash
aws --version
```

```bash
aws sts get-caller-identity
```

```bash
terraform --version
```

Se a AWS CLI estiver instalada e autenticada e o Terraform estiver instalado, o ambiente de desenvolvimento para **Computação em Nuvem** está pronto.

> **Atenção:** as credenciais fornecidas pelo AWS Academy Learner Lab são temporárias. Quando expirarem, será necessário retornar ao **AWS Details → AWS CLI → Show**, obter novas credenciais e atualizar a configuração da AWS CLI.
