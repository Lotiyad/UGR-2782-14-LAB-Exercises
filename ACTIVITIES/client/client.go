package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
)

type Proposal struct {
	ProposalNumber int    `json:"ProposalNumber"`
	Value          string `json:"Value"`
}

func sendProposal(url string, proposal Proposal) (string, error) {
	data, err := json.Marshal(proposal)
	if err != nil {
		return "", err
	}

	resp, err := http.Post(url, "application/json", bytes.NewBuffer(data))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	if resp.StatusCode == http.StatusOK {
		return fmt.Sprintf("Consensus reached: %s", proposal.Value), nil
	}
	return "Consensus not reached", nil
}

func main() {
	proposal := Proposal{
		ProposalNumber: 1,
		Value:          "Distributed Consensus",
	}

	instances := []string{
		"http://localhost:8080/propose",
		"http://localhost:8081/propose",
		"http://localhost:8082/propose",
	}

	for _, instance := range instances {
		result, err := sendProposal(instance, proposal)
		if err != nil {
			fmt.Println("Error:", err)
			continue
		}
		fmt.Println("Response from", instance, ":", result)
	}
}
