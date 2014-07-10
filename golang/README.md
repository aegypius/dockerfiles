# aegypius/golang

[aegypius/golang](https://index.docker.io/u/aegypius/golang) is a [docker](https://docker.io)
 base image that bundles the latest version of [golang](http://golang.org) installed from [golang.org](http://golang.org/doc/install/).

Based on `google/golang` Dockerfile on top of `ubuntu:latest` container.

## Notes

- `GOROOT` is set to `/goroot`
- `GOPATH` is set to `/gopath`

## Usage

- Create a Dockerfile in your golang application directory with the following content:

        FROM aegypius/golang

        WORKDIR /gopath/src/app
        ADD . /gopath/src/app/
        RUN go get app

        CMD []
        ENTRYPOINT ["/gopath/bin/app"]

- Run the following command in your application directory:

        docker build -t my/app .
