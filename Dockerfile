FROM golang as builder
RUN CGO_ENABLED=0 go get -a -ldflags '-s' \
  -installsuffix cgo github.com/mcn015/go-web-server

FROM scratch
COPY --from=builder /go/bin/go-web-server /go-web-server
ADD page.html /page.html
ENTRYPOINT ["/go-web-server"]
