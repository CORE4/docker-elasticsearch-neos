FROM elasticsearch:1.7

ADD config/elasticsearch_1.7.yml /etc/elasticsearch/elasticsearch.yml
RUN /usr/share/elasticsearch/bin/plugin install elasticsearch/elasticsearch-mapper-attachments/2.7.1
