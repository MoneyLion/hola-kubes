package main

import (
	_ "hola-kubes/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

func main() {

	logs.Async(1e3)
	logs.SetLogger(logs.AdapterFile, `{"filename":"api.log"}`)
	logs.EnableFuncCallDepth(true)
	logs.SetLogFuncCallDepth(3)

	if len(beego.BConfig.RunMode) == 0 {
		beego.BConfig.RunMode = "development"
	}

	logs.Info("Beego Run Mode...", beego.BConfig.RunMode)
	beego.Run()
}
