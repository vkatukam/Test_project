pipeline {
    agent any
        stages {
            stage ('Build & Package') {
                steps {
                   sh 'mvn clean install package'
                }
           }
            
           stage('Publish Artifacts to Nexus') {
               steps {
                   sh 'mvn deploy'
               }
           }
            stage('Deploy the application using K8s')
            {
                agent {
                    label "master" }
                steps {
                      
                    sh 'hostname'
                     kubectl apply -f kubenetes.yml
                }
            }
         
    stage('Results') {
        steps {
            archive 'gameoflife-web/target/gameoflife.war'
            junit 'gameoflife-web/target/surefire-reports/*.xml'
        }
    }
        }
}
