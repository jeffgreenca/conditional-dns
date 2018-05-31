pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Smoke') {
      steps {
        sh 'uptime'
      }
    }
  }
}