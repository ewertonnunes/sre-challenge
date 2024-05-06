## Java App Hello World ##

Application:'Hello World'
Language: 'Java 11'

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

Diretórios: 

/.github/workflows
    Diretório que contém todas as configurações do Pipeline Actions do repositório.
/app
    Diretório que contém todas os arquivos da aplicação Java - Hello World.
/helm
    Diretório que contém todos os manifestos de configuração do Helm Chart da aplicação.
/infra
    Diretório que contém todos os arquivos de configuração de Infra-as-code.

    