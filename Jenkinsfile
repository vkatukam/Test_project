pipeline {
    agent any 
        stages {
            stage ('Build & Package') {
                steps{
                    sh "mvn clean install package"
                }
            }
            stage('Publish Artifacts to Nexus') {
               steps {
                   sh "mvn deploy"
               }
           }
            stage('Deploy the application using K8s'){
                steps {
                    sh " kubectl apply -f kubenetes.yml"
                }
            }
        }
}
            
        
