FROM golang:alpine
RUN apk add --update-cache git && \
    cd /go/src && git clone https://github.com/elastic/beats.git && \
    cd beats/filebeat && go get && go build && mv filebeat /usr/bin/ && \
    rm -rf /usr/local/go && rm -rf /root/go/beats \
    apk del git
ADD . /opt/filebeat/
ENTRYPOINT ["/opt/filebeat/docker-entrypoint.sh"]
CMD ["/usr/bin/filebeat", "-c", "/opt/filebeat/filebeat.yml"]
