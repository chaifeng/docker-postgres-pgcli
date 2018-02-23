FROM python:3.6-jessie
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip install pgcli==1.8.2 psycopg2-binary

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pgcli"]
