FROM gcr.io/google-appengine/php:latest
ENV DOCUMENT_ROOT /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update; DEBIAN_FRONTEND=noninteractive apt-get -y install wget sudo
RUN wget -O - https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install newrelic-php5
RUN NR_INSTALL_KEY="2bd895f182e7998982392a29684afdc9d319a992" newrelic-install install

