FROM ubuntu 


ENV GERRIT_USER gerrit2
ENV GERRIT_HOME /home/$GERRIT_USER
ENV GERRIT_SITE $GERRIT_HOME/review_site
ENV GERRIT_WAR $GERRIT_HOME/gerrit.war
ENV GERRIT_VERSION 2.13.7
ENV GERRIT_INIT_ARGS ""
ENV JAVA_HOME=/usr/local/bin/jdk1.8.0_121
ENV PATH=$PATH:$JAVA_HOME/bin

RUN useradd -ms /bin/bash  $GERRIT_USER \
    && usermod -aG sudo $GERRIT_USER

RUN set -x \
    && apt-get update \
    && apt-get install -y git \
    && apt-get install -y sudo \
    && apt-get install -y apache2 \
    && apt-get install -y vim

COPY jdk-8u121-linux-x64.tar /
RUN tar xvf /jdk-8u121-linux-x64.tar   -C /usr/local/bin/ \
    && rm -f /jdk-8u121-linux-x64.tar

RUN mkdir /docker-entrypoint-init.d

COPY plugins.tar /
COPY gerrit-2.13.7.war $GERRIT_HOME/gerrit.war
COPY gerrit-entrypoint.sh / 
COPY gerrit-start.sh / 
COPY start-apache.sh /docker-entrypoint-init.d
COPY gerrit-apache.conf  /etc/apache2/sites-available

RUN chmod +x /gerrit-start.sh \
    && chmod +x /gerrit-entrypoint.sh \
    && chown -R  $GERRIT_USER:$GERRIT_USER /docker-entrypoint-init.d \
    && chown -R  $GERRIT_USER:$GERRIT_USER $GERRIT_HOME \
    && mkdir $GERRIT_SITE \
    && chown -R  $GERRIT_USER:$GERRIT_USER $GERRIT_SITE \
    && ln -s /etc/apache2/sites-available/gerrit-apache.conf  /etc/apache2/sites-enabled/gerrit-apache.conf

VOLUME $GERRIT_SITE

ENTRYPOINT ["/gerrit-entrypoint.sh"]

EXPOSE 8080 29418

#USER $GERRIT_USER
CMD ["/gerrit-start.sh"]
