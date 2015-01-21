FROM mustardgrain/base:latest

MAINTAINER Kirk True <kirk@mustardgrain.com>

RUN \
  mkdir /etc/service/elasticsearch /opt/elasticsearch; \
  wget -O - https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/elasticsearch";
  

COPY run /etc/service/elasticsearch/

WORKDIR /opt/elasticsearch

CMD ["/opt/elasticsearch/bin/elasticsearch"]

EXPOSE 9200 9300
