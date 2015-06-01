FROM elasticsearch:1.5.2

MAINTAINER Datatoknowledge <info@datatoknowledge.it>

# install the icu analyzer
RUN /usr/share/elasticsearch/bin/plugin --install elasticsearch/elasticsearch-analysis-icu/2.5.0

# install kopf manager
RUN  /usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/master

# install http auth
RUN mkdir -p /usr/share/elasticsearch/plugins/http-basic

RUN wget -P /usr/share/elasticsearch/plugins/http-basic  https://github.com/DataToKnowledge/elasticsearch-http-basic/releases/download/v1.5.0/elasticsearch-http-basic-1.5.0.jar

#copy base config, this should be changed
ENV PATH /usr/share/elasticsearch/bin:$PATH
COPY config /usr/share/elasticsearch/config

# Define mountable directories in which we put the elasticsearch data for log and data
VOLUME /data

# used to give access to Elasticsearch to the folders
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["elasticsearch"]
