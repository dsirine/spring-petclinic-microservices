kubectl create ns petclinic
helm upgrade --install config-server config-server --values=./Kubernetes/config-server/values.yaml 
helm upgrade --install discovery-server discovery-server --values=./Kubernetes/discovery-server/values.yaml
helm upgrade --install customers-server customers-server --values=./Kubernetes/customers-server/values.yaml
helm upgrade --install visits-service visits-service --values=./Kubernetes/visits-service/values.yaml
helm upgrade --install vets-service vets-service --values=./Kubernetes/vets-service/values.yaml
helm upgrade --install api-gateway api-gateway --values=./Kubernetes/api-gateway/values.yaml
helm upgrade --install tracing-server tracing-server --values=./Kubernetes/tracing-server/values.yaml
helm upgrade --install admin-server admin-server --values=./Kubernetes/admin-server/values.yaml
helm upgrade --install grafana-server grafana-server --values=./Kubernetes/grafana-server/values.yaml
helm upgrade --install prometheus-server prometheus-server --values=./Kubernetes/prometheus-server/values.yaml
