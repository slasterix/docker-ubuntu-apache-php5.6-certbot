FROM slasterix/docker-ubuntu-apache-php5.6:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update && \
    apt-get install -y certbot python-certbot-apache python3-certbot-dns-route53COPY crontab /etc/cron.d/certbot
RUN chmod 0644 /etc/cron.d/certbot
RUN service cron start
    
