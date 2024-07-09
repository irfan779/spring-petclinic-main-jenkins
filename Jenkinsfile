pipeline {
    agent any

    environment {
        // Docker Hub credentials ID stored in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
    }

    tools {
        // Reference Docker tool configured in Global Tool Configuration
        docker 'Docker'
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
                sh 'mvn clean install -DskipTests=true'
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
