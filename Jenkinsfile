pipeline {
  agent any

  environment {
    AWS_REGION = "us-east-1"
    ECR_REPO_NAME = "my-flask-app-repo"
    IMAGE_TAG = "v1"
    CLUSTER_NAME = "demo-cluster"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/TheSumanta365/Microservices-CI-CD-pipeline-automation.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh 'docker build -t $ECR_REPO_NAME:$IMAGE_TAG ./app'
        }
      }
    }

    stage('Login to ECR') {
      steps {
        script {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key-id']]) {
            sh '''
              aws ecr get-login-password --region $AWS_REGION | \
              docker login --username AWS --password-stdin \
              $(aws sts get-caller-identity --query Account --output text).dkr.ecr.$AWS_REGION.amazonaws.com
            '''
          }
        }
      }
    }

    stage('Tag & Push Image') {
      steps {
        script {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key-id']]) {
            sh '''
              ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
              IMAGE_URI=$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:$IMAGE_TAG
              docker tag $ECR_REPO_NAME:$IMAGE_TAG $IMAGE_URI
              docker push $IMAGE_URI
            '''
          }
        }
      }
    }

    stage('Deploy to EKS') {
      steps {
        script {
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access-key-id']]) {
            sh '''
              aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
              kubectl apply -f ./kubernetes/deployment.yaml
            '''
          }
        }
      }
    }
  }
}
