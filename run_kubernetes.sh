kubectl create ns petclinic
helm create config-server config-server/ --values=./config-server/values.yaml
helm create config-server discovery-server/ --values=./discovery-server/values.yaml