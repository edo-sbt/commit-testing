FROM gcr.io/google-appengine/php:latest

RUN \
  curl -L https://download.newrelic.com/php_agent/release/newrelic-php5-8.3.0.226-linux.tar.gz | tar -C /tmp -zx && \
  NR_INSTALL_USE_CP_NOT_LN=1 NR_INSTALL_SILENT=1 /tmp/newrelic-php5-*/newrelic-install install && \
  rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* && \
  sed -i -e 's/"REPLACE_WITH_REAL_KEY"/"2bd895f182e7998982392a29684afdc9d319a992"/' \
  -e 's/newrelic.appname = "PHP Application"/newrelic.appname = "new relic testing"/' \
  $(find / -name newrelic.ini)

RUN PIDFile=$(find / -name nginx.pid)
RUN PIDFile=$(find / -name nginx.pid) && /etc/init.d/nginx restart


ENV DOCUMENT_ROOT /app
WORKDIR /app/

COPY index.php .

