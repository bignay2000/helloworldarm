package main

import (
    "fmt"
    "net/http"
    "os"
)

func handler(w http.ResponseWriter, r *http.Request) {

    webpagestring := os.Getenv("WEBPAGESTRING")
    if webpagestring == "" {
        webpagestring = "helloworld"
    }
    fmt.Println(webpagestring)

    hostname,err := os.Hostname()
    if err == nil {
        fmt.Println("hostname:",hostname)
    }
    fmt.Fprintf(w, webpagestring,hostname)

}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}