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
                sh "pwd"
                sh "ls"
                sh "docker run -d --network test-net --name tests-app -it -v \$(pwd)/src/test:/tests python:2.7.18 bash"
                sh "docker exec tests-app ls tests"
                sh "docker exec tests-app python tests/e2e_test.py tox-app:8080 tests/e2e 2"
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