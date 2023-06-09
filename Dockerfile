FROM golang:1.19.0
RUN go version
ENV GOPATH=/
COPY ./ ./

# build
RUN go mod download
RUN go build -o ./bin/server ./cmd/server/main.go
RUN go build -o ./bin/client ./cmd/client/main.go

ENTRYPOINT [ "./bin/server" ]