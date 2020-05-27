FROM golang

RUN mkdir -p $GOPATH/src/github.com/oscar-ardila-exa/tail/
ADD . $GOPATH/src/github.com/oscar-ardila-exa/tail/

# expecting to fetch dependencies successfully.
RUN go get -v github.com/oscar-ardila-exa/tail

# expecting to run the test successfully.
RUN go test -v github.com/oscar-ardila-exa/tail

# expecting to install successfully
RUN go install -v github.com/oscar-ardila-exa/tail
RUN go install -v github.com/oscar-ardila-exa/tail/cmd/gotail

RUN $GOPATH/bin/gotail -h || true

ENV PATH $GOPATH/bin:$PATH
CMD ["gotail"]
