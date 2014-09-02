## Genghis Docker Container

This is a container for [Genghis "_The single-file MongoDB admin app._"](http://genghisapp.com)

## Building

    git clone https://github.com/aegypius/dockerfiles
    cd dockerfiles/genghis
    docker build -t aegypius/genghis .

## Running

    docker run -p 5000:5000 --link mongo:db -t aegypius/genghis
