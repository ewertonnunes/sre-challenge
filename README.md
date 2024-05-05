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


      try