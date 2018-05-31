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
          sh 'ID=$(docker run -d -p 1234:53/udp bind)'
          sh 'echo -e "server 127.0.0.1\nset port=1234\ngoogle.com\nexit\n" | nslookup'
          sh 'docker stop $ID'
        }
      }
      post {
        always {
          // In case the test fails
          sh 'docker stop $ID'
          // Clean up
          sh 'docker rm $ID'
        }
      }
    }
  }
}
