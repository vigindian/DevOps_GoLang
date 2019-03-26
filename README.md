# GoLang JSON API with Travis CI Pipeline

A GoLang application that prints an API response in JSON format. <br>

When the code is pushed to Github, TravisCI automatically runs a set of pre-defined test cases and build.
<br><br>
<h2>1. Scripts</h2>
<h3>1.1. GoLang API Script</h3>
- The GoLang script uses “github.com/gorilla/mux” to create the endpoint “/healthcheck” for the API.<br>
- The SHA is obtained with command “git rev-parse HEAD” command.<br>
- The “json” module is used to handle the API output.<br>
<h4>1.1.1. Sample Response</h4>
[{"version":"1.0",
"description":"DevOps Golang API",
"lastcommitsha":"\<lastcommitsha\>"}]
<br>
<h3>1.2. Code Quality Check Script</h3>
- The script checks formatting with “gofmt -l” command.<br>
- The security issues are checked with “gosec” command.<br>
<h3>1.3. Build Script</h3>
A build script has been developed for easy maintenance of the GoLang API application.
<br><br>
<h2>2. CI Pipeline with Travis CI</h2>
Travis YAML file .travis.yml contains the steps to be taken. TravisCI looks for this file and executes steps as mentioned in the yml file.
<br><br>
<h2>3. Containerised App</h2>
The golang application runs in a container and this is facilitated through Docker.
<br><br>
<h2>4. Test Suite</h2>
1. go vet
2. go test -v -race -cover: 
3. .travis.quality.sh: script internally checks formatting with "gofmt -l" and security issues with "gosec".
