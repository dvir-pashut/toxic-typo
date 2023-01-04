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
            steps{
                echo "========executing tests========"
                sh """
                    docker ps 
                    cd src/test
                    docker build -t test_app .
                    docker run --network test-net --name tests-app test_app
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
            steps{
                echo "========executing tests========"
                sh """
                    docker ps 
                    cd src/test
                    docker build -t test_app .
                    docker run --network test-net --name tests-app test_app
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