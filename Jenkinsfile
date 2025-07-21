pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-cred')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'git-cred', url: 'https://github.com/Bharathi1306/devflix-pipeline.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def appName = "bharathi136/devflix-app"
                    def appTag = "latest"
                    sh "docker build -t ${appName}:${appTag} ."
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    def appName = "bharathi136/devflix-app"
                    def appTag = "latest"
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    sh "docker push ${appName}:${appTag}"
                }
            }
        }

        stage('Clean Docker Images (optional)') {
            steps {
                sh 'docker rmi bharathi136/devflix-app:latest || true'
            }
        }
    }

    post {
        success {
            echo '✅ Build and push completed successfully.'
        }
        failure {
            echo '❌ Build failed.'
        }
    }
}
