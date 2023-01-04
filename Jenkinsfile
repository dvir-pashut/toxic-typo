pipeline{
    agent any
    
    tools {
        maven "some name"
        jdk "java ledugma"
    }
    
    stages{
        stage("checkout"){
            steps{
                echo "========checking out (loking hella fine)========"
                deleteDir()
                checkout scm
                sh "mvn clean"
                sh "git checkout ${GIT_BRANCH}"
            }
        }

        stage("build"){
            when{
                anyOf {
                    branch "main"
                    branch "feature/*"
                }
            }
            steps{
                echo "========executing build========"
                withMaven {
                    sh "mvn verify"
                }
                sh "docker network create test-net || { echo alreadyexist; }"
                sh "docker run -d --network test-net --name tox-app toxictypoapp:1.0-SNAPSHOT"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========build executed successfully========"
                }
                failure{
                    echo "========build execution failed========"
                }
            }
        }
        stage("tests"){
            when{
                anyOf {
                    branch "main"
                    branch "feature/*"
                }
            }
            steps{
                echo "========executing tests========"
                sh """
                    cd src/test
                    docker build -t dvir-toxictypo .
                    docker run --network test-net --name tests-app dvir-toxictypo
                """
            }
            post{
                always{
                    echo "========tests are done========"
                    sh "docker rm -f tests-app tox-app"
                }
                success{
                    echo "========tests executed successfully========"
                }
                failure{
                    echo "========tests execution failed========"
                }
            }
        }
        stage("deploy"){
            when{
                anyOf {
                    branch "main"
                }
            }
            steps{
                echo "========executing deploy========"
                script{
                    docker.withRegistry("http://644435390668.dkr.ecr.eu-west-3.amazonaws.com", "ecr:eu-west-3:aws-develeap") {
                        docker.image("dvir-toxictypo").push()
                    
                    }
                }
            }
            post{
                always{
                    echo "========deploy are done========"
                }
                success{
                    echo "========deploy executed successfully========"
                }
                failure{
                    echo "========deploy execution failed========"
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