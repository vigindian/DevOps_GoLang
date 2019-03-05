package main

import (
    "encoding/json"
    "log"
    "net/http"
    "github.com/gorilla/mux"
)

// our main function
// fun main()
func main() {
    router := mux.NewRouter()
    router.HandleFunc("/healthcheck", GetHealth).Methods("GET")
    log.Fatal(http.ListenAndServe(":8000", router))
}

// get SHA with below
// git rev-parse HEAD

