#Base image
FROM golang:alpine as builder

# Update and install git
RUN apk update && apk add --no-cache git

# Create app user
RUN adduser -D -g '' health

WORKDIR $GOPATH/src/infy/health/
COPY . .

# Fetch dependencies.
RUN go get -d -v

# Build the binary as 'health'
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -a -installsuffix cgo -o /go/bin/health .

#Smaller image
FROM scratch

# Import from builder.
COPY --from=builder /etc/passwd /etc/passwd

# Copy our static executable
COPY --from=builder /go/bin/health /go/bin/health

# Use an unprivileged user.
USER health 

# Run the health binary.
ENTRYPOINT ["/go/bin/health"]
