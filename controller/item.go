// Package controller Item
package controller

import (
	"encoding/json"
	"fmt"

	"github.com/valyala/fasthttp"
)

// ResponseItemIndex Item Response
type ResponseItemIndex struct {
	Message string
}

// ItemIndex GET
func ItemIndex(ctx *fasthttp.RequestCtx) {
	ir := ResponseItemIndex{"hello"}
	res, err := json.Marshal(ir)
	if err != nil {
		fmt.Println(err)
	}
	ctx.SetStatusCode(fasthttp.StatusOK)
	fmt.Fprint(ctx, string(res))
}
