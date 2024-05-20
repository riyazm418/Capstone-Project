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
        sh 'docker login -u riyazm418 -p Rahila@100'
        sh 'docker tag devops-build:v1.0 riyazm418/dev:dev'
        sh 'docker push riyazm418/dev:dev'
      }
    }
    stage('Build Docker Image (prod)') {
      when {
        branch 'master'
      }
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh' // Credentials for prod repo
        sh 'docker login -u riyazm418 -p Rahila@100'
        sh 'docker tag devops-build:v1.0 riyazm418/prod:prod'
        sh 'docker push riyazm418/prod:prod'
      }
    }
    stage('Deploy Application (prod)') {
      when {
        branch 'prod'
      }
      steps {
        // Replace with your deployment commands (e.g., using SSH)
        sh 'chmod +x build.sh'
        sh './deploy.sh'
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
