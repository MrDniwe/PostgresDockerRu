FROM postgres:11
RUN apt-get update && apt-get install postgis postgresql-11-postgis-scripts -y
RUN apt-get install git -y
RUN apt-get install build-essential postgresql-server-dev-11 -y
RUN cd / && git clone https://github.com/iCyberon/pg_hashids
RUN cd /pg_hashids && make; make install
RUN cd / && git clone https://github.com/omniti-labs/pg_amqp
RUN cd /pg_amqp && make; make install
RUN apt-get update && apt-get install postgresql-11-cron -y
RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8
