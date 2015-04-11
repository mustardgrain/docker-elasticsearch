FROM mustardgrain/java8:latest

MAINTAINER Kirk True <kirk@mustardgrain.com>

CMD ["/sbin/my_init"]

ENV ELASTICSEARCH_VERSION 1.5.1
ENV ELASTICSEARCH_URL https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz
ENV ELASTICSEARCH_HOME /opt/elasticsearch-$ELASTICSEARCH_VERSION

RUN cd /opt && /usr/bin/curl -L -s $ELASTICSEARCH_URL | tar xz

COPY . /src

RUN mkdir -p /etc/service/elasticsearch && cp /src/run /etc/service/elasticsearch/run

WORKDIR $ELASTICSEARCH_HOME

EXPOSE 9200 9300

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
