FROM golang:latest

WORKDIR /go/src/helloworldarm/

COPY helloworld.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -a -installsuffix cgo -o helloworldarm .


FROM scratch

MAINTAINER rnaylor@hivetechnologies.net

COPY --from=builder /usr/src/helloworldarm/helloworldarm .

EXPOSE 8080
CMD ["/helloworldarm"]