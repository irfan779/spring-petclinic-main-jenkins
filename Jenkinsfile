pipeline {
    agent any

    environment {
        // Define the ID of the Docker Hub credentials stored in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    tools {
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/irfan779/spring-petclinic-main-jenkins.git'
            }
        }

        stage('Build') {
            steps {
                sh 'java --version'
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    def dockerImage = docker.build("spring-petclinic:latest")
                    
                    // Authenticate with Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                        // Push Docker image to Docker Hub
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Containerize Application') {
            steps {
                script {
                    // Run the Docker container from the built image
                    dockerImage.inside {
                        // Additional steps inside the Docker container if needed
                        sh 'echo "Container started"'
                    }
                }
            }
        }
    }
}
