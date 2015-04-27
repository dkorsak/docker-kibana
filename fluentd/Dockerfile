# Pull base image.
FROM ubuntu:latest

RUN \
  apt-get update && \
  apt-get install -y ruby ruby-dev build-essential git libcurl4-gnutls-dev make && \
  gem install bundler --no-ri --no-rdoc && \
  gem install fluentd --no-ri --no-rdoc

RUN fluentd --setup /fluent
RUN mkdir -p /var/log/fluentd

RUN gem install fluent-plugin-elasticsearch

VOLUME ["/var/log/fluentd"]

COPY config/fluent.conf /fluent/fluent.conf

ENTRYPOINT ["fluentd", "--config", "/fluent/fluent.conf"]

# Expose Fluentd ports.
EXPOSE 24224
EXPOSE 8888