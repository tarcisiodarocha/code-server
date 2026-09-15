# Ambientes de Desenvolvimento

Repositório com o **Ambiente Base** e módulos específicos para disciplinas de graduação em Computação.

## Estrutura

```text
.
├── BASE/
│   ├── README.md
│   └── install-base.sh
│
└── DISCIPLINAS/
    ├── computacao-em-nuvem/
    │   ├── README.md
    │   └── install.sh
    │
    ├── programacao-paralela-concorrente/
    │   ├── README.md
    │   └── install.sh
    │
    └── sistemas-distribuidos/
        ├── README.md
        └── install.sh
```

## Conceito

O repositório separa as ferramentas comuns das ferramentas específicas de cada disciplina.

### Ambiente Base

Instala:

- Ubuntu Server 24.04 LTS
- Git
- code-server
- HTTPS na porta 8080
- workspace `/home/ubuntu/workspace`

### Módulos de disciplinas

| Disciplina | Ferramentas |
|---|---|
| Sistemas Distribuídos | Java, Maven, Protobuf, Go |
| Programação Paralela e Concorrente | C/C++, OpenMPI |
| Computação em Nuvem | AWS CLI, Terraform |

## Ordem de instalação

1. Criar a instância EC2 e configurar o Security Group conforme o README do `BASE`.
2. Instalar o Ambiente Base.
3. Instalar o módulo da disciplina desejada.
4. Utilizar o code-server para desenvolvimento em `/home/ubuntu/workspace`.

## Requisitos

- Ubuntu Server 24.04 LTS
- Acesso sudo
- Instância Amazon EC2
- Para Computação em Nuvem: credenciais temporárias do AWS Academy Learner Lab

## Observação

Os módulos são independentes entre si, mas todos pressupõem que o Ambiente Base esteja instalado.
