pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
        PATH = "/opt/homebrew/bin/docker"
        IMAGE_TAG = "${BUILD_NUMBER}"
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
                    sh '''
                    echo 'Build Docker Image'
                    docker build -t irfan779/spring-petclinic:${BUILD_NUMBER} .
                    '''
                }
            }
        }

        stage('Push the artifacts') {
            steps {
                script {
                    sh '''
                    echo 'Push to repo'
                    docker push irfan779/spring-petclinic:${BUILD_NUMBER} 
                    '''
                }
            }
        }

    }
}
