FROM ubuntu 


ENV GERRIT_HOME /var/gerrit
ENV GERRIT_SITE $GERRIT_HOME/review_site
ENV GERRIT_WAR $GERRIT_HOME/gerrit.war
ENV GERRIT_VERSION 2.13.7
ENV GERRIT_USER gerrit
ENV GERRIT_INIT_ARGS ""

#RUN adduser -D -h "$GERRIT_HOME" -g "gerrit"
RUN set -x \
    && apt-get update \
    && apt-get install git openssh openssl


#COPY gerrit-entrypoint.sh /
COPY gerrit-start.sh /
RUN chmod +x /gerrit-start.sh

#EXPOSE 8080 29418
CMD ["/bin/bash"]



