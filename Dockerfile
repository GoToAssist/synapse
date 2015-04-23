FROM debian:jessie

#Install synapse and nerve
RUN  apt-get update && apt-get install -y build-essential ruby-dev ruby git curl haproxy zlib1g-dev libreadline6-dev libyaml-dev libssl-dev

WORKDIR /synapse
ADD . /synapse
RUN cd synapse; gem build *.gemspec; gem install *.gem;cd ..

ENV SYNAPSE_CONFIG=/synapse/synapse/config/develop.conf.json
ENV HAPROXY_PID_FILE=/synapse/haproxy.pid
ENV HAPROXY_CFG_FILE=/synapse/synapse/config/haproxy.cfg

RUN sed -i s/\"config_file_path\":.*/"\"config_file_path\": \"$(echo ${HAPROXY_CFG_FILE} | sed 's/\//\\\//g')\","/ /synapse/synapse/config/develop.conf.json

EXPOSE 9092 2181 8001
EXPOSE 27017 27018 27019

ENTRYPOINT ["/synapse/synapse/bin/synapse"]