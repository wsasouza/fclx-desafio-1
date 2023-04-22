FROM golang:1.20-bullseye as buider
WORKDIR /app
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -o main

FROM scratch
COPY --from=buider /app/main /main
ENTRYPOINT [ "/main" ]