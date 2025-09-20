pipeline {
    agent any

    stages {
        stage('Echo Branch') {
            steps {
                script {
                    echo "Building branch: ${env.BRANCH_NAME}"
                }
            }
        }
    }
}
