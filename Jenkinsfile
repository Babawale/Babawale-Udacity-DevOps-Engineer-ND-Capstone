pipeline {
    environment {
        registry = "babawale/devops-nd-capstone-project"
        registryCredential = 'dockerhub'
        appImage = ''
    }
    
    agent any
    stages {
		    stage('Lint HTML') {
			    steps {
				    sh 'tidy -q -e *.html'
			    }
		    }
		    
		    stage('Lint Dockerfile') {
			    steps {
				    sh 'hadolint Dockerfile'
			    }
		    }
        
    
            stage('Building image') {
                steps {
                script {
                    appImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }
            
        
            stage('Push Image to Dockerhub') {
                steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    appImage.push()
                    appImage.push('latest')
                        }
                    }
                }
            }
            

            stage('Set up EKS Cluster'){
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'ansible-playbook -i inventory eks-cluster.yml'
                    }
                }
            }
            stage('Deploy Latest Image from hub to Cluster'){
                steps {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'kubectl apply -f deployment.yml'
					}
                }
            }
        
        }
}
