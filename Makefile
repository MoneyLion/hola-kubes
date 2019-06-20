currentDate := $(shell date +%Y.%m.%d-%H)

push-node-development:
	cd infra/ && helm upgrade "hola-kubes" hola-kubes --install --force --reset-values --namespace development --set beegoRunmode=development --set deployment[0].image.tag=latest --set deployment[0].image.version=v1 

remove-node-development:
	cd infra/ && helm delete hola-kubes --purge --namespace development