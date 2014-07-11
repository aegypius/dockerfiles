# sf2-runtime 

Based on ```aegypius/php``` base image, allows to run a symfony2 project inside docker

## Volumes 

- /site 

## Usage

Inside your project root, run:

    docker run -d -p 8000:8000 -v $(pwd):/site aegypius/sf2-runtime

