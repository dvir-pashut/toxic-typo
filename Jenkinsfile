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
                sh "docker run -d --network test-net --name tox-app -p8083:8080toxictypoapp:1.0-SNAPSHOT"
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("tests"){
            steps{
                echo "========executing A========"
                sh "docker run -d --network test-net -it --name tests-app -v \$(pwd)/src/test/:/tests python:2.7.18 bash"
                sh "docker exec -it tests-app pip install -r /tests/requirments.txt"
                sh "docker exec -it tests-app python tests/e2e_test.py tox-app:8080 tests/e2e 2"
                sh "docker rm -f tox-app tests-app"
            }
            post{
                always{
                    echo "========tests are done========"
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