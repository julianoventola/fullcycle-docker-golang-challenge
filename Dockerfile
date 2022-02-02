FROM golang:1.17 as build
WORKDIR /go/src/app
COPY . .
RUN go build hello.go

FROM scratch
COPY --from=build /go/src/app /go/src/app
CMD [ "/go/src/app/hello" ]