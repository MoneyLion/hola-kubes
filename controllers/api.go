package controllers

import (
	"github.com/astaxie/beego"
)

type ApiController struct {
	beego.Controller
}

// @Title Get Health
// @Description Gets the general health of the system.
// @Success 200 string "ok"
// @Failure 500  error
// @router /health [get]
func (h *ApiController) Check() {
	var err error
	defer func() {
		if err != nil {
			h.Data["error"] = err
		}
		h.ServeJSON(true)
	}()

	h.Data["json"] = map[string]interface{}{
		"check": "ok",
	}
	return
}

// @Title Get Health
// @Description Gets the general health of the system.
// @Success 200 string "ok"
// @Failure 500  error
// @router / [get]
func (h *ApiController) Home() {
	var err error
	defer func() {
		if err != nil {
			h.Data["error"] = err
		}
		h.ServeJSON(true)
	}()

	h.Data["json"] = map[string]interface{}{
		"message": "hello",
	}
	return
}
