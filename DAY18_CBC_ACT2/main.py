from flask import Flask, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Database configuration
db_config = {
    'host': '127.0.0.1',
    'user': 'root',  # Replace with your MySQL username
    'password': '',  # Replace with your MySQL password
    'database': 'restaurant_db',
    'charset': 'utf8mb4'
}

# Function to establish database connection
def get_db_connection():
    try:
        conn = mysql.connector.connect(**db_config)
        if conn.is_connected():
            return conn
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

# Route 1: INNER JOIN between ITEMS and ORDER
@app.route('/items-orders-inner', methods=['GET'])
def items_orders_inner():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        query = '''
            SELECT i.ITEMS_NO, i.DESCRIPTION, i.PRICE, i.QUANTITY, o.ORDER_NO
            FROM ITEMS i
            INNER JOIN `order` o ON i.NO_OF_ITEMS = o.NO_OF_ITEMS
        '''
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify(rows)
    except Error as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

# Route 2: LEFT JOIN between ORDER and ITEMS
@app.route('/orders-items-left', methods=['GET'])
def orders_items_left():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        query = '''
            SELECT o.ORDER_NO, o.NO_OF_ITEMS, i.ITEMS_NO, i.DESCRIPTION
            FROM `order` o
            LEFT JOIN ITEMS i ON o.NO_OF_ITEMS = i.NO_OF_ITEMS
        '''
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify(rows)
    except Error as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

# Route 3: FULL JOIN between CUSTOMER and ORDER (emulated with LEFT JOIN and RIGHT JOIN)
@app.route('/customers-orders-full', methods=['GET'])
def customers_orders_full():
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        # MySQL doesn't support FULL JOIN, so we emulate it with LEFT JOIN UNION RIGHT JOIN
        query = '''
            -- LEFT JOIN part: All customers, even those without orders
            SELECT c.CUSTOMER_ID, c.NAME, o.ORDER_NO
            FROM customer c
            LEFT JOIN `order` o ON c.CUSTOMER_ID = o.CUSTOMER_ID
            UNION
            -- RIGHT JOIN part: All orders, even those without customers
            SELECT c.CUSTOMER_ID, c.NAME, o.ORDER_NO
            FROM customer c
            RIGHT JOIN `order` o ON c.CUSTOMER_ID = o.CUSTOMER_ID
            WHERE c.CUSTOMER_ID IS NULL
        '''
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify(rows)
    except Error as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)