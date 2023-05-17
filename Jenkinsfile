pipeline{
        agent {label ('rrr')}
        stages{
            stage ('build and package'){
                steps{
                    git url: 'https://github.com/hemachaitanya/learn-terraform-provision-eks-cluster.git',
                        branch: 'main'
               }
            }
            stage('cluster install by tf'){
                steps{
                    sh 'terraform --version'
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
