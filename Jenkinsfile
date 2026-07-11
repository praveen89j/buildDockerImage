pipeline {

    agent any

    environment {
        IMAGE_NAME = "nginx-demo"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/praveen89j/buildDockerImage.git'
            }
        }


        stage('Build Image') {
            steps {
                sh '''
                docker build -t ${IMAGE_NAME}:latest .
                '''
            }
        }


        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml

                kubectl rollout restart deployment nginx-demo

                kubectl rollout status deployment nginx-demo

                kubectl get pods
                kubectl get svc
                '''
            }
        }


        stage('Verify') {
            steps {
                sh '''
                kubectl get pods
                kubectl get svc
                '''
            }
        }
    }
}
