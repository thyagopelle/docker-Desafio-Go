FROM golang:alpine3.18 as builder

WORKDIR /app

COPY . .

RUN go build -o /main desafioRocks.go

FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080
ENTRYPOINT ["/main"]