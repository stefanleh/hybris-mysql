node {

   def plansee_proxy_host = '001sb014.plansee.at'
   def plansee_proxy_port = '3142'

   def customImage

   stage('Checkout') {
        checkout scm

   stage('Build Image') {
        customImage = docker.build("jenkins-mysql-runtime:${env.BUILD_ID}","--build-arg http_proxy=http://$plansee_proxy_host:$plansee_proxy_port --build-arg https_proxy=http://$plansee_proxy_host:$plansee_proxy_port .")
   }

   stage('Tag image to latest') {
        customImage.tag("latest")
   }

}
