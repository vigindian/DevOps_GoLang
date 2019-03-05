#!/bin/sh
######################################
# Golang API App Build Script
# Vignesh Narasimhulu
# 20190305
######################################

sha1=`git rev-parse HEAD`
Name="GoLang API Application"

###########
# FUNCTION
###########
#help function
help() {
	echo "\nName\nBuild Script to manage the $Name\n\n"
	echo "Usage: $0 [action]\n\n"
	echo "Description:\nbuild: Build the image\nls: See the size of the image\nrun: Run the image\nrebuild: Rebuild the image\nhelp: Print this help page and exit\n"
	exit 1
}

#get sha1 value from git
sha() {
	if [ ! -s .sha1 ];then
        	echo "LSHA=$sha1" >> .env
        	echo "$sha1" > .sha1
	else
		cat .env| grep -v "LSHA=" > .env.1
		echo "LSHA=$sha1" >> .env.1
		mv -f .env.1 .env
	fi
}

#########
# MAIN
#########
#valid number of arguments
if [ "$#" -ne 1 ]; then
	help
fi

arg=$1

case $arg in
	build)
		echo "Building the image"
		sha	
		docker-compose build
	;;
	rebuild)
		echo "Rebuilding the image and run the container"
		sha
		docker-compose up --build -d
	;;
	ls)
		echo "Verifying the size of the image"
		docker image ls gojapi
	;;
	run)
		echo "Running the golang api app in a container"
		sha
		docker-compose up -d
	;;
	help)
		help
	;;
	*)
		echo "Invalid Option"	
		help
	;;
esac
