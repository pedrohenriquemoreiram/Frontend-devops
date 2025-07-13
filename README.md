# Frontend DevOps - HTML + JS + Nginx

Este repositório contém o frontend simples estático que realiza uma chamada para o backend FastAPI, validando a comunicação completa da aplicação dentro do Kubernetes.

## 🧱 Tecnologias Utilizadas

- HTML5 + JavaScript
- Nginx
- Docker
- Kubernetes (com `Deployment` e `Service`)
- ArgoCD (para GitOps)

## 🎯 Funcionalidade

O frontend possui uma interface básica com um botão que testa a conexão com o backend através do endpoint `/db`.

## 🌐 Estrutura do HTML

```html
<button onclick="testarBackend()">Testar /db</button>
<script>
  async function testarBackend() {
    const response = await fetch("http://192.168.1.60:8181/db");
    const data = await response.json();
    document.getElementById("resposta").innerText = JSON.stringify(data);
  }
</script>


🚀 Deploy com Kubernetes
deployment.yaml: Define o pod com o Nginx servindo o index.html.

service.yaml: Expõe o frontend via NodePort.

kustomization.yaml: Gerencia os manifests via Kustomize.


🔁 Aplicar no cluster:

kubectl apply -k k8s/


🔄 Atualizar a imagem:

docker build -t pedrohenriquesc/frontend .
docker push pedrohenriquesc/frontend
kubectl rollout restart deployment frontend


🔗 Comunicação com Backend
A comunicação com o backend é feita via IP da VM:

fetch("http://192.168.1.60:8181/db")


📂 Organização

├── index.html
├── Dockerfile
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
