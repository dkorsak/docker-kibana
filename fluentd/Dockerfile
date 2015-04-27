
FROM ubuntu:latest

RUN apt-get update


RUN apt-get install -y ruby ruby-dev build-essential git

RUN gem install bundler --no-ri --no-rdoc
RUN gem install fluentd --no-ri --no-rdoc

RUN fluentd --setup /fluent
RUN mkdir -p /var/log/fluentd

RUN apt-get install -y libcurl4-gnutls-dev make
RUN gem install fluent-plugin-elasticsearch

VOLUME ["/var/log/fluentd"]

COPY config/fluent.conf /fluent/fluent.conf

ENTRYPOINT ["fluentd", "--config", "/fluent/fluent.conf"]

# Expose Fluentd ports.
EXPOSE 24224
EXPOSE 8888