pipeline {
    agent any
    parameters {
        string(name: 'repositoryName', defaultValue: 'janakisasidhar1', description: 'Docker repository name')
    }    
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
                    // Create new variable for username, called repositoryName 
                    sh '/usr/local/bin/docker login -u $USERNAME -p $PASSWORD'
                    sh '/usr/local/bin/docker tag jenkins-learning janakisasidhar1/jenkins-learning'
                    sh '/usr/local/bin/docker push janakisasidhar1/jenkins-learning'
                }
            }
        }

        // Run container from image
        stage("Deploy") {
            steps {
                sh '/usr/local/bin/docker stop jenkins-learning || true'
                sh '/usr/local/bin/docker rm -f jenkins-learning || true'
                sh '/usr/local/bin/docker run -d -p 5001:5000 --name jenkins-learning janakisasidhar1/jenkins-learning:latest'
            }
        }
    }
}
