FROM golang:alpine AS builder

WORKDIR /var/app
COPY full_cycle_rocks.go .

RUN  go build full_cycle_rocks.go


FROM scratch
WORKDIR /var/app
COPY --from=builder /var/app/full_cycle_rocks .
ENTRYPOINT [ "./full_cycle_rocks" ]