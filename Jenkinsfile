pipeline {
    agent any
    stages {
////////////////////////////////////////////////////////
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
                slackSend (color: '#00FF00', message: '- Deleting ergastapp ingress')
                sh 'cd ergastapp; /usr/local/bin/kubectl delete ingress ergastapp-ingress'

                slackSend (color: '#00FF00', message: '- Deleting ergastapp service')
                sh 'cd ergastapp; /usr/local/bin/kubectl delete service ergastapp-service'

                slackSend (color: '#00FF00', message: '- Deleting ergast deployment')
                sh 'cd ergastapp; /usr/local/bin/kubectl delete deployment ergastapp-deployment'

                slackSend (color: '#00FF00', message: '- Creating ergast deployment')
                sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-deploy.yaml'

                slackSend (color: '#00FF00', message: '- Creating ergast service')
                sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-svc.yaml'

                slackSend (color: '#00FF00', message: '- Creating ergast ingress')
                sh 'cd ergastapp; /usr/local/bin/kubectl create -f ergastapp-ingress.yaml'
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
        stage('TEST') {
            steps {
                slackSend (color: '#00FF00', message: '--- I am doing some tests')
                slackSend (color: '#00FF00', message: 'curl -i -s http://ergastapp.bienlab.com/api/f1.json | grep 200')
                sh './test/testapif1.sh'
                slackSend (color: '#00FF00', message: '--- Done with the database deployment')
            }
        }
////////////////////////////////////////////////////////
        stage('BUILD END') {
            steps {
		slackSend (color: '#00FF00', message: 'You can test by "curl http://ergastapp.bienlab.com/api/f1"')
                slackSend (color: '#00FF00', message: '######### SIR, I AM DONE #########')
            }
        }
    }
}

