FROM dockerfile/nodejs

RUN apt-get -qq update
RUN apt-get install -y phantomjs

RUN mkdir -p /opt/karma
WORKDIR /opt/karma
RUN npm install -g karma
CMD karma start
