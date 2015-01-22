FROM mustardgrain/base:latest

MAINTAINER Kirk True <kirk@mustardgrain.com>

ENV ELASTICSEARCH_URL=https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz
ENV ELASTICSEARCH_HOME=/opt/elasticsearch
ENV PATH=$PATH:$ELASTICSEARCH_HOME/bin

RUN \
  mkdir $ELASTICSEARCH_HOME ; \
  wget -O - $ELASTICSEARCH_URL | tar xzf - --strip-components=1 -C $ELASTICSEARCH_HOME;

COPY . /src

WORKDIR $ELASTICSEARCH_HOME

RUN plugin -install mobz/elasticsearch-head

CMD ["elasticsearch"]

EXPOSE 9200 9300
