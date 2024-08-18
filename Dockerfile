
FROM takeyamajp/ubuntu-sshd:ubuntu22.04

# Пароль для рут
ENV ROOT_PASSWORD root


# установка зависимостей

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes apt-utils
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nano python3 python3-pip supervisor software-properties-common mc gnupg2 wget curl

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-16 postgresql-contrib-16


RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


# здесь задается структура БД
COPY struct.sql struct.sql





RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/16/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/16/main/postgresql.conf




USER postgres
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER dbmaster WITH SUPERUSER PASSWORD 'dbmaster';" &&\
    createdb -O dbmaster menergo &&\
    psql menergo < struct.sql
    





VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
COPY psql.sh /usr/local/bin/psql.sh

#8000 - порт для веб сервиса fastapi
EXPOSE 22 5432 8000
USER root
CMD ["/usr/bin/supervisord"]
