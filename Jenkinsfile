pipeline {
    agent any
     environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
     
    }

    stages {
        stage('Checkout') {
            steps {

                git branch: 'main', url: 'https://github.com/Khanjanpurani/jenkins-agent.git'
            }
        }
        
        stage('Build Image') {
            steps {

                script {
                    bat 'docker build -t my-nginx-image:latest "C:/Users/Khanjan/Desktop/internship/jenkins agent/dockerfile/nginx"'
                }
            }
        }
        
        stage('Container Test') {
            steps {

                script {
                    def container_id = bat(script: 'docker run -d --name my-nginx-container12 my-nginx-image:latest', returnStdout: true).trim()
                    
                }
                

                script {
                    def nginx_version = bat(script: 'docker exec my-nginx-container12 nginx -v', returnStdout: true).trim()
                    echo "Nginx version: ${nginx_version}"
                }
                
                
            }
        }
        
        stage('Publish Docker Image') {
            steps {
                
                script {
                      docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        bat 'docker tag my-nginx-image:latest puranikhanjan307/my-nginx-image:latest'
                        bat 'docker push puranikhanjan307/my-nginx-image:latest'
                    }
                }
            }
        }
    }
}
