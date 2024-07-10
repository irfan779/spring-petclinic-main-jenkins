pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
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
                sh 'mvn clean install -DskipTests=true'
                sh 'docker images'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("spring-petclinic:latest")

                    docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Containerize Application') {
            steps {
                script {
                    def dockerImage = docker.image("spring-petclinic:latest")
                    
                    // Build and run Docker container based on the Dockerfile
                    dockerImage.inside("-p 8080:8080") {
                        sh 'docker build -t spring-petclinic:latest .'
                        sh 'docker run -d -p 8080:8080 spring-petclinic:latest'
                    }
                }
            }
        }
    }
}
