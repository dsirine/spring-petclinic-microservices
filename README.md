## Starting services locally with docker-compose
In order to start entire infrastructure using Docker, you have to build images by executing from a project root:
`./mvnw clean install -P buildDocker` then
`docker-compose up`. 
 You can reach all services as following:
* Discovery Server - http://localhost:8761
* Config Server - http://localhost:8888
* AngularJS frontend (API Gateway) - http://localhost:8080
* Customers, Vets and Visits Services - random port, check Eureka Dashboard 
* Tracing Server (Zipkin) - http://localhost:9411/zipkin/ (we use [openzipkin](https://github.com/openzipkin/zipkin/tree/master/zipkin-server))
* Admin Server (Spring Boot Admin) - http://localhost:9090
* Grafana Dashboards - http://localhost:3000
* Prometheus - http://localhost:9091

### Start a MySql database

You may start a MySql database with docker:

```
docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8
```
or download and install the MySQL database (e.g., MySQL Community Server 5.7 GA), which can be found here: https://dev.mysql.com/downloads/
## Jenkins
In order to change Jenkins Port Number From 8080 To Any Port Number(9999), to Avoid Conflict Of Other Services because Default Port No. 8080 For Jenkins and many Other services is same, you can just follow this steps: 
```
`nano /etc/default/jenkins`
change `HTTP_PORT = 8080` to `HTTP_PORT = 9999`
save file and now change Dir. to `sudo nano /lib/systemd/system/jenkins.service`
change Environment ="JENKINS_PORT=8080" to Previously written Port No.
`Environment="JENKINS_PORT=9999"`
and now:
`sudo systemctl restart jenkins.service` 
You can check the url of jenkins on http://localhost:9999
```
## Cloudformation
## Kubernetes
## Monitoring
## Custom metrics monitoring

Grafana and Prometheus are included in the `docker-compose.yml` configuration, and the public facing applications
have been instrumented with [MicroMeter](https://micrometer.io) to collect JVM and custom business metrics.

A JMeter load testing script is available to stress the application and generate metrics: [petclinic_test_plan.jmx](spring-petclinic-api-gateway/src/test/jmeter/petclinic_test_plan.jmx)

![Grafana metrics dashboard](docs/grafana-custom-metrics-dashboard.png)

### Using Prometheus

* Prometheus can be accessed from your local machine at http://localhost:9091

### Using Grafana with Prometheus

* An anonymous access and a Prometheus datasource are setup.
* A `Spring Petclinic Metrics` Dashboard is available at the URL http://localhost:3000/d/69JXeR0iw/spring-petclinic-metrics.
You will find the JSON configuration file here: [docker/grafana/dashboards/grafana-petclinic-dashboard.json]().
* You may create your own dashboard or import the [Micrometer/SpringBoot dashboard](https://grafana.com/dashboards/4701) via the Import Dashboard menu item.
The id for this dashboard is `4701`.