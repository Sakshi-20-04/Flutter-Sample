pipeline {
    agent any

    environment {
        FLUTTER_HOME = 'D:/Program_FilesX86/flutter_windows_3.38.7-stable/flutter'
        ANDROID_HOME = 'C:/Users/Sakshi/AppData/Local/Android/Sdk' 
        PATH = "D:/Program_FilesX86/flutter_windows_3.38.7-stable/flutter/bin;D:/Android/cmdline-tools/latest/bin;D:/Android/platform-tools;${env.PATH}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                
                checkout scm
            }
        }

        stage('Flutter Doctor') {
            steps {
                
                bat 'flutter doctor'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'flutter pub get'
            }
        }

        stage('Build Release APK') {
            steps {
                
                bat 'flutter build apk --release'
            }
        }

        stage('Save APK') {
            steps {
                
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Success! Your Flutter APK is ready now.'
        }
        failure {
            echo 'Build failed. Look at the Console Output to see the error.'
        }
    }
}