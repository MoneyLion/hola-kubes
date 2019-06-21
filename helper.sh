kubectl  create secret generic --dry-run=true --output=json  --namespace development hola-kubes  --from-literal=hola-kubes-secret='kubes_es_impresionante' > template-development.json

kubeseal --controller-namespace development < template-development.json > infra/secrets/hola-kubes.yaml --format=yaml --namespace development



kubectl create clusterrolebinding $USER-cluster-admin-binding --clusterrole=cluster-admin --user=amorris@moneylion.com

kubectl create clusterrolebinding $USER-cluster-admin-binding --clusterrole=cluster-admin --user=$USER_EMAIL


kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.7.0/controller.yaml

kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.7.0/sealedsecret-crd.yaml

release=$(curl --silent "https://api.github.com/repos/bitnami-labs/sealed-secrets/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')

### Grab cert from secrets controller
wget -qO- http://localhost:8080/v1/cert.pem
