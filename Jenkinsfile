pipeline {
    agent any

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
                sh 'docker --version'
                sh 'mvn clean install -DskipTests=true'
            

        }
    }
    
}
}
