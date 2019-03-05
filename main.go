//Golang JSON API Script with 1 endpoint
//Vignesh Narasimhulu
//05-Mar-2019

package main

//import necessary modules
import (
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
)

//Define the type
type Health struct {
	Version       string `json:"version"`
	Description   string `json:"description"`
	Lastcommitsha string `json:"lastcommitsha"`
}

// define the variable
var health []Health

// Function to print output in json
func GetHealth(w http.ResponseWriter, r *http.Request) {
	json.NewEncoder(w).Encode(health)
}

// Main function
func main() {
	router := mux.NewRouter()

	new := os.Getenv("LSHA")
	//define values for the API object
	health = append(health, Health{Version: "1.0", Description: "TEST2 DevOps GoLang API", Lastcommitsha: new})

	//create the endpoint
	router.HandleFunc("/healthcheck", GetHealth).Methods("GET")
	log.Fatal(http.ListenAndServe(":8000", router))
}
