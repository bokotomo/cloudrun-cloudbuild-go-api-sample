# go build
FROM golang:1.19.2 as builder
WORKDIR /app
ENV GO111MODULE on
COPY ./ ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

# go server
FROM gcr.io/distroless/base-debian11
WORKDIR /
COPY --from=builder /main /main
EXPOSE 8080
USER nonroot:nonroot
ENTRYPOINT ["/main"]