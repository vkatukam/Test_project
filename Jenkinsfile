pipeline {
    agent any
        stages {
            stage ('Build & Package') {
                   sh 'mvn clean install package'
           }
            
           stage('Publish Artifacts to Nexus') {
                   sh 'mvn deploy'
           }
         
    stage('Results'){
        archive 'gameoflife-web/target/gameoflife.war'
        junit 'gameoflife-web/target/surefire-reports/*.xml'
    }
        }
}
