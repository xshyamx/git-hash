FROM golang:1.7.5 as builder

WORKDIR /go/src/

WORKDIR /go/src/github.com/xshyamx/git-hash

COPY . .

RUN GIT_COMMIT=$(git rev-list -1 HEAD --abbrev-commit) && \
   GOOS=linux GOARCH=amd64 go build -ldflags "-w -s -X main.GitCommit=$GIT_COMMIT"

FROM scratch

COPY --from=builder /go/src/github.com/xshyamx/git-hash/git-hash /git-hash

ENTRYPOINT [ "/git-hash" ]

