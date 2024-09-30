
# Foodtech Infra Cognito

Este repositório contém a configuração do **Terraform** para gerenciar os recursos do **AWS Cognito** usados pelo sistema **Foodtech**. Além disso, um workflow do **GitHub Actions** automatiza o provisionamento da infraestrutura.

## Visão Geral do Projeto
 
Este projeto utiliza **infraestrutura como código** (IaC) para criar e gerenciar os recursos do **AWS Cognito**, que serão usados para autenticação de usuários no sistema **Foodtech**.

## Recursos Criados

### AWS Cognito

- **User Pool**: Um **User Pool** é um diretório de usuários que permite aos usuários se inscreverem e se conectarem ao aplicativo. As configurações definem:
  - Política de senha: **mínimo de 8 caracteres**, pelo menos uma letra **maiúscula** e um **número**.
  - O atributo de **email** é automaticamente verificado.

- **User Pool Client**: Um **User Pool Client** permite que um aplicativo interaja com o **User Pool**. As permissões incluem:
  - Autenticação **SRP do usuário**.
  - Autenticação via **token de atualização**.
  - Um **segredo do cliente** é gerado automaticamente.

> **Nota**: A região padrão utilizada é `"us-east-1"`. Substitua pela sua região, se necessário.

## Estrutura do Repositório

- **terraform/main.tf**: Contém as definições da infraestrutura para criar os recursos do AWS Cognito.
- **.github/workflows/terraform.yml**: Contém a definição do workflow do GitHub Actions para automação do deploy.

## Fluxo de CI/CD

Este projeto utiliza **GitHub Actions** para automatizar o provisionamento da infraestrutura. O workflow define um pipeline que é executado sempre que há um push na branch `main`.

### Detalhes do Workflow

- **Checkout**: Faz o checkout do código do repositório.
- **Setup Terraform**: Configura o **Terraform** na versão `1.0.0` (ou outra versão que desejar).
- **Configurar Credenciais AWS**: Utiliza as **secrets do GitHub** para configurar as credenciais da AWS. Você precisa definir as secrets `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY` no seu repositório do GitHub.
- **Terraform Init**: Inicializa o Terraform no diretório de trabalho.
- **Terraform Validate**: Valida a sintaxe dos arquivos do Terraform.

Este workflow é executado em um runner do tipo `ubuntu-latest`.

## Como Configurar

### 1. Clonar o Repositório

```sh
git clone https://github.com/grupo27/foodtech-infra-cognito.git
cd foodtech-infra-cognito
```

### 2. Inicializar o Terraform

Inicialize o Terraform para configurar os módulos e o backend:

```sh
terraform init
```

### 3. Aplicar as Configurações

Aplique as configurações para criar os recursos do Cognito:

```sh
terraform apply
```

Isso criará o **User Pool** e o **User Pool Client** no **AWS Cognito** com as configurações definidas.

## Tecnologias Utilizadas

- **Terraform**: Gerenciamento de infraestrutura
- **AWS Cognito**: Autenticação de usuários
- **GitHub Actions**: Automatização de deploy

## Como Contribuir

1. Faça um fork do projeto.
2. Crie uma nova branch: `git checkout -b feature/nova-feature`.
3. Faça suas alterações e commit: `git commit -m 'Adicionando nova feature'`.
4. Faça push para a branch: `git push origin feature/nova-feature`.
5. Abra um Pull Request.

## Contato

Para dúvidas, entre em contato com a equipe via [email](mailto:support@foodtech.com).

---

> **Nota**: Certifique-se de que as credenciais da AWS estejam configuradas corretamente antes de aplicar qualquer configuração.

