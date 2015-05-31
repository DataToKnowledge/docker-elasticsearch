FROM elasticsearch:1.5.2

MAINTAINER Datatoknowledge <info@datatoknowledge.it>

# install the icu analyzer
RUN /usr/share/elasticsearch/bin/plugin --install elasticsearch/elasticsearch-analysis-icu/2.5.0

# install kopf manager
RUN  /usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/master

# install http auth
RUN mkdir -p /usr/share/elasticsearch/plugins/http-basic \
  cd /usr/share/elasticsearch/plugins/http-basic \
  wget https://github.com/DataToKnowledge/elasticsearch-http-basic/releases/download/v1.5.0/elasticsearch-http-basic-1.5.0.jarjar

CMD ["elasticsearch"]
