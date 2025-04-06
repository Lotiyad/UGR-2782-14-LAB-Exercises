FROM golang:1.18-alpine

WORKDIR /app
COPY . .

RUN go mod tidy
RUN go build -o web-service .

EXPOSE 8080
CMD ["./web-service"]
