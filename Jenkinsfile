pipeline {
    agent any
    stages {
////////////////////////////////////////////////////////
        stage('Building docker image for the app') {
            steps {
              withDockerRegistry([ credentialsId: "biennt_at_dockerhub", url: "" ]) {
                slackSend (color: '#00FF00', message: 'Building docker image for the ergast app')
                sh 'cd ergastapp; docker build -t biennt/ergastapp .'
                slackSend (color: '#00FF00', message: 'Pushing docker image to the registry')
                sh 'docker push biennt/ergastapp'
                sh 'docker rmi biennt/ergastapp'
                sh 'docker rmi biennt/ergast-f1-api_01'
              }
            }
        }        
////////////////////////////////////////////////////////
        stage('Delete existing database deployment') {
            steps {
                echo 'Delete existing database deployment'
                slackSend (color: '#00FF00', message: 'Delete existing database deployment')
              //  sh "initdb/clean_mysql.sh"
            }
        }
////////////////////////////////////////////////////////
        stage('Create database deployment') {
            steps {
                echo 'Create database deployment'
                slackSend (color: '#00FF00', message: 'Create database deployment')
                //sh "initdb/create_mysql.sh"
            }
        }
////////////////////////////////////////////////////////        
        //stage('Check importdb log') {
        //    steps {
        //        sh '/usr/local/bin/kubectl logs importdb'
        //    }
        //}
////////////////////////////////////////////////////////
        stage('Release in to production') {
            steps {
                script {
                    slackSend (color: '#00FF00', message: 'Ready for production in 10 minutes. Please go to Jenkins console to approve or cancel')
               //     timeout(time: 10, unit: 'MINUTES') {
                //        input("Deploy to production?")
                 //   }
                }
            }
        }
////////////////////////////////////////////////////////
    }
}

