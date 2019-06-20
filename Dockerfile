FROM golang:1.8 AS builder

WORKDIR /go/src/hola-kubes
COPY . .

RUN go get -d -v ./...
RUN go build .

FROM alpine:latest

RUN apk add --no-cache  libc6-compat
RUN apk add --no-cache ca-certificates

WORKDIR /opt/hola-kubes

COPY --from=builder /go/src/hola-kubes/hola-kubes .
COPY --from=builder /go/src/hola-kubes/conf  conf

ENV BEEGO_RUNMODE production

EXPOSE 9294
CMD ["./hola-kubes"]