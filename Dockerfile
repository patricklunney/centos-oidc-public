# Docker Image for OIDC
# Set Base Image
FROM centos:7
MAINTAINER Patrick Lunney
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

RUN yum install vim php -y
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install jansson -y
RUN yum install initscripts -y 
RUN yum clean all -y
RUN rpm -Uvh http://mirror.cc.vt.edu/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/c/cjose-0.5.1-2.fc28.src.rpm
RUN curl -s -L -o ~/cjose-0.4.1-1.el7.centos.x86_64.rpm https://github.com/pingidentity/mod_auth_openidc/releases/download/v2.0.0/cjose-0.4.1-1.el7.centos.x86_64.rpm
RUN yum localinstall -y ~/cjose-0.4.1-1.el7.centos.x86_64.rpm
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/h/hiredis-0.12.1-1.el7.x86_64.rpm
RUN yum install hiredis -y
RUN rpm -Uvh https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/mod_auth_openidc-2.3.0-1.el7.centos.x86_64.rpm

EXPOSE 80

COPY oidc.conf          /etc/httpd/conf.d
COPY index.php          /var/www/html

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
