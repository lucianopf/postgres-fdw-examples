FROM postgres:17

ARG MYSQL_FDW_VERSION=2_9_2
ARG MYSQL_FDW_URL=https://github.com/EnterpriseDB/mysql_fdw/archive/REL-${MYSQL_FDW_VERSION}.tar.gz
ARG SOURCE_FILES=/tmp/mysql_fdw


RUN apt update && apt --no-install-recommends -y install curl ca-certificates postgresql-17-pglogical && \
    echo "host    replication          postgres                172.18.0.0/16   trust" >> /usr/share/postgresql/17/pg_hba.conf.sample && \
    echo "host    replication          postgres                ::1/128         trust" >> /usr/share/postgresql/17/pg_hba.conf.sample && \
    echo "shared_preload_libraries = 'pglogical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "wal_level = 'logical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_wal_senders = 20" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_replication_slots = 20" >> /usr/share/postgresql/postgresql.conf.sample

RUN apt --no-install-recommends -y install wget make gcc postgresql-server-dev-17 libmariadb-dev-compat && \
    # download MYSQL_FDW source files
    mkdir -p ${SOURCE_FILES} && \
    wget -O - ${MYSQL_FDW_URL} | tar -zx -C ${SOURCE_FILES} --strip-components=1 && \
    cd ${SOURCE_FILES} && \
    # compilation
    make USE_PGXS=1 && \
    make USE_PGXS=1 install
