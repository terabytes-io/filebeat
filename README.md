# filebeat-docker

### Quickstart

A default filebeat.yml which collects `/var/log/auth.log` and `/var/log/syslog` from the host is provided inside the container.  

Obtain a token from [terabytes.io](https://terabytes.io) and run the filebeat container - 

    docker run -d -v /var/log:/var/log/host:rw --hostname $(hostname) --name terabytes -e TOKEN=token terabytes/filebeat:latest

### Sending log files

Copy the filebeat.yml from this repository and place it on `/etc/filebeat.yml` on your machine.  
Using the official filebeat [documentation](https://www.elastic.co/guide/en/beats/filebeat/current/configuration-filebeat-options.html), update your filebeat.yml file with the paths of files that you want to track.  
To send JSON format logs, update the `tb_codec` variable to `json`. Currently only 2 codec formats are supported - `line` and `json`.

To use your filebeat.yml configuration instead of the default one, mount the `/etc/filebeat.yml` from the host to the container.
e.g.

    docker run -d -v /etc/filebeat.yml:/opt/filebeat/filebeat.yml \
    -v /var/log:/var/log/host:rw \
    --hostname $(hostnam) --name terabytes \
    -e TOKEN=token terabytes/filebeat:latest

