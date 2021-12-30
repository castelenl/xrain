FROM alpine:latest
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && mkdir /usr/bin/xray /etc/xray \
 && touch /etc/xray/config.json \
 && unzip /xray.zip -d /usr/bin/xray \
 && rm -rf /xray.zip /usr/bin/xray/README.md /usr/bin/xray/LICENSE /usr/bin/xray/*.dat \
 && chgrp -R 0 /etc/xray \
 && chmod -R g+rwX /etc/xray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 8080 
