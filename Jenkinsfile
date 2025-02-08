pipeline {
    agent any
    
    // BUILD_VERSION parameter
    parameters {
        string(name: 'BUILD_VERSION', defaultValue: '1.0', description: 'Tag for the Docker image')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sbrahman1/jenkins.git'
            }
        }

        stage('Docker Build') {
            steps {
                script {

                    echo "Building Docker image with tag: ${params.BUILD_VERSION}"
                    sh """
                      docker build \
                        -t shams43/jenkins-demo:${params.BUILD_VERSION} .
                    """
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    withCredentials([
                        usernamePassword(
                            credentialsId: 'shams',
                            usernameVariable: 'DOCKER_USER',
                            passwordVariable: 'DOCKER_PASS'
                        )
                    ]) {
                        // Docker login using the injected credentials
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                        
                        // Push the Docker image with the BUILD_VERSION tag
                        sh "docker push shams43/jenkins-demo:${params.BUILD_VERSION}"
                    }
                }
            }
        }
    }
}
