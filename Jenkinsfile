pipeline {
  agent {
    docker {
      image 'node:16.15.1'
    }
  }
    
  environment {
      HOME = '.'
  }

  stages {
    stage('Information') {
      steps {
        sh 'node -v'
        sh 'npm -v'
      }
    }

    stage('checkout scm') {
      steps {
        script{
           sh script: '''
              cd $WORKSPACE/
              '''
           git branch: 'main', url: 'https://github.com/newzpanuwat/react-folder-structure'
        }
      }
    }

    stage('Install Dependencies') {
      steps {
          script{
              sh script: '''
              cd $WORKSPACE/
              ls -l
              npm install
              '''
          }
      }
    }

    stage("Build"){
      steps {
          script{
              sh script: '''
              
              cd $WORKSPACE/
              npm run build

              '''
          }
      }
    }

    stage("tar files files build"){
      steps {
          script{
              sh script: '''
              cd $WORKSPACE && mkdir my_app && ls -l &&
              mv build/ package.json ./my_app/ && cd my_app &&  ls -l &&
              cd .. && tar cvzf my_app.tar.gz ./my_app/ && ls -l
              '''
          }
      }
    }

    stage("scp tar.gz"){
      steps {
          script{
              sh script: '''
              cd $WORKSPACE &&
              sshpass -p "9hL?usEjP4%XN*=N" scp my_app.tar.gz root@139.180.141.237:/root
              '''
          }
      }
    }

  }//end stages
  
  post {
      always {
          cleanWs()
      }    
  }
}//end pipeline
