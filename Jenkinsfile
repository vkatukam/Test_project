pipeline {
    agent any 
        stages {
            stage ('Build & Package') {
                steps {
                    sh "mvn clean install package"
                }
                post {
                    always {
                        jiraSendBuildInfo branch: 'master', site: 'katukamvinay.atlassian.net'
                    }
                }
                    
            }
            stage('Publish Artifacts to Nexus') {
               steps {
                   sh "mvn deploy"
               }
           }
            
        }
}
            
        
