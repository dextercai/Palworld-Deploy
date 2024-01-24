build_x86_docker: # Build server with latest palworld server
	sudo docker build -f ./x86.dockerfile --tag palword_server .
