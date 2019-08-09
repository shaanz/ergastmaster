pipeline {
    agent any
/////////////////////////////////////////////////////////
    stages {
        timeout(time: 60, unit: 'SECONDS') {
          script {
            def INPUT_PARAMS = input message: 'Do you want to delete the existing database', ok: 'Next',
              parameters: [
               choice(name: 'DBDELETE', choices: ['yes','no'].join('\n'), description: 'Please select the Environment')]
             env.DBDELETE = INPUT_PARAMS.DBDELETE
          }
        }
    }
/////////////////////////////////////////////////////////   
    stages {
////////////////////////////////////////////////////////
        stage('Delete existing database deployment') {
            steps {
                echo 'Delete existing database deployment'
                input("Sure to delete?")
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
                    timeout(time: 10, unit: 'MINUTES') {
                        input("Deploy to production?")
                    }
                }
            }
        }
////////////////////////////////////////////////////////
    }
}

