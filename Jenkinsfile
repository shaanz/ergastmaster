pipeline {
    agent any
    stages {
//////////////////////////////////////////////////////
        stage('BUILD START') {
            steps {
                slackSend (color: '#00FF00', message: '######### SIR, I AM STARTING TO BUILD EVERYTHING NOW #########')
            }
        }
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
        stage('Deploying the app into the Kubernetes cluster') {
            steps {
                slackSend (color: '#00FF00', message: '--- Deploying the app into the Kubernetes cluster')
                //slackSend (color: '#00FF00', message: '- Deleting ergastapp ingress')
                //sh 'cd ergastapp; /usr/local/bin/kubectl delete ingress ergastapp-ingress'

                //slackSend (color: '#00FF00', message: '- Deleting ergastapp service')
                //sh 'cd ergastapp; /usr/local/bin/kubectl delete service ergastapp-service'

                slackSend (color: '#00FF00', message: '- Deleting ergast deployment')
                sh 'cd ergastapp; /usr/local/bin/kubectl delete deployment ergastapp-deployment'

                slackSend (color: '#00FF00', message: '- Creating ergast deployment')
                sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-deploy.yaml'

                //slackSend (color: '#00FF00', message: '- Creating ergast service')
                //sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-svc.yaml'

                //slackSend (color: '#00FF00', message: '- Creating ergast ingress')
                //sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-ingress.yaml'
                slackSend (color: '#00FF00', message: '--- Done with the app deployment')
            }
        }
////////////////////////////////////////////////////////
        stage('Delete existing database deployment') {
            steps {
                slackSend (color: '#00FF00', message: '--- Setting up the database')
                slackSend (color: '#00FF00', message: '- Delete existing database deployment')
                sh "initdb/clean_mysql.sh"
            }
        }
////////////////////////////////////////////////////////
        stage('Create database deployment') {
            steps {
                slackSend (color: '#00FF00', message: '- Create database deployment')
                sh "initdb/create_mysql.sh"
                slackSend (color: '#00FF00', message: '--- Done with the database deployment')
           }
        }
////////////////////////////////////////////////////////
        stage('Import data into the new database') {
            steps {
                slackSend (color: '#00FF00', message: '--- Import data into the new database')
                sh "initdb/importdb.sh"
                slackSend (color: '#00FF00', message: '--- Import finished ')
            }
        }
////////////////////////////////////////////////////////        
        stage('TEST') {
            steps {
                slackSend (color: '#00FF00', message: '#### I am doing some tests')

                slackSend (color: '#00FF00', message: 'Testing if the app can connect to the db')
                sh './test/testdbconnect.sh'
                slackSend (color: '#00FF00', message: 'App and DB connection seem to be OK')

                slackSend (color: '#00FF00', message: 'curl -i -s http://ergastapp.bienlab.com/api/f1.json | grep 200')
                sh './test/testapif1.sh'
		slackSend (color: '#00FF00', message: 'I got the 200 response, it works')

                slackSend (color: '#00FF00', message: 'docker run --name zaptest -t owasp/zap2docker-stable zap-baseline.py -t http://ergastapp.bienlab.com/api/f1')
                sh './test/zaptest.sh'
                slackSend (color: '#00FF00', message: 'Basic security tests by OWASP ZAP were done without any fail case')

                slackSend (color: '#00FF00', message: '#### Done with testing')
            }
        }
///////////////////////////////////////////////////////
        stage('BUILD END') {
            steps {
		slackSend (color: '#00FF00', message: 'You can test by "curl http://ergastapi.bienlab.com/api/f1/drivers/alonso"')
                slackSend (color: '#00FF00', message: '######### SIR, I AM DONE #########')
            }
        }
    }
/////////////// POST ///////////////
    post {
       // triggered when red sign
       failure {
           slackSend (color: '#FF9FA1', message: 'The build was FAIL, sir! Go to Jenkins portal to check logs')
       }
    }
}

