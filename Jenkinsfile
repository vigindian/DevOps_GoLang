node {
    def root = tool name: 'Go1.12', type: 'go'
    // workspace creation
    //ws("${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}/src/github.com/grugrut/golang-ci-jenkins-pipeline") {
    ws("${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}/") {
        withEnv(["GOROOT=${root}", "GOPATH=${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}/", "PATH+GO=${root}/bin"]) {
            env.PATH="${GOPATH}/bin:$PATH"
            
            stage ('Checkout') {
            	git url: 'https://github.com/vigindian/DevOps_GoLang.git'
	    }
        
            stage('preTest'){
	    	echo 'Pulling Dependencies'

            	sh 'go version'
            	sh 'go get -u github.com/golang/dep/cmd/dep'
		sh 'go get -u github.com/golang/lint/golint'
		sh 'go get github.com/tebeka/go2xunit'
            	sh 'dep init'
		sh 'dep ensure'
	    }            
            stage ('Test'){
		echo 'Vetting'
            	sh 'go vet'
		echo 'Linting'
		sh 'golint'
		echo 'Testing'
            	sh 'go test -race -cover'
            } 

            stage ('Build'){
		echo 'Building'
            	// sh 'go build .'
		sh 'go build -ldflags="-w -s" -a -installsuffix cgo -o /go/bin/health .'
	    }
            
            stage ('Publish'){
            // Do nothing.
	   }
        }
    }
}
