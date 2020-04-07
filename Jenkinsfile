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
            
        }
}
            
        
