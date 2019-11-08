node {
    stage('SCM') {
        git 'https://github.com/vkatukam/Test_project.git'
    }
    
    stage('Build & Package') {
                   sh 'mvn clean package'
           }
    
    stage("Quality Gate") {
        timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
    }
    
    stage('Results'){
        archive 'gameoflife-web/target/gameoflife.war'
        junit 'gameoflife-web/target/surefire-reports/*.xml'
    }
}
