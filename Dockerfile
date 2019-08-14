FROM golang:1.7.5 as builder

WORKDIR /go/src/

WORKDIR /go/src/github.com/xshyamx/git-hash

COPY . .

RUN GIT_COMMIT=$(git rev-list -1 HEAD --abbrev-commit) && \
   go build -ldflags "-X main.GitCommit=$GIT_COMMIT"

CMD "./git-hash"
