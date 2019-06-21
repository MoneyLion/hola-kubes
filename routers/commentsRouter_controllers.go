package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

    beego.GlobalControllerRouter["hola-kubes/controllers:ApiController"] = append(beego.GlobalControllerRouter["hola-kubes/controllers:ApiController"],
        beego.ControllerComments{
            Method: "Home",
            Router: `/`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

    beego.GlobalControllerRouter["hola-kubes/controllers:ApiController"] = append(beego.GlobalControllerRouter["hola-kubes/controllers:ApiController"],
        beego.ControllerComments{
            Method: "Check",
            Router: `/health`,
            AllowHTTPMethods: []string{"get"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}
