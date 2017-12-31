#To Build:     docker build --no-cache=true -t helloworldarm .

#To Run:		docker run --restart=always -d -t --env "WEBPAGESTRING=helloworld" -p 80:8080 --name helloworldarm -h helloworldarm helloworldarm


FROM golang:latest

WORKDIR /go/src/helloworldarm/

COPY helloworld.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -a -installsuffix cgo -o helloworldarm .


FROM scratch

MAINTAINER rnaylor@hivetechnologies.net

COPY --from=builder /usr/src/helloworldarm/helloworldarm .

EXPOSE 8080
CMD ["/helloworldarm"]