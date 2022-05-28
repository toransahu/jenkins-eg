pipeline {
    agent { docker { image 'python:3.10.1-alpine' } }
    stages {
        stage('build') {
            steps {
                sh '''
                    who
                    ls -l /
                    python --version
                    pwd
                    ls
                    cd kedro-eg
                    python -m pip install --user virtualenv
                    python -m virtualenv .venv
                    . .venv/bin/activate
                    pip install --user -r src/requirements.txt
                    pytest
                '''
            }
        }
    }
}
