# aks-terraform

## remote-state

Comece por aqui. Crie os recursos e adicione o arquivo "backend-config.tfbackend" na pasta onde vai executar o terraform para criar a infra do projeto ou crie um arquivo chamado backend.tf e adicione as informacoes lá dentro, ou até mesmo dentro do provider.tf.

Vou usar o comando a baixo.

```bash
terraform init -backend-config="backend-config.tfbackend"
```
