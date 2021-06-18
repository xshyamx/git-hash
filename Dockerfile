FROM golang:1.16.4 as builder

ARG GIT_VERSION

WORKDIR /go/src/github.com/xshyamx/git-hash

ADD *.go .

ADD go.* .

RUN GOOS=linux GOARCH=amd64 go build -ldflags "-w -s -X main.GitCommit=$GIT_VERSION"

FROM scratch

COPY --from=builder /go/src/github.com/xshyamx/git-hash/git-hash /git-hash

ENTRYPOINT [ "/git-hash" ]

