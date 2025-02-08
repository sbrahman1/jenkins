pipeline {
    agent any
    
    // Define parameter
    parameters {
        string(name: 'BUILD_VERSION', defaultValue: '1.0', description: 'Tag for the Docker image')
    }

    stages {
        stage('Checkout') {
            steps {
                // 2) Pull code from a public GitHub repo
               
                git branch: 'main', url: 'https://github.com/sbrahman1/jenkins.git'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Print the parameter in the Jenkins console logs
                    echo "BUILD_VERSION selected: ${params.BUILD_VERSION}"
                    
                    // 3) Build the Docker image, tagging with BUILD_VERSION 2.0
                    sh """
                      docker build -t shams43/jenkins:${params.BUILD_VERSION} .
                    """
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // 4) Securely use Docker Hub credentials
                    withCredentials([
                        usernamePassword(
                            credentialsId: 'shams43', 
                            usernameVariable: 'DOCKER_USER', 
                            passwordVariable: 'DOCKER_PASS'
                        )
                    ]) {
                        // Docker login using the injected credentials
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"

                        // Push the Docker image with the BUILD_VERSION tag
                        sh "docker push shams43/jenkins:${params.BUILD_VERSION}"
                    }
                }
            }
        }
    }
}
