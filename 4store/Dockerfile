FROM debian:wheezy
MAINTAINER Christophe Gueret <christophe.gueret@gmail.com>

# Install things needed to compile 4store
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get install -y --no-install-recommends \
	apt-transport-https ca-certificates \
	git supervisor build-essential automake gperf libtool flex bison \
	libssl-dev libraptor2-0 librasqal3 libraptor2-dev \
	librasqal3-dev ncurses-base libncurses5 \
	libncurses5-dev libreadline6-dev uuid-dev libglib2.0-dev \
	libnet-http-perl liburi-perl

# Clone, compile and install 4store
RUN	cd /usr/local/src && \
	git clone https://github.com/garlik/4store.git && \
	cd 4store && \
	./autogen.sh && \
	./configure && \
	make && \
	make install && \
	mkdir /var/log/4store

VOLUME /var/lib/4store

COPY supervisor.conf /etc/supervisor/conf.d/

EXPOSE 9000

COPY run.sh /
ENTRYPOINT [ "/run.sh" ]

CMD ["/usr/bin/supervisord"]
