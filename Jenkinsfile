pipeline {
    agent { node { label 'docker' } }

    environment {
        IMAGE = "14prajwal/my-app"
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prajwal-d14/myapp.git'
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t $IMAGE ."
            }
        }
		
		stage('Run Image') {
            steps {
                sh "docker run -d -p 8080:8080 $IMAGE"
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                    echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin
                    docker push $IMAGE
                '''
            }
        }
    }
}
