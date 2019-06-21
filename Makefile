currentDate := $(shell date +%Y.%m.%d-%H)

docker-build:
	docker build -t broker-dealer/hola-kubes .

docker-tag:
	docker tag broker-dealer/hola-kubes:latest 460142493547.dkr.ecr.us-east-1.amazonaws.com/broker-dealer/hola-kubes:latest

docker-push:
	docker push 460142493547.dkr.ecr.us-east-1.amazonaws.com/broker-dealer/hola-kubes:latest

docker-deploy: docker-build docker-tag docker-push

push-node-development:
	cd infra/ && helm upgrade "hola-kubes" hola-kubes --install --force --reset-values --namespace development --set beegoRunmode=development --debug --set deployment[0].image.tag=v1 --set deployment[0].image.version=v1 

remove-node-development:
	cd infra/ && helm delete hola-kubes --purge