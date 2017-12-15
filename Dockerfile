FROM mwaeckerlin/ubuntu-base
MAINTAINER mwaeckerlin

RUN apt-get update && apt-get -y upgrade && apt-get install -y prosody prosody-modules lua-zlib sudo
RUN mkdir /var/run/prosody
RUN chown prosody:prosody /var/run/prosody
RUN sed -i 's, *daemonize *= *.*;,daemonize = false;,' /etc/prosody/prosody.cfg.lua

USER prosody
CMD prosodyctl start
