FROM mustardgrain/java8:latest

MAINTAINER Kirk True <kirk@mustardgrain.com>

CMD ["/sbin/my_init"]

ENV ELASTICSEARCH_URL=https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz
ENV ELASTICSEARCH_HOME=/opt/elasticsearch
ENV PATH=$PATH:$ELASTICSEARCH_HOME/bin

RUN cd /opt && /usr/bin/curl -L -s $ELASTICSEARCH_URL | tar xz

COPY . /src

RUN mkdir -p /etc/service/elasticsearch && cp /src/run /etc/service/elasticsearch/run

WORKDIR $ELASTICSEARCH_HOME

RUN plugin -install mobz/elasticsearch-head

EXPOSE 9200 9300

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
