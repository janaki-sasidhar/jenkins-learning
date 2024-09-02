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
                sh '/usr/local/bin/docker build -t jenkins-learning .'
                // Verify the image
                sh '/usr/local/bin/docker image ls jenkins-learning:latest'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'echo "Running tests"'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '/usr/local/bin/docker login -u $USERNAME -p $PASSWORD'
                    sh '/usr/local/bin/docker tag jenkins-learning janakisasidhar1/jenkins-learning'
                    sh '/usr/local/bin/docker push $USERNAME/jenkins-learning'
                }
            }
        }
    }
}
