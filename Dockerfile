FROM elasticsearch:2.4

ADD config/elasticsearch_2.4.yml /etc/elasticsearch/elasticsearch.yml
RUN /usr/share/elasticsearch/bin/plugin install license
RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin install marvel-agent
RUN /usr/share/elasticsearch/bin/plugin install mapper-attachments
