To build:

    docker build -rm -t docker-karma .

To run:

    docker run -p 9876:9876 -v $PWD:/opt/karma -i -t docker-karma


This will run all the Jasmine tests in the **tests** directory.

[Docker][1]
[Karma][2]
[PhantomJS][3]
[Jasmine][4]

[1]: https://www.docker.io/
[2]: http://karma-runner.github.io/0.10/index.html
[3]: http://phantomjs.org/
[4]: http://pivotal.github.io/jasmine/
