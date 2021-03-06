FROM golang:1.8

WORKDIR /go/src/app
COPY ./src/* /go/src/app/

# RUN go get -u github.com/google/pprof
RUN go get -d -v ./...
RUN go install -v ./...

# CMD go test --cpuprofile /data/cpuprofile --memprofile /data/memprofile --bench app ;app ; go tool pprof -pdf /go/bin/app /data/cpuprofile > /data/cpuprofile.pdf;  go tool pprof -pdf /go/bin/app /data/memprofile > /data/memprofile.pdf
CMD app