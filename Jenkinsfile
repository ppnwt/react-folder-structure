pipeline {
    agent any
    tools {
      nodejs '16.15.1'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm -v'
                sh 'node -v'
            }
        }
    }
}


