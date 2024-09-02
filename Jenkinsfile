pipeline {
    agent any
    stages {
        stage('Clone Git Repository') {
            steps {
                git(
                    url: "https://github.com/janaki-sasidhar/jenkins-learning.git",
                    branch: "main",
                    changelog: true,
                    poll: true
                )
            }
        }
        stage('Build') {
            steps {
                // Docker build
                sh 'echo "Building the Docker image"'
                sh 'docker build -t jenkins-learning .'
                // Verify the image
                sh 'docker images'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'echo "Running tests"'
            }
        }
    }
}
