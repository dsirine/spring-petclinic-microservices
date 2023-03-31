kubectl create ns petclinic
helm install config-server config-server/ --values=./config-server/values.yaml
helm install discovery-server discovery-server/ --values=./discovery-server/values.yaml
helm install customers-server customers-server/ --values=./customers-server/values.yaml
helm install visits-service visits-service/ --values=./visits-service/values.yaml
helm install vets-service vets-service/ --values=./vets-service/values.yaml
helm install api-gateway api-gateway/ --values=./api-gateway/values.yaml
helm install tracing-server tracing-server/ --values=./tracing-server/values.yaml
helm install admin-server admin-server/ --values=./admin-server/values.yaml
helm install grafana-server grafana-server/ --values=./grafana-server/values.yaml
helm install prometheus-server prometheus-server/ --values=./prometheus-server/values.yaml
