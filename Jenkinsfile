pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/dsirine/spring-petclinic-microservices.git'
      }
    }
    stage('Verify tooling') {
       steps {
        sh '''
          docker version
          docker info
          docker compose version
          curl --version
        '''  
       }
    }
    stage ('Prune docker data'){
      steps  {
        sh 'docker system prune -a --volumes -f'
      }
    }
    stage('Start containers') {
      steps {
        sh 'docker-compose up -d'
        sh 'docker-compose ps'
      }
    }
    stage('Run tests again the container') {
      steps {
        sh 'curl http://localhost:8888/'
        sh 'curl http://localhost:8761/'
        sh 'curl http://localhost:9090/'
        sh 'curl http://localhost:8080/'
        sh 'curl http://localhost:8081/'
        sh 'curl http://localhost:3000/'
        sh 'curl http://localhost:9091/'
        sh 'curl http://localhost:9411/'
        sh 'curl http://localhost:8083/'
        sh 'curl http://localhost:8082/'
      }
    }
    stage('cloudformation-aws') {
      steps {
        sh 'cd CloudFormation'
        sh 'aws cloudformation create-stack --stack-name myFirstTest --region eu-west-3 --template-body file://network.yml --parameters file://network.json --capabilities CAPABILITY_NAMED_IAM'
      }
    }
  }
  post {
    always {
      sh 'docker-compose down --remove orphans -v'
      sh 'docker-compose ps'
    }
  }
}