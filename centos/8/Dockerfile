FROM centos:8
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

RUN useradd -ms /bin/bash sogo
ENV HTTPD_PREFIX /var/www/html

# SOGO nightly
COPY sogo.repo /etc/yum.repos.d
COPY start.sh /usr/local/bin/
COPY start-memcached /usr/local/bin/
COPY start-sogod /usr/local/bin/
COPY httpd-foreground /usr/local/bin/
#RUN rpm --import "https://pgp.mit.edu/pks/lookup?op=get&amp;search=0xCB2D3A2AA0030E2C"
RUN dnf -y install epel-release dnf-plugins-core httpd httpd-tools sudo
RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown apache:apache "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX
RUN dnf config-manager --set-enabled powertools
RUN dnf -y update
RUN dnf -y install sogo* sope*mysql mariadb

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

EXPOSE 80
CMD ["start.sh"]
