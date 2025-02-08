**# jenkins Final exam**
**## steps**
1. login to aws
2. create a ec2 instance
	- make a aws userdata to 
		- install jenkins 
		- install docker
		- give jenkins user permission to docker group
		- restart jenkins and docker 

3. Write a Jenkinsfile for a pipeline that accepts parameters (`BUILD_VERSION`) , print them in the logs and use this parameter as docker image tag
4. jenkins pipeline flow should be like this
	-	trigger pipeline build manually
	-	pipeline starts and pulls a demo code from yout github
	-	docker build
	-	docker push to docker hub
5. all credentials should be used securely(not hardcoded)

**Repository must contain:**
File named userdata.sh, should contain aws user data
Jenkinsfile

**OUTPUT: https://hub.docker.com/repository/docker/shams43/jenkins/general**
