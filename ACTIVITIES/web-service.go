package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"sync"
	"time"

	"paxos-lab/paxos"
)

var (
	acceptors = []*paxos.Acceptor{{}, {}, {}}
	mu        sync.Mutex
)

func proposeHandler(w http.ResponseWriter, r *http.Request) {
	var body struct {
		ProposalNumber int
		Value          string
	}
	json.NewDecoder(r.Body).Decode(&body)

	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	proposer := paxos.Proposer{ProposalNumber: body.ProposalNumber, Value: body.Value}
	mu.Lock()
	defer mu.Unlock()

	value := proposeWithRetry(ctx, proposer, acceptors)
	if value != nil {
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "Consensus reached: %s\n", value)
	} else {
		w.WriteHeader(http.StatusConflict)
		fmt.Fprintf(w, "Consensus not reached\n")
	}
}

func proposeWithRetry(ctx context.Context, proposer paxos.Proposer, acceptors []*paxos.Acceptor) interface{} {
	retries := 3
	for i := 0; i < retries; i++ {
		select {
		case <-ctx.Done():
			log.Printf("Timeout while attempting to propose value: %s", proposer.Value)
			return nil
		default:
			value := proposer.Propose(proposer.Value, acceptors)
			if value != nil {
				return value
			}
			log.Printf("Proposal attempt %d failed for value: %s", i+1, proposer.Value)
		}
	}
	return nil
}

func main() {
	http.HandleFunc("/propose", proposeHandler)
	log.Println("Starting Paxos web service on port 8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
