FROM golang AS builder

WORKDIR /usr/src/appgolang

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /fullcycle

FROM scratch

COPY --from=builder /fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"] 