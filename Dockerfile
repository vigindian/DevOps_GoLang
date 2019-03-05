FROM golang:1.7-alpine

RUN apk update && apk add git

RUN mkdir /go/src/app
WORKDIR /go/src/app

COPY . .

RUN go get ./ && go get github.com/pilu/fresh
RUN go build

LABEL maintainer="Nick Janetakis <nick.janetakis@gmail.com>"

CMD go run app.go
