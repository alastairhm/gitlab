FROM ubuntu:xenial
MAINTAINER Andrew Glass <andrew.glass@outlook.com>

VOLUME  ["/var/opt/gitlab", "/var/log/gitlab", "/etc/gitlab"]

RUN    apt-get -qq update && \
       apt-get install -qy curl openssh-server ca-certificates && \
       curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh |  bash && \       
       apt-get install -qy gitlab-ce && \
       apt-get -f install && \
       gitlab-ctl reconfigure

EXPOSE 80/tcp 443/tcp 22/tcp 8080/tcp



