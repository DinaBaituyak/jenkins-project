pipeline {
    agent any

    options {
        skipDefaultCheckout()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        ARTIFACT_NAME = "myapp-${env.BUILD_NUMBER}.jar"
        MAVEN_HOME = "/opt/homebrew/Cellar/maven/3.9.11/libexec"
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Checked out branch: ${env.BRANCH_NAME}"
            }
        }

        stage('Build') {
            steps {
                sh "mvn -v"  // sanity check Maven version
                sh "mvn clean package -DskipTests"
            }
        }

        stage('Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                echo "Artifact archived: ${env.ARTIFACT_NAME}"
            }
        }

        stage('Deploy (Staging)') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying ${env.ARTIFACT_NAME} to staging environment..."
                // Example deployment command
                // sh 'docker build -t myrepo/myapp:${BUILD_NUMBER} .'
                // sh 'docker push myrepo/myapp:${BUILD_NUMBER}'
            }
        }
    }

    post {
        success {
            echo "✅ Build #${env.BUILD_NUMBER} succeeded!"
        }
        failure {
            echo "❌ Build #${env.BUILD_NUMBER} failed!"
        }
    }
}
