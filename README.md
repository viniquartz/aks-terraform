# aks-terraform

Criar um resource group, aks, acr, e uma role assign para o aks se conectar com o acr.
Recursos opcionais que podem ser chamados no main raiz como modulos:

- Key Vault
- Rede hub e rede spoke para aks.
- ssh, para ser usado na configuração de linux profile no aks.

## Azure build

<https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build>

## remote-state

Comece por aqui! Crie os recursos e use o arquivo "backend-config.tfbackend" para executar o terraform para criar a infra do projeto ou crie um arquivo chamado backend.tf e adicione as informacoes lá dentro, ou até mesmo dentro do provider.tf.

> Será o local onde vai ser salvo a tfstate.

Vou usar o comando a baixo.

```bash
terraform init -backend-config="backend-config.tfbackend"
```

## Azure Login

<https://learn.microsoft.com/pt-br/azure/developer/github/connect-from-azure?tabs=azure-portal%2Clinux>

## Secrets

Create a GitHub Actions secret AZURE_CREDENTIALS in the following format. Copy these values from your service principal.
  {
      "clientId": "Client ID",
      "clientSecret": "Client Secret",
      "subscriptionId": "Subscription ID",
      "tenantId": "Tenant ID"
  }

AZURE_BACKEND_RG Resource Group do backend
AZURE_BACKEND_STORAGE Storage Account
AZURE_BACKEND_CONTAINER Container do state
AZURE_SAS_TOKEN SAS Token para o backend
INFRACOST_API_KEY API Key da Infracost

## IAM

Vai falhar a role assign para o aks se conectar com o acr, para resolver isso voce deve adicionar a permissao owner e/ou Microsoft.Authorization/roleAssignments/write na subscription ou no rg. Verifique seu Application (client) ID em Micorsoft Entra ID > Manage > App registrations > [Seu App].

Uma opção é criar o app registration ejá conceder as permissões e depois só configurar e utilizar.

## Workflows

Utilizando workspace para reaproveitar o código. Os tfvars estão em config, separados por ambiente.

Steps base:

1. checkout
2. setup terraform
3. azlogin
4. criar backend-config.tfbackend
5. terraform init
6. workspace
7. validate

### terraform.yaml

Usado para criação dos recursos na Azure.

Jobs:
  terraform-plan
  terraform-apply

Steps extras:

-> TFSEC - para analise de segurança. Está comentado no código pois é um lab, mas foi testado e está funcional. Apresentou 4 vulnerabilidades.

-> Infracost - Estou usando o teste de 14 dias. Funcionando! É preciso criar uma secret com o valor do API_TOKEN.

### terraform-destroy.yaml

Usado para destruir os recursos.

Jobs:
  terraform-plan-destroy
  terraform-apply-destroy
