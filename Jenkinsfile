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
                    sh 'aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)'
                }
            }
            stage('docker image'){
                steps{
                    sh 'docker image build -t spc:1.0 .'
                    sh 'docker tag spc:1.0 hema789/hello:sring-3.0'
                    sh 'docker push hema789/hello:sring-3.0'
                }
            }
            stage('continuous deployment'){
                steps{
                    sh 'cd ../..'
                    sh 'kubectl apply -f spc-service.yaml'
                    sh 'kubectl apply -f spc.yaml'
                    sh 'kubectl get po'
                    sh 'kubectl get svc'
                }
               
            }
        }
    }
