pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script{
                  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/vank1999/terraform-jenkins-eks.git']])  
                }
            }
        }

        stage('terraform initialising'){
            steps{
                dir('EKS'){
                    sh 'terraform init'
                }
            }
        }
    }
}
