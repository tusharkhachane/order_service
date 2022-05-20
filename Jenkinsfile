pipeline {
    agent any
 stages {
        stage('Clone Repository') {
            steps {
		git 'https://github.com/tusharkhachane/order_service.git'
            }
        }
        stage('verifying tools') {
            steps {
                sh ''' #! /bin/bash
                java -version
                mvn --version
                '''
            }
        }
        stage('Build') {
            steps {
                sh ''' #! /bin/bash
                #Including test cases 
                #mvn clean install
                #mvn clean package
                
                #Ignoring test cases 
                
                mvn install -DskipTests
                
                '''
            }
        }
        stage ('Test') {
            steps {
                sh ''' #! /bin/bash
                mvn test
                '''
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
	 stage ('Artifact') {
           steps {
                sh ''' #!/bin/bash
		cd /var/lib/jenkins/workspace/maven
		zip -r order_service.zip target/order-service.jar
                #tar -zcvf order_service-${currentBuild.number}.tar.gz order_service/
		aws s3 cp order_service.zip  s3://java-maven/
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh ''' #! /bin/bash    
				#to deploy on aws 
                
                
                aws deploy create-deployment --application-name Maven_application --deployment-group-name maven_application --deployment-config-name CodeDeployDefault.AllAtOnce --github-location repository=tusharkhachane/order_service,commitId=${GIT_COMMIT}

            
                echo Deployment Successfull
                '''
            }
        }
    }
    post {
        always {
            echo 'Stage is success'
        }
    }
}
