FROM python:3.11.3-bullseye
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip install pgcli==3.5.0

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pgcli"]
