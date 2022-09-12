pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
				dir(''){
					#sh 'docker compose down'
					sh 'docker compose build'
				}
			} 
		}
    stage('Test') {
      			steps {
				dir(''){
					sh 'docker compose up -d' 
					sh 'sleep 5'
					sh 'curl -I http://ec2-18-206-174-55.compute-1.amazonaws.com:9090/student/3'
			}
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker compose push mihmood/backend-python:latest'
					} 
				}
			} 
		}  
    stage('Post') {
    			success {
      				slackSend color: "good", message: "Pipeline passed ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
    				}
  		}
 	}
}
