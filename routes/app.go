// Package routes APP
package routes

import (
	"fasthttp-sample/controller"

	"github.com/valyala/fasthttp"
)

// Route ルーティング
func Route(ctx *fasthttp.RequestCtx) {
	ctx.Response.Header.Set("Content-Type", "application/json")

	v := "/v1"
	switch string(ctx.Path()) {
	case v + "/item":
		controller.ItemIndex(ctx)
	default:
		ctx.Error("not found", fasthttp.StatusNotFound)
	}
}
