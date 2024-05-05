helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install --values values.yaml loki --create-namespace --namespace=otel grafana/loki