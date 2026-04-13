pipeline {
    agent any

    environment {
        // These paths match the Linux/EC2 setup we just finished 
        FLUTTER_HOME = "/opt/flutter"
        ANDROID_HOME = "/opt/android-sdk"
        
        // Merging SDK paths into the system PATH [cite: 48, 49]
        // Note: Use double quotes for string interpolation in Groovy
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${env.PATH}"
    }

    stages {
        stage('Environment Check') {
            steps {
                // Auto-accepting Android licenses is vital for headless CI [cite: 53]
                sh 'yes | flutter doctor --android-licenses || true' 
                sh "flutter config --android-sdk $ANDROID_HOME"
                sh 'flutter doctor' 
            }
        }

        stage('Source Checkout') {
            steps {
                // Replace the URL with your actual GitHub repository link
                git branch: 'main', 
                    url: 'https://github.com/Sakshi-20-04/Flutter-Sample.git'
            }
        }

        stage('Dependency Resolution') {
            steps {
                // 'sh' is used for Linux commands instead of 'bat' [cite: 67]
                sh 'flutter pub get' 
            }
        }

        stage('Production Build') {
            steps {
                // Builds the release version of your Android APK [cite: 72]
                sh 'flutter build apk --release'
            }
        }

        stage('Save APK') {
            steps {
                // This makes the APK downloadable directly from the Jenkins dashboard [cite: 77]
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
        always {
            echo 'Build Cycle Finished.'
        }
    }
}