To build:

    docker build -t docker-karma .

To run:

    npm install
    docker run -p 9876:9876 -v $PWD:/opt/karma -i -t docker-karma


This will run all the [Jasmine][4] tests in the **tests** directory using [Karma][2] and [Chromium][3] in a [Docker][1] container.

[1]: https://www.docker.io/
[2]: http://karma-runner.github.io/0.10/index.html
[3]: https://chromium.org/
[4]: https://jasmine.github.io/
