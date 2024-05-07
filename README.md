
# Java App Hello World #

Temos neste repositório uma aplicação em Java com uma API REST que responde um Hello World quando recebe um GET na porta 8080. 

(ex: curl http://localhost:8080/)

Output: 
    { "mensagem" : "Olá, Mundo" }

## Stack utilizada ##

```
**Back-end:** Java
**Infra-as-code**: Terraform
**Package Manager**: Helm
**Container Runtime**: Docker
**Container Repository**: Amazon ECR
**Cloud Provider**: AWS
``` 

## Estrutura de diretórios ##

```plaintext

├── LICENSE
├── README.md
├── .github
│   └── workflows
│       └── BuildAndDeploy.yaml
├── app
│   ├── .gitignore
│   ├── Dockerfile
│   ├── mvnw
│   ├── mvnw.cmd
│   ├── pom.xml
│   ├── .mvn
│   │   └── wrapper
│   │       ├── maven-wrapper.jar
│   │       └── maven-wrapper.properties
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── com
│       │   │       └── example
│       │   │           └── app
│       │   │               ├── AppAController.java
│       │   │               └── AppApplication.java
│       │   └── resources
│       │       └── application.properties
│       └── test
│           └── java
│               └── com
│                   └── example
│                       └── app
│                           └── AppApplicationTests.java
├── helm
│   ├── .helmignore
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates
│       ├── deployment.yaml
│       ├── ingress.yaml
│       ├── service.yaml
│       ├── serviceaccount.yaml
│       ├── _helpers.tpl
│       └── tests
│           └── test-connection.yaml
└── infra
    ├── cleaning.json
    ├── loadbalancer.tf
    ├── provider.tf
    ├── route53.tf
    ├── securitygroup.tf
    ├── terraform.tfvars
    └── variables.tf
```
<!-- BEGIN_TF_DOCS -->
## Diretórios ##

|   Diretório       | Descrição |
|-------------------|-----------|
| `/.github/workflows` |     Diretório que contém todas as configurações do Pipeline Actions do repositório.       |
| `/app`               |     Diretório que contém todos os arquivos, diretórios e subdiretórios da aplicação Java  |
| `/helm`              |     Diretório que contém todos os manifestos de configuração do Helm Chart da aplicação.  |
| `/infra`             |     Diretório que contém todos os arquivos de configuração de infra-as-code Terraform.    |

## Requirements

| Name | Version |
|------|---------|
| `terraform` | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
|  `hashicorp/aws`    | ~> 4.47.0   |


## Modules

No modules.

## Resources

| Name | Type | File |
|------|------| ---- |
| `aws_lb.app_load_balancer`      | resource | loadbalancer.tf |
| `aws_route53_record.app_cname`  | resource | route53.tf |
| `aws_security_group.sg_load_balancer`  | resource | securitygroup.tf |


## Inputs terraform.tfvars 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name`             |  Nome da Aplicação                             | `string`         | app | yes |
| `subnets`          |  Subnets para uso no Load Balancer             | `string list`     | ["subnet-02a847612875d595f", "subnet-094a63fc4a2245b06", "subnet-0077940cf1c7eb53d"] | yes |
| `internal`         |  Conectividade do Balanceador de Carga         | `boolean`         | false | yes |
| `internal`         |  Tipo de Balanceador                           | `string`          | application | yes |
| `vpc_id`           |  ID da VPC                                     | `string`          | "vpc-0857ec9c2dc1874af" | yes |
| `eks_cluster_name` | Nome do Cluster EKS                            | `string`          | "eks-cluster" | yes |
| `zone_id`          | ID da Zona DNS - Route53                       | `string`          |   = "DKHNIA123" | yes
## Configuração do Repositório e Deployment ##

### Step 1: 
    - Crie suas credenciais na AWS e configure as secrets no Github:

    `aws-access-key-id:      ${{ secrets.AWS_ACCESS_KEY_ID }}`
    `aws-secret-access-key:  ${{ secrets.AWS_SECRET_ACCESS_KEY }}`
    `aws-account-id:         ${{ secrets.AWS_ACCOUNT_ID }}`

https://docs.github.com/pt/actions/security-guides/using-secrets-in-github-actions

<img src="https://docs.github.com/assets/cb-28266/mw-1440/images/help/repository/repo-actions-settings.webp">

<img src="https://docs.github.com/assets/cb-62141/mw-1440/images/help/repository/actions-secrets-tab.webp">

### Step 2:
    - Colete as configurações de contexto do seu cluster EKS na AWS e armazene numa Secret do Github com o nome KUBE_CONFIG_DATA.

    - Acesse o CloudShell da sua Conta AWS:
      `aws eks update-kubeconfig --name eks-cluster --region us-east-1`

    - Copie o conteúdo do  `~/.kube/config` e crie a secret no Github.
      KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}

### Step 3: 
    - Para fazer deploy preencha as configurações conforme instruções no `terraform.tfvars`, substitua pelos valores da sua conta AWS.
```
name               = "app"
subnets            = ["subnet123"]
internal           = false
load_balancer_type = "application"
vpc_id             = "vpc-123"
eks_cluster_name   = "eks-cluster"
zone_id            = "DKHNIA123"
``` 

### Step 4:
    - Faça um commit na branch main para criar sua aplicação e infraestrutura.

    `git add . && git commit -m "Meu primeiro deploy" && git push`

### Como destruir a infraestrutura :
    - Para destruir a infra utilize o arquivo "/infra/cleaning.json" e atribua o valor { "destroy" : "true" }
    - Esta configuração executará um terraform destroy em todos os elementos da infra.
