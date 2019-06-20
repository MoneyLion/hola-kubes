currentDate := $(shell date +%Y.%m.%d-%H)

push-node-development:
	helm upgrade "hola-kubes" hola-kubes --install --force --reset-values --namespace development --set beegoRunmode=development --set deployment[0].image.tag=latest --set deployment[0].image.version=v1 
