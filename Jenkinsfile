pipeline {
  agent {
    node {
      label 'shipyard'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build . -t bind'
      }
    }    
    stage('Test') {
      steps {
        lock('port-1234') {
          sh 'docker run -d -p 1234:53/udp --name conditionaldnsbind bind'
          sh 'echo -e "server 127.0.0.1\nset port=1234\ngoogle.com\nexit\n" | nslookup'
          sh 'docker stop conditionaldnsbind'
        }
      }
      post {
        always {
          sh 'docker stop conditionaldnsbind'
          sh 'docker rm conditionaldnsbind'
        }
      }
    }
  }
}
