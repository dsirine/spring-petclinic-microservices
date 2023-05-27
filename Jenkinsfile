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
          aws --version
          eksctl version
          kubectl version --short --client
        '''  
       }
    }
    stage ('Prune docker data'){
      steps  {
        sh 'docker system prune -a --volumes -f'
      }
    }

    stage('Create an EKS Cluster') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'petclinic'
        ]])
        {
            sh "eksctl create cluster --name project --version 1.25 --region eu-west-3 --nodegroup-name standard-workers --node-type t3.micro --nodes 4 --nodes-min 2 --nodes-max 6 --managed"
        }

      }
    }

    stage ('Enable to connect to the cluster'){
      steps  {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'petclinic'
        ]])      
        {
          sh 'aws eks update-kubeconfig --name project --region eu-west-3'
        }
      }
    }
    stage ('Deploy to EKS'){
      steps  {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
          credentialsId: 'petclinic'
        ]])
        dir('Kubernetes') {
            sh './run_kubernetes.sh'
        }
      }
    }
    stage ('curl'){
      steps  {
        sh 'curl http://localhost:8761'
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