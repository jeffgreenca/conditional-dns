pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Check config') {
      steps {
        sh 'named-checkconf'
      }
    }
  }
}