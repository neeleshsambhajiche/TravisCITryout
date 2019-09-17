#!/bin/bash -e

# First build the docker image from the dockerfile
sudo docker build -t travis ./

dockerHostname="travis-docker"

	mainJar=`ls Travis*[^tests].jar`
    testJar=`ls Travis*-tests.jar`
    echo "** Using [$mainJar] and [$testJar] for running tests"

	# Now create a docker container by running the image
	# -h: Sets the hostname
	# --rm: Removes the container after exit
	# -it: Keep STDIN open even if not attached and allocate a pseudo-tty
	# --name: Gives a name to the container
	# Note: name of the image has to be after --entrypoint parameter.
	# Note: Also echoing the command
	set -x
	sudo docker run -h $dockerHostname \
			-p 18080:18080 \
    		--rm \
    		-it \
    		--name traviscontainer \
    		--entrypoint /Travis/run-travis-tests.sh \
    		travis \
    		$testJar $@
