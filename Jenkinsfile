node {

   def customImage

   stage('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'd38b3aaa-e003-4774-8742-13139ad5b6f1', url: 'https://git.unic.com/scm/plansee/mysql-jenkins-docker-runtime.git']]])
   }

   stage('Build Image') {
        customImage = docker.build("jenkins-mysql-runtime:${env.BUILD_ID}","--build-arg http_proxy=http://001sb014.plansee.at:3142 --build-arg https_proxy=http://001sb014.plansee.at:3142 .")
   }

   stage('Tag image to latest') {
        customImage.tag("latest")
   }

}
