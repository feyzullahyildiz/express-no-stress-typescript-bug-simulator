# express-no-stress-docker-test
This application is created to simulate a bug for [generator-express-no-stress-typescript](https://github.com/cdimascio/generator-express-no-stress-typescript)

## Bug Scenario
- build a docker image: `docker build . -t test-express-image`
- run a container: `docker run --name testapp -p 3000:3000 --rm test-express-image`
- try to kill the container with `ctrl+c`. The container does not die :(
- it works, when i try to kill like this: `docker kill testapp`


`docker kill` default signal is `SIGKILL`. [docker docs](https://docs.docker.com/engine/reference/commandline/kill/) 

Default Unix `ctrl+c` kill signal is `SIGINT` [a unix docs](http://www.cs.kent.edu/~ruttan/sysprog/lectures/signals.html)

I think the application ignores `SIGINT` signal.