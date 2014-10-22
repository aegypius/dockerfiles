# aegypius/mailcatcher

[mailcatcher](http://mailcatcher.me/) image for docker build on ruby:2 image

## Ports

- 1025
- 1080

## Running

You can use this base box standalone doing:

    docker pull aegypius/mailcatcher
    docker run -d -p 1025:1025 -p 1080:1080 aegypius/mailcatcher
