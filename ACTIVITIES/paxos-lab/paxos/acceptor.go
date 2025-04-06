package paxos

import (
	"encoding/json"
	"net/http"
	"sync"
)

type Acceptor struct {
	mu             sync.Mutex
	promisedNumber int
	acceptedNumber int
	acceptedValue  interface{}
}

func (a *Acceptor) HandlePrepare(p Prepare) Promise {
	a.mu.Lock()
	defer a.mu.Unlock()

	if p.ProposalNumber > a.promisedNumber {
		a.promisedNumber = p.ProposalNumber
		return Promise{ProposalNumber: p.ProposalNumber, AcceptedValue: a.acceptedValue}
	}
	return Promise{}
}

func (a *Acceptor) HandleAccept(ac Accept) Accepted {
	a.mu.Lock()
	defer a.mu.Unlock()

	if ac.ProposalNumber >= a.promisedNumber {
		a.promisedNumber = ac.ProposalNumber
		a.acceptedNumber = ac.ProposalNumber
		a.acceptedValue = ac.Value
		return Accepted{ProposalNumber: ac.ProposalNumber, Value: ac.Value}
	}
	return Accepted{}
}

func (a *Acceptor) HandlePrepareHTTP(w http.ResponseWriter, r *http.Request) {
	var p Prepare
	json.NewDecoder(r.Body).Decode(&p)
	response := a.HandlePrepare(p)
	json.NewEncoder(w).Encode(response)
}

func (a *Acceptor) HandleAcceptHTTP(w http.ResponseWriter, r *http.Request) {
	var ac Accept
	json.NewDecoder(r.Body).Decode(&ac)
	response := a.HandleAccept(ac)
	json.NewEncoder(w).Encode(response)
}
