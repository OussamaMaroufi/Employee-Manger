pipeline{
    agent any
    tools {
        maven 'maven'
    }
    stages{

        stage("sonar_quality_check"){
            steps{
                script{
                    sh "mvn --version"
                }
            }
        }

        stage("Build project"){
            steps {
                script{
                    echo 'Hello, Maven'
                }
            }
        }

        stage("Upload jar to Nexus"){
            steps{
                script{
                    echo "Upload Jar to nexus"
                }
            }
        }

        stage('Build docker image'){
            steps{
                script{
                    echo "Build docker Image"
                }
            }
        }

        stage('Push image to Hub'){
            steps{
                script{
                    echo "Push to docker hub"
                }
            }
        }

        stage("Deploy The Application"){
            steps{
                script{
                    echo "App deployed successfully"
                }
            }
        }
    }

    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
