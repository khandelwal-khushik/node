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
                    sh 'docker build . -t trainwithshubham/node-todo-app-cicd:latest'   
            }
        }
        stage('Login and Push Image'){
            steps {
                echo 'logging in to docker hub and pushing image..'
               withDockerRegistry([ credentialsId: "6544de7e-17a4-4576-9b9b-e86bc1e4f903", url: "" ]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh "docker push trainwithshubham/node-todo-app-cicd:latest"
                }
            }
        }
        stage('Deploy'){
            steps {
                sh 'docker-compose down && docker-compose up -d'
            }
        }
    }
}
