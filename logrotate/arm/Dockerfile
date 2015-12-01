FROM armbuild/alpine:latest
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

RUN apk --update add logrotate
RUN echo "*/5 *	* * *	/usr/sbin/logrotate /etc/logrotate.conf" >> /etc/crontabs/root
COPY logrotate.conf /etc/logrotate.conf

CMD ["crond", "-f"]
