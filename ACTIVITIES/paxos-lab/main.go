package main

import (
	"fmt"
	"paxos-lab/paxos"
)

func main() {

	acceptorURLs := []string{
		"http://192.168.1.2:8080",
		"http://192.168.1.3:8081",
		"http://192.168.1.4:8082",
		"http://192.168.1.5:8083",
		"http://192.168.1.6:8084",
	}

	proposer := paxos.Proposer{ProposalNumber: 1, Value: "Distributed Systems"}

	value := proposer.Propose("Distributed Systems", acceptorURLs)

	if value != nil {
		fmt.Printf("Consensus reached on value: %v\n", value)
	} else {
		fmt.Println("Consensus not reached")
	}
}
