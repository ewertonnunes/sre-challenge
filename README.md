
# Java App Hello World #

Temos neste repositório uma aplicação em Java com uma API REST que responde um Hello World quando recebe um GET na porta 8080. 

(ex: curl http://localhost:8080/)

Output: 
    { "mensagem" : "Olá, Mundo" }

## Stack utilizada ##

**Back-end:** Java

**Infra-as-code**: Terraform

**Package Manager**: Helm

**Container Runtime**: Docker

**Cloud Provider**: AWS

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
´´´

## Diretórios ##

/.github/workflows
    Diretório que contém todas as configurações do Pipeline Actions do repositório.
/app
    Diretório que contém todos os arquivos da aplicação Java - Hello World.
/helm
    Diretório que contém todos os manifestos de configuração do Helm Chart da aplicação.
/infra
    Diretório que contém todos os arquivos de configuração de infra-as-code Terraform.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
|  hashicorp/aws    | ~> 4.47.0   |


## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| aws_lb.app_load_balancer      | resource |
| aws_route53_record.app_cname  | resource |
| aws_security_group.sg_load_balancer  | resource |


## Inputs terraform.tfvars

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name   |  Nome da Aplicação           | `string` | app | yes |
| subnets   |  Subnets para uso no Load Balancer           | `string array` | ["subnet-02a847612875d595f", "subnet-094a63fc4a2245b06", "subnet-0077940cf1c7eb53d"] | yes |
| internal   |  Conectividade do Balanceador de Carga            | `boolean` | false | yes |
| internal   |  Tipo de Balanceador           | `string` | application | yes |
| vpc_id   |  ID da VPC           | `string` | "vpc-0857ec9c2dc1874af" | yes |