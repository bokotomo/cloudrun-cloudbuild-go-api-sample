FROM golang:1.19.4-alpine

RUN apk update && apk add vim 

# golang
WORKDIR /go-api-sample
ENV GO111MODULE on

# golang lib
RUN go install github.com/mgechev/revive@latest