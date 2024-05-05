helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm install jaeger jaegertracing/jaeger --create-namespace --namespace otel
kubectl set env deployment/jaaeger-jaeger-query QUERY_BASE_PATH=/jaeger -n otel
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml