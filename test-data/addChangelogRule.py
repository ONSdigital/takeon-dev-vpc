import psycopg2
import os
import random

# Variables
user = os.getenv('AWS_COLLECTION_DB_USER')
sslmode = "require"
password = os.getenv('AWS_COLLECTION_DB_PASSWORD')
host = os.getenv('AWS_COLLECTION_DB_SERVER')
dbname = os.getenv('AWS_COLLECTION_DEV_DB_NAME')
formula = ' != " "'
counterVar = 0
port = os.getenv('AWS_DEV_DB_PORT')

# Construct connection string
def create_connection():
    conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4} port={5}".format(host, user, dbname, password, sslmode, port)
    conn = psycopg2.connect(conn_string)
    print("Connection established")
    return conn

def create_cursor(connection):
    cursor = connection.cursor()
    return cursor

def close_conections(cursor, connection):
    connection.commit()
    cursor.close()
    connection.close()

connection = create_connection()
cursor = create_cursor(connection)

rule_query = """create rule changelog as on update to dev01.response
where new.response <> old.response
do insert into dev01.changelog values (
default,
new.reference,
new.period,
new.survey,
new.questioncode,
new.instance,
old.response,
new.response,
user,
now());"""

cursor.execute(rule_query)
print('rule created')

close_conections(cursor, connection)
