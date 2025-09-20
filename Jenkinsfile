pipeline {
    agent none   

    environment {
        DOCKERHUB = credentials('docker-hub') 
    }

    stages {
        stage('Build & Push (Container Agent)') {
            agent { label 'local-agent' }   
            steps {
                script {
                    sh '''
                        echo "Building branch: ${env.BRANCH_NAME}"
                        echo "$DOCKERHUB_PSW" | docker login -u "$DOCKERHUB_USR" --password-stdin
                        docker build -t $DOCKERHUB_USR/demo-app:${BUILD_NUMBER} .
                        docker push $DOCKERHUB_USR/demo-app:${BUILD_NUMBER}
                    '''
                }
            }
        }

        stage('Deploy (Container Agent)') {
            agent { label 'local-agent' }
            steps {
                script {
                    sh '''
                        docker rm -f demo-app || true
                        docker run -d --name demo-app -p 3000:3000 $DOCKERHUB_USR/demo-app:${BUILD_NUMBER}
                    '''
                }
            }
        }

        stage('Deploy (EC2 Agent)') {
            agent { label 'ec2-node' }   
            steps {
                script {
                    sh '''
                        echo "$DOCKERHUB_PSW" | docker login -u "$DOCKERHUB_USR" --password-stdin
                        docker rm -f demo-app || true
                        docker run -d --name demo-app -p 3000:3000 $DOCKERHUB_USR/demo-app:${BUILD_NUMBER}
                    '''
                }
            }
        }
    }
}