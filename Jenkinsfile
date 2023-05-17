pipeline{
        agent {label ('rrr')}
        stages{
            stage ('build and package'){
                steps{
                    git url: 'https://github.com/hemachaitanya/dockernotes.git',
                        branch: 'main'
               }
            }
            stage('cluster install by tf'){
                steps{
                    sh 'terraform init'
                    sh 'terraform -auto-approve'
                }
            }
        }
    }
