currentDate := $(shell date +%Y.%m.%d-%H)
timestamp := $(shell date +T%Y%m%d%H%M%S)

docker-deploy: 
	
	echo "Build Image ${timestamp}"
	docker build -t broker-dealer/hola-kubes .

	echo "Tag Image"
	docker tag broker-dealer/hola-kubes:latest 460142493547.dkr.ecr.us-east-1.amazonaws.com/broker-dealer/hola-kubes:${timestamp}

	echo "Push Image"
	docker push 460142493547.dkr.ecr.us-east-1.amazonaws.com/broker-dealer/hola-kubes:${timestamp}

	cd infra/ && helm upgrade "hola-kubes" hola-kubes --install --force --reset-values --namespace development --set beegoRunmode=development --debug --set image.tag="${timestamp}"
	
push-node-development:
	cd infra/ && helm upgrade "hola-kubes" hola-kubes --install --force --reset-values --namespace development --set beegoRunmode=development --debug --set image.tag=latest --set image.version=v1 

remove-node-development:
	cd infra/ && helm delete hola-kubes --purge