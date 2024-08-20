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

        stage('terraform formatting'){
            steps{
                dir('EKS'){
                    sh 'terraform fmt'
                }
            }
        }

        stage('terraform validating'){
            steps{
                dir('EKS'){
                    sh 'terraform validate'
                }
            }
        }

        stage('terraform planning'){
            steps{
                dir('EKS'){
                    sh 'terraform plan'
                }
                input(message: "Are you sure to proceed?", ok: "Proceed")
            }
        }

        stage('terraform applying and creating EKS'){
            steps{
                dir('EKS'){
                    sh 'terraform $action --auto-approve'
                }
            }
        }

        stage('Deploying Nginx Application') {
            steps{
                script{
                    dir('EKS/configurationfiles') {
                        sh 'aws eks update-kubeconfig --name my-eks-cluster'
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f service.yaml'
                    }
                }
            }
        }

    }
}
