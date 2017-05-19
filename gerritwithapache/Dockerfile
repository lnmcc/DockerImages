FROM ubuntu 


ENV GERRIT_USER gerrit2
ENV GERRIT_HOME /home/$GERRIT_USER
ENV GERRIT_SITE $GERRIT_HOME/review_site
ENV GERRIT_WAR $GERRIT_HOME/gerrit.war
ENV GERRIT_VERSION 2.13.7
ENV GERRIT_INIT_ARGS ""

RUN useradd -ms /bin/bash  $GERRIT_USER \
    && usermod -aG sudo $GERRIT_USER

RUN set -x \
    && mkdir /docker-entrypoint-init.d \ 
    && apt-get update \
    && apt-get install -y git \
    && apt-get install -y sudo \
    && apt-get install -y openjdk-9-jre

COPY gerrit-2.13.7.war $GERRIT_HOME/gerrit.war
COPY gerrit-entrypoint.sh /
COPY gerrit-start.sh /

VOLUME $GERRIT_SITE

RUN chmod +x /gerrit-start.sh \
    && chmod +x /gerrit-entrypoint.sh \
    && chown -R  $GERRIT_USER:$GERRIT_USER $GERRIT_HOME \
    && chown -R  $GERRIT_USER:$GERRIT_USER $GERRIT_SITE

RUN apt-get install -y apache2

#ENTRYPOINT ["/gerrit-entrypoint.sh"]

EXPOSE 8080 29418

CMD ["bash", "service", "apache2", "start"]
#CMD ["/gerrit-start.sh"]
