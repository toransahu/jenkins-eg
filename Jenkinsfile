pipeline {
    agent { docker { image 'python:3.10.1-alpine' } }
    stages {
        stage('build') {
            steps {
                sh '''
                    python --version
                    pwd
                    ls
                    cd kedro-eg
                    python -m pip install venv
                    python -m venv .venv
                    . .venv/bin/activate
                    pip install -r src/requirements.txt
                    pytest
                '''
            }
        }
    }
}
