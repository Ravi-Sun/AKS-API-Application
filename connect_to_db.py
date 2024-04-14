import psycopg2

db_host = "postgres"
db_port = 5432
db_name = "apidb"
db_user = "admin"
db_password = "Password123!"

try:
    connection = psycopg2.connect(
        dbname=db_name,
        user=db_user,
        password=db_password,
        host=db_host,
        port=db_port
    )
    cursor = connection.cursor()
    print("Connected to the database!")
    

except psycopg2.Error as e:
    print("Error connecting to the database:", e)
finally:
    if connection:
        connection.close()
