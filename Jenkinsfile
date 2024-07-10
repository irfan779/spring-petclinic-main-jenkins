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
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker images'
                }
            }
        }

    }
}
