To build:

    docker build -rm -t docker-karma .

To run:

    docker run -p 9876:9876 -v $PWD:/opt/karma -i -t docker-karma


This will run all the Jasmine tests in the **tests** directory.
