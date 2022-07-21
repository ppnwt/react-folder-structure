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
        stage('npm build') { 
            steps {
                sh 'npm run build'
            }
        }
        stage('Run test') { 
            steps {
                echo '####THIS STEP RUN TEST'
            }
        }
        stage('Deploy') { 
            steps {
                sh './script/deploy.sh'
            }
        }
    }
}


