kubectl create ns petclinic
helm create config-server config-server/ --values=./config-server/values.yaml
helm create config-server discovery-server/ --values=./discovery-server/values.yaml
helm create customers-service customers-service/ --values=./customers-service/values.yaml
helm create visits-service visits-service/ --values=./visits-service/values.yaml
helm create vets-service vets-service/ --values=./vets-service/values.yaml
helm create api-gateway api-gateway/ --values=./api-gateway/values.yaml
helm create tracing-server tracing-server/ --values=./tracing-server/values.yaml
helm create admin-server admin-server/ --values=./admin-server/values.yaml
helm create grafana-server grafana-server/ --values=./grafana-server/values.yaml
helm create prometheus-server prometheus-server/ --values=./prometheus-server/values.yaml
