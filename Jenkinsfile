pipeline {
    agent any
    stages {
        stage('Delete existing database deployment') {
            steps {
                echo 'Delete existing database deployment'
                sh "initdb/clean_mysql.sh"
            }
        }
        stage('Stage2') {
            steps {
                echo 'Stage2..'
            }
        }
        stage('Stage3') {
            steps {
                echo 'Stage3....ok?'
            }
        }
    }
}
