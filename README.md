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