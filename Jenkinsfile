pipeline {
    agent any
    stages {
        notifyBuild('Starting the build')
        stage('Delete existing database deployment') {
            steps {
                echo 'Delete existing database deployment'
       //         sh "initdb/clean_mysql.sh"
            }
        }
        stage('Create database deployment') {
            steps {
                echo 'Delete existing database deployment'
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
def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}
