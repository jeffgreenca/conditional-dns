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
    stage('Run') {
      steps {
        sh 'ID=$(docker run -d -p 1234:53/udp bind)'
      }
    }
    stage('Test') {
      steps {
        sh 'echo -e "server 127.0.0.1\nset port=1234\ngoogle.com\nexit\n" | nslookup'
      }
    }
    stage('Stop') {
      steps {
        sh 'docker stop $ID'
        sh 'docker rm $ID'
      }
    }
  }
}
