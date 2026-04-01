pipeline {
    agent any

    environment {
        FLUTTER_HOME = 'D:/flutter_windows_3.35.2-stable/flutter'
        ANDROID_HOME = 'D:/Android'
        PATH = "D:/flutter_windows_3.35.2-stable/flutter/bin;D:/Android/cmdline-tools/latest/bin;D:/Android/platform-tools;${env.PATH}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Flutter version') {
            steps {
                bat 'flutter --version'
            }
        }

        stage('Get dependencies') {
            steps {
                bat 'flutter pub get'
            }
        }

        stage('Run tests') {
            steps {
                bat 'flutter test'
            }
        }

        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts(
                    artifacts: 'build/app/outputs/flutter-apk/app-release.apk',
                    fingerprint: true
                )
            }
        }
    }

    post {
        success {
            echo 'APK built and archived successfully!'
        }
        failure {
            echo 'Build failed — check the console output above.'
        }
    }
}