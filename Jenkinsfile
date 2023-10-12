pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your-django-app-image'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    // SSH into the server where you want to deploy the Docker container
                    sshagent(credentials: ['your-ssh-credentials-id']) {
                        sh "ssh user@your-server-address 'docker pull ${DOCKER_IMAGE}'"
                        sh "ssh user@your-server-address 'docker stop your-django-container || true'"
                        sh "ssh user@your-server-address 'docker rm your-django-container || true'"
                        sh "ssh user@your-server-address 'docker run -d -p 8000:8000 --name your-django-container ${DOCKER_IMAGE}'"
                    }
                }
            }
        }
    }
}
