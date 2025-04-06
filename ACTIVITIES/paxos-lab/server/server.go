package main

import (
	"net/http"
	"paxos-lab/paxos"
)

func main() {
	acceptor := &paxos.Acceptor{}

	http.HandleFunc("/prepare", acceptor.HandlePrepareHTTP)
	http.HandleFunc("/accept", acceptor.HandleAcceptHTTP)

	http.ListenAndServe(":8080", nil)
}
