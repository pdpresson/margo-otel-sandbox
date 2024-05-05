helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana --create-namespace --namespace otel

kubectl delete cm grafana -n otel
kubectl apply -f configmap.yaml
kubectl delete pod $(kubectl get pods --namespace otel -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}") -n otel

kubectl apply -f ingress.yaml

rm ./admin-creds.txt
kubectl get secret --namespace otel grafana -o jsonpath="{.data.admin-password}" | base64 --decode >> admin-creds.txt