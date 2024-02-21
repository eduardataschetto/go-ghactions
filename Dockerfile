FROM golang:1.21 AS builder

WORKDIR /src

COPY . .

RUN go build -o app


FROM scratch

WORKDIR /src

COPY --from=builder /src/app .

ENTRYPOINT [ "./app" ]