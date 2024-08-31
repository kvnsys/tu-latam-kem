import os
from flask import Flask, jsonify
import psycopg2
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# Read database connection parameters from environment variables
DB_PARAMS = {
    'dbname': os.getenv('DB_NAME'),
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST'),
    'port': os.getenv('DB_PORT', '5432')  # Default port if not provided
}

def get_db_connection():
    conn = psycopg2.connect(**DB_PARAMS)
    return conn

@app.route('/data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT json FROM senators LIMIT 1;')  # Adjust the query as needed
    data = cur.fetchone()
    cur.close()
    conn.close()

    if data:
        json_data = data[0]
        return jsonify(json_data)
    else:
        return jsonify({'error': 'No data found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True) # >> Esto deberia cambiar en produccion. No tengo tiempo para aprovisionarlo correctamente ahora.
