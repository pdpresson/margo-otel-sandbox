helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install promtail grafana/promtail --values values.yaml --create-namespace --namespace otel