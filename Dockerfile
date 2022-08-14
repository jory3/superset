FROM apache/superset
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN pip install mysqlclient
# Example: installing a driver to connect to Redshift
# Find which driver you need based on the analytics database
# you want to connect to here:
# https://superset.apache.org/docs/databases/installing-database-drivers
RUN pip install typing-extensions && pip install sqlalchemy-redshift && pip install pydruid && pip install pyhive \
  && pip install sqlalchemy-solr && pip install clickhouse-driver==0.2.0 && pip install clickhouse-sqlalchemy==0.1.6 \
  && pip install psycopg2-binary && pip install snowflake-sqlalchemy	

# Switching back to using the `superset` user
USER superset
