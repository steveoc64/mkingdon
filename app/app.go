package main

import "honnef.co/go/js/dom"

func main() {

	initRouter()

	// setup some vars
	w := dom.GetWindow()
	doc := w.Document()
	print(doc)

	// All Done !
}
