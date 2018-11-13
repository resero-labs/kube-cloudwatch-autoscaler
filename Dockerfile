FROM python:3.7.0

LABEL maintainer="Michael Wright <mkwright@gmail.com>"

# Install software requirements
RUN apt-get update && \
    apt-get install -y tzdata ca-certificates curl jq less; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install awscli

# Add script
COPY ./entrypoint.sh /usr/local/bin/

# Command
CMD ["/usr/local/bin/entrypoint.sh"]

