pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-app"
        CONTAINER_PORT = "8000"
    }

    stages {
        stage('Clone') {
            steps {
                echo "🔄 Cloning from main branch..."
                git branch: 'main', url: 'https://github.com/theyounglord-18/CI-CD.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Flask App') {
            steps {
                echo "🚀 Running Flask app container..."
                sh 'docker run -d -p $CONTAINER_PORT:$CONTAINER_PORT $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo "✅ Build and deploy successful!"
        }
        failure {
            echo "❌ Build failed. Check logs."
        }
    }
}
