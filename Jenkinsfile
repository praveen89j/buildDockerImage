pipeline {

    agent any

    environment {
        IMAGE_NAME = "nginx-demo"
        CONTAINER_NAME = "nginx-container"
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


        stage('Deploy Container') {
            steps {
                sh '''
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true

                docker run -d \
                --name ${CONTAINER_NAME} \
                -p 8080:80 \
                ${IMAGE_NAME}:latest
                '''
            }
        }


        stage('Verify') {
            steps {
                sh '''
                docker ps
                '''
            }
        }
    }
}
