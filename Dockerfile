FROM python:3.8.16-buster
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip install pgcli==1.11.0 psycopg2-binary

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pgcli"]
