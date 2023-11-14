"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv
import psycopg2

# Подключение к БД
conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="sql")

try:
    with conn:
        with conn.cursor() as cur:

            # Заполнение таблицы customers
            with open('north_data/customers_data.csv', 'r') as f:
                reader = csv.reader(f)
                next(reader)
                for row in reader:
                    cur.execute(
                        "INSERT INTO customers (customer_id, company_name, contact_name) "
                        "VALUES (%s, %s, %s)",
                        (row[0], row[1], row[2])
                    )

            # Заполнение таблицы employees
            with open('north_data/employees_data.csv', 'r') as f:
                reader = csv.reader(f)
                next(reader)
                for row in reader:
                    cur.execute(
                        "INSERT INTO employees (first_name, last_name, title, birth_date, notes) "
                        "VALUES (%s, %s, %s, %s, %s)",
                        (row[1], row[2], row[3], row[4], row[5])
                    )

            # Заполнение таблицы orders
            with open('north_data/orders_data.csv', 'r') as f:
                reader = csv.reader(f)
                next(reader)
                for row in reader:
                    cur.execute(
                        "INSERT INTO orders (customer_id,employee_id,order_date,ship_city) "
                        "VALUES (%s, %s, %s, %s)",
                        (row[1], row[2], row[3], row[4])
                    )

# Сохранение изменений и закрытие соединения
finally:
    conn.close()
