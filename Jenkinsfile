pipeline {
    agent any
    tools {
      nodejs '16.15.1'
    }
    stages {
        stage('npm install') { 
            steps {
                sh 'npm install'
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build'
            }
        }
    }
}


