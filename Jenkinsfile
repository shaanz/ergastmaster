pipeline {
    agent any
    stages {
        stage('Delete existing database deployment') {
            steps {
                echo 'Delete existing database deployment'
                slackSend (color: '#00FF00', message: 'Delete existing database deployment')
       //         sh "initdb/clean_mysql.sh"
            }
        }
        stage('Create database deployment') {
            steps {
                echo 'Create database deployment'
                slackSend (color: '#00FF00', message: 'Create database deployment')
       //         sh "initdb/create_mysql.sh"
            }
        }
        //stage('Check importdb log') {
        //    steps {
        //        sh '/usr/local/bin/kubectl logs importdb'
        //    }
        //}
        stage('Stage3') {
            steps {
                echo 'Stage3....ok?'
            }
        }
    }
}

