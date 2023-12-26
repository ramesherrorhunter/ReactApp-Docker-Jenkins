pipeline {
    agent any
    
    stages {
        stage('Checkout'){
            steps{
                git url:'https://github.com/ramesherrorhunter/react-node-nginx-cide.git', branch:'master'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-react-app', '-f Dockerfile .')
                }
            }
        }
        
        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
