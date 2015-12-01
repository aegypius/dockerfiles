# aegypius/bats

Bash Automated Testing System [https://github.com/sstephenson/bats]

## Volume

- /data

## Usage

    docker pull aegypius/bats
    docker run -v /path/to/project:/data aegypius/bats bats test.

You can found more information by running

    docker run -it bats bats --help
