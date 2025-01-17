pipeline {
    agent { label "worker-node"}
    parameters {
        choice(name: 'CHOICE', choices: ['net-tools', 'curl', 'unzip'], description: 'Pick a tool to install')
    }

    environment {
        IMAGE_NAME = 'docker-jenkins-choice'
        DOCKER_REGISTORY = 'docker-jenkins-choice-task'
        DOCKER_USERNAME = 'palash150403'
    }

    stages {
        stage ("docker build") {
            steps {
                script {
                sh "docker build --build-arg TOOLS=${params.CHOICE} -t ${IMAGE_NAME}"
                }
            }
        }

        stage ("Push to Registory") {
            steps {
                script {
                withCredentials([string(credentialsId: 'docker-password', variable: 'DOCKER_PASS')])
                sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS} ${DOCKER_REGISTRY}"
                sh "docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/${IMAGE_NAME}:latest"
                sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:latest"
                }
            }
        }
    }
    post {
        success {
            echo "Pushed sucessfully"
        }
        failure {
            echo "pipeline failed"
        }
    }
}

    