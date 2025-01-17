pipeline {
    agent { label "worker-node"}
    parameters {
        choice(name: 'CHOICE', choices: ['net-tools', 'curl', 'unzip'], description: 'Pick a tool to install')
    }

    stages {
        stage ("hello") {
            steps {
                echo "hello form docker"
            }
        }
    }
}