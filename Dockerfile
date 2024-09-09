FROM golang:1.23.1
LABEL maintainer="Sublinks Core Developers <hello@sublinks.org>"
LABEL description="Federation service for Sublinks"

COPY . /src/

WORKDIR /app
RUN cd /src \
    && go mod download \
    && go build -o /app/federation /src/cmd/federation.go \
    && cd /app \
    && rm -rf /src

EXPOSE 8080

ENTRYPOINT [ "/app/federation" ]
