FROM postgres:12

RUN apt update && apt -y install curl ca-certificates postgresql-12-pglogical && \
    echo "host    replication          postgres                172.18.0.0/16   trust" >> /usr/share/postgresql/12/pg_hba.conf.sample && \
    echo "host    replication          postgres                ::1/128         trust" >> /usr/share/postgresql/12/pg_hba.conf.sample && \
    echo "shared_preload_libraries = 'pglogical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "wal_level = 'logical'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_wal_senders = 20" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "max_replication_slots = 20" >> /usr/share/postgresql/postgresql.conf.sample