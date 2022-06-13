pipeline {
    agent { 
        docker { 
            image 'python:3.8.12-slim-buster'
            args '-u root:root' 
        } 
    }
    stages {
        stage('build') {
            steps {
                sh '''
                    ls -l /
                    su -
                    ls -l /
                    python --version
                    pwd
                    ls
                    cd kedro-eg
                    python -m pip install --user virtualenv
                    python -m virtualenv .venv
                    . .venv/bin/activate
                    python -m pip install -r src/requirements.txt
                    python -m pytest
                '''
            }
        }
    }
}
