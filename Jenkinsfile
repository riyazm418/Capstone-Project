pipeline {
    agent any
    environment {
        GIT_URL = 'https://github.com/riyazm418/riyaz123.git'
    }
    stages {
        stage('Clone Repository-main') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME
                    echo "Checking out branch: ${branchName}"
                    git url: "${GIT_URL}", branch: branchName
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Check if changes are pushed to the master branch
                    if (env.BRANCH_NAME == 'master') {
                        // Don't perform build action for the master branch
                        echo "it is  the master branch"
                        sh 'chmod +x build.sh'
                        sh './build.sh'
                    } else {
                        // Execute build script for other branches
                        echo " it is not master branch"
                        sh 'chmod +x build.sh'
                        sh './build.sh'
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // Check if changes are pushed to the master branch
                    if (env.BRANCH_NAME == 'master') {
                        // Don't perform deploy action for the master branch
                        echo "No deploy action defined for the master branch"
                        sh 'chmod +x deploy.sh'
                        sh './deploy.sh'
                    } else {
                        sh 'chmod +x deploy.sh'
                        sh './deploy.sh'
                    }
                }
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
