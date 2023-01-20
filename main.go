// Package main fasthttpの簡単なAPI
package main

import (
	"fasthttp-sample/routes"
	"fmt"

	"github.com/valyala/fasthttp"
)

// API起動
func serve(url string) {
	if err := fasthttp.ListenAndServe(url, routes.Route); err != nil {
		fmt.Println("fail Serve:", err.Error())
	}
}

// メイン
func main() {
	const uri = "0.0.0.0"
	const port = 8080
	url := fmt.Sprintf("%s:%d", uri, port)
	serve(url)
}
