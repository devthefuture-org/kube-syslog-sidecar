FROM alpine:3.12

RUN addgroup -S -g 1000 sysloggroup && adduser -S -u 1000 -G sysloggroup sysloguser

RUN apk update && apk add --no-cache syslog-ng

EXPOSE 514/tcp 514/udp

COPY syslog-ng.conf /etc/

RUN mkdir -p /run && chown sysloguser:sysloggroup /run && chmod 755 /run
USER sysloguser

CMD ["/usr/sbin/syslog-ng", "-F", "-f", "/etc/syslog-ng.conf"]
