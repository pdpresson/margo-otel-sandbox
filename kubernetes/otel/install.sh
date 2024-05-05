helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install otel-collector-cluster open-telemetry/opentelemetry-collector --create-namespace --namespace otel --values ./deployment_values.yaml
