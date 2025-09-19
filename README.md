# aks-terraform

## Azure build

<https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build>

## remote-state

Comece por aqui. Crie os recursos e adicione o arquivo "backend-config.tfbackend" na pasta onde vai executar o terraform para criar a infra do projeto ou crie um arquivo chamado backend.tf e adicione as informacoes lá dentro, ou até mesmo dentro do provider.tf.

Vou usar o comando a baixo.

```bash
terraform init -backend-config="backend-config.tfbackend"
```

## Secrets

AZURE_CLIENT_ID App Registration Client ID
AZURE_TENANT_ID Tenant ID
AZURE_SUBSCRIPTION_ID Subscription ID
AZURE_CLIENT_SECRET Client Secret
AZURE_BACKEND_RG Resource Group do backend
AZURE_BACKEND_STORAGE Storage Account
AZURE_BACKEND_CONTAINER Container do state
AZURE_SAS_TOKEN SAS Token para o backend
INFRACOST_API_KEY API Key da Infracost
