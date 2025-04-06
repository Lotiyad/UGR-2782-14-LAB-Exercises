package paxos

import (
	"bytes"
	"encoding/json"
	"net/http"
)

type Proposer struct {
	ProposalNumber int
	Value          interface{}
}

func (p *Proposer) Propose(value interface{}, acceptorURLs []string) interface{} {
	promises := 0

	for _, url := range acceptorURLs {
		data, _ := json.Marshal(Prepare{ProposalNumber: p.ProposalNumber})
		resp, err := http.Post(url+"/prepare", "application/json", bytes.NewBuffer(data))
		if err == nil {
			var promise Promise
			json.NewDecoder(resp.Body).Decode(&promise)
			if promise.ProposalNumber == p.ProposalNumber {
				promises++
			}
		}
	}

	if promises > len(acceptorURLs)/2 {
		accepted := 0

		for _, url := range acceptorURLs {
			data, _ := json.Marshal(Accept{ProposalNumber: p.ProposalNumber, Value: value})
			resp, err := http.Post(url+"/accept", "application/json", bytes.NewBuffer(data))
			if err == nil {
				var ack Accepted
				json.NewDecoder(resp.Body).Decode(&ack)
				if ack.ProposalNumber == p.ProposalNumber {
					accepted++
				}
			}
		}

		if accepted > len(acceptorURLs)/2 {
			return value
		}
	}

	return nil
}
