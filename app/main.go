
package main

import (
"encoding/json"
"fmt"
"net/http"
"time"
"log"
)

// holds data to be returned in json format
type TimeResponse struct {
CurrentTime string `json:"current_time"`
}

// handles the get function and returns the current time in json format
func getTimeHandler(w http.ResponseWriter, r *http.Request) {
// Get the current time.
watLocation, err := time.LoadLocation("Africa/Lagos")
if err != nil {
log.Fatalf("Failed to load WAT timezone: %v", err)
}
currentTime := time.Now().In(watLocation).Format("2006-01-02 15:04:05 MST")

// Create a TimeResponse object.
response := TimeResponse{
CurrentTime: currentTime,
}

// Set the response header to indicate that the content type is JSON.
w.Header().Set("Content-Type", "application/json")

// Encode the response as JSON and send it to the client.
json.NewEncoder(w).Encode(response)
}

func main() {
// Set up the HTTP handler for the /time endpoint.
http.HandleFunc("/", getTimeHandler)
fmt.Println("Starting server on port 8080...")
// Start the HTTP server on port 8080.
err := http.ListenAndServe("0.0.0.0:8080", nil)
if err != nil {
log.Fatalf("Failed to start server: %v", err)
}
}
