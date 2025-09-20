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
