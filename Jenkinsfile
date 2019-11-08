node {
    stage('SCM') {
        git 'https://github.com/vkatukam/Test_project.git'
    }
    
    stage('Build & Package') {
                   sh 'mvn clean package'
           }
         
    stage('Results'){
        archive 'gameoflife-web/target/gameoflife.war'
        junit 'gameoflife-web/target/surefire-reports/*.xml'
    }
}
