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
           git branch: 'main', credentialsId: 'jenkins-git-credentials', url: 'https://gitserver.thailife.com/dev-core/solar_rpt_web.git'
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
              npm run build:dev

              '''
          }
      }
    }

    stage("tar files files build"){
      steps {
          script{
              sh script: '''
              cd $WORKSPACE && mkdir solar_build && ls -l
              mv .next/ package.json ./solar_build/ && cd solar_build &&  ls -l
              cd .. && ls -l && tar cvzf solar_build.tar.gz ./solar_build/ && ls -l
              '''
          }
      }
    }

    stage("scp tar.gz"){
      steps {
          script{
              sh script: '''
              cd $WORKSPACE
              scp solar_build.tar.gz root@139.180.141.237:/
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
