pipeline {
    agent any
    stages{
        stage('Code'){
            steps {
                git(
                    url: 'https://github.com/khushixxxx/node.git', 
                    branch: 'main'
                )
            }
        }
        stage('Build and Test'){
            steps {
                    sh 'sudo docker build . -t khushikk/khushi-node:1.1.0' 
         }
        }
        stage('Login and Push Image'){
            steps {
                echo 'logging in to docker hub and pushing image..'
               withDockerRegistry([ credentialsId: "jenkins-github", url: "" ]) {
               sh "sudo docker push khushikk/khushi-node:1.1.0"
                }
            }
        }
        stage('Deploy'){
            steps {
                sh 'sudo docker compose down && sudo docker compose up -d'
            }
        }
    }
}
