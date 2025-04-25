package main

import (
	"net/http"
)

// var startedAt = time.Now()

func main() {
	http.HandleFunc("/", Hello)
	http.ListenAndServe(":80", nil)
}

func Hello(w http.ResponseWriter, r *http.Request) {
	// name := os.Getenv("NAME")
	// age := os.Getenv("AGE")
	// fmt.Fprintf(w, "Hello, I'm %s. I'm %s.", name, age)
	w.Write([]byte("<h1>Hello Full Cycle</h1>"))
}