# aks-terraform

## remote-state

Comece por aqui. Crie os recursos e adicione o arquivo backend-config.txt na pasta onde vai executar o terraform para criar a infra do projeto ou crie um arquivo chamado backend.tf e adicione as informacoes lá dentro, ou até mesmo dentro do provider.tf.

Vou usar o comando a baixo.

```
terraform init -backend-config="backend-config.tfbackend"
```
