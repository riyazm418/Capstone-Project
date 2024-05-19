pipeline {
  agent any
  environment {
    GIT_URL = 'https://github.com/riyazm418/riyaz123.git'
  }
  stages {
    stage('Clone Repository') {
      steps {
        git url: "${GIT_URL}", branch: "${env.BRANCH_NAME}"
      }
    }
    stage('Build Docker Image (dev)') {
      when {
        branch 'dev'
      }
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh' // Replace with your username
      }
    }
    stage('Build Docker Image (prod)') {
      when {
        branch 'master'
      }
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh' // Credentials for prod repo
      }
    }
    stage('Deploy Application (dev)') {
      when {
        branch 'dev'
      }
      steps {
        // Replace with your deployment commands (e.g., using SSH)
        sh 'ssh user@server "docker-compose down && docker-compose -p dev up -d"'
      }
    }
  }
  post {
    success {
      echo 'Pipeline completed successfully!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
