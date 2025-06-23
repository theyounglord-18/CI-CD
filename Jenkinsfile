pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/theyounglord-18/CI-CD.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-app .'
            }
        }

        stage('Run Flask App') {
            steps {
                sh 'docker run -d -p 8000:8000 flask-app'
            }
        }
    }
}
