pipeline {
agent { label 'kubenode1' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dockerman2002/absi.repo:latest .'
        }
     }
    stage('Trivy Scan') {
      steps {
        script{
             // Install trivy
             // sh 'echo downloading Trivy ....'
             //   sh 'curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /tmp v0.18.3'
                sh 'curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /tmp v0.21.1'
             // sh 'echo Trivy downloaded'
             sh 'curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/html.tpl > /tmp/html.tpl'
             sh '/tmp/trivy image dockerman2002/absi.repo:latest'
             
             // Scan all vuln levels
                sh 'mkdir -p reports'
             // sh '/tmp/trivy filesystem --ignore-unfixed --vuln-type os,library --format template --template "/tmp/html.tpl" -o /tmp/nodejs-scan.html /usr/bin/nodejs'
                sh '/tmp/trivy image --format template --template "@/tmp/html.tpl" -o /tmp/report-javaweb-scan.html dockerman2002/absi.repo:latest'
                publishHTML target : [
                  allowMissing: true,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: 'reports',
                    reportFiles: 'nodjs-scan.html',
                    reportName: 'Trivy Scan',
                    reportTitles: 'Trivy Scan'
                ]
             }
          }
       }
   }
}
