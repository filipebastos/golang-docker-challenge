FROM golang:alpine AS builder

WORKDIR /app

COPY go.* ./
RUN go mod download
COPY . ./
RUN go build -v -o server

FROM scratch

COPY --from=builder /app/server /app/server
CMD ["/app/server"]