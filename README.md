curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64
Move-Item .\kind-windows-amd64.exe c:\Kind\kind.exe

mvn -f app/pom.xml clean package

helm install app ./app
helm delete app

docker login -u ewertonrdr  docker.io
docker build -t ewertonrdr/app:latest ./app/
docker push ewertonrdr/app:latest


helm package ./app -d ./helm --version ${{ github.sha }}


  docker:
     name: Build Docker Image
     runs-on: ubuntu-latest
     needs: build

     steps: 

     toto


     resource "aws_lb" "app_load_balancer" {
  name               = "app"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.sg_load_balancer.id]
  subnets            = var.subnets

  enable_deletion_protection = true
}

depends_on = aws_security_group.sg_load_balancer.id




  eks-authentication:
    name: Authenticate with EKS Cluster
    runs-on: ubuntu-latest
    needs: 
      - terraform

    steps:
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: <your-region> # Substitua pelo seu AWS region

    - name: Set up kubectl
      uses: azure/setup-kubectl@v1
      with:
        version: 'latest'
      env:
        KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}

    # Adicione outros passos conforme necessário para interagir com o cluster EKS
    # Por exemplo, você pode executar comandos kubectl para implantar aplicativos ou consultar recursos no cluster.



apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJQXVQMzEwT083OTh3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBMU1EVXhPRFU0TURWYUZ3MHpOREExTURNeE9UQXpNRFZhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUNwOGVyQ1dpa3hieFJLQS9aVVhXbHByb1RJRjZHSFVENnR4T1YwazU3dDZtUnFVaTUybHJLMkNrSlQKdUtidGhpRnJaN1dyRFQ3SUk2YlFkUFViTm9FRkMrcy9kTUw5Nm15SlJER0pBcWZMRng2cXhhSmxWbElLZW5QOApsWmdVQnJFcEJ3akgrM3hTWk5KTklDNGU0ekNIN0lwMnRVcUdaRUp5QThhRFh0QVpkN3d5ZkhLMGhaZkR5akV0CnBiWVBmKzhiMk1iajhUdTRKbm1RQ3lMY0UvTnZpNXdzU3lGeUhPRnFjaHNGOUkyTzU2MU83UDZBcmhzQVFoQXgKMHpHMGoyZ0svT2dlT1dDc2krUmNncGVKUjdZQlNEU1g2dTdMdk5ydDRUM3VsZDgxUmI5MnI1R2NSUU1wOEtLZApjditrZkZrM1dJNXYxZmx4ZHl1MDNEUkYyLytkQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJTeXh6TFd6RkUyRmpuby9JT1FKUm4yZmd0MW1EQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQWU5eG5hNUVFdwpReUNyemtOc3hxUVo4b1RYTmJLRmdlaGRyVzhWeXF6YUIyNjUrNXpnS1V2UUFJUXhBYlRrNDYwWTBRR0hOSGkzCjBITWtnYTQ4dUtlY0c1VnBLVWdYMEFucC96Rm5YWk1aVVU5b2hHQXJrWjJLWXZpazMzNEFUbG9MV1pOaFFmUzQKSjJmUUk3djdZNjV5U0hKZHpXYllLQmNSbjRneWhtSk1Qc3dVWHNDZWZoMnpIV2U4ck1Yd1RuTi9qeHhKbWt0Zwp5akRaOWNWMU93OC81MnlkN0l6TDE3dXM1T0VidlVRN0s4ZkNwSGdiQUNnMzhwbzRyS216NHBNM2VZQ3RkVnY1Cmx3V3Q4N0Y4djhtWStPWGVERlhhdUowMUEzQUZJa3FmUW5oMC90MEY1RzZkaWl1NUtKS1pPV01wV1B2WTV5Y1cKUkErSEhZQ1JFTURSCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://B262BF081701BA82081DE65C2A8740F9.gr7.us-east-1.eks.amazonaws.com
  name: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
contexts:
- context:
    cluster: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
    user: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
  name: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
current-context: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
kind: Config
preferences: {}
users:
- name: arn:aws:eks:us-east-1:854299600683:cluster/app-eks-cluster
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-east-1
      - eks
      - get-token
      - --cluster-name
      - app-eks-cluster
      - --output
      - json
      command: aws


      kubectl config view --minify --flatten > kubeconfig.yaml
