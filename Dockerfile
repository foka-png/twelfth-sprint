FROM golang:1.25

WORKDIR /parcel

COPY go.mod go.sum tracker.db ./

RUN go mod download

COPY main.go parcel.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel_go

CMD ["/parcel_go"]