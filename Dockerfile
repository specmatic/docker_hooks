FROM znsio/specmatic:latest

RUN apk add --no-cache tini bash

COPY entrypoint-wrapper-latest.sh /entrypoint-wrapper.sh

RUN chmod +x /entrypoint-wrapper.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint-wrapper.sh"]    
