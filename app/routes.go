package main

import (
	"github.com/go-humble/router"
)

var r *router.Router

func initRouter() {
	r = router.New()
	r.ShouldInterceptLinks = true
	r.HandleFunc("/", defaultRoute)
	r.Start()
}

func defaultRoute(context *router.Context) {
	print("default route")
}
