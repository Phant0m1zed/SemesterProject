import os
import pymysql
from pymysql.cursors import DictCursor
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"),
        port=int(os.getenv("DB_PORT", 3306)),
        user=os.getenv("DB_USER", "pharmacy_app"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME", "pharmacy_db"),
        cursorclass=DictCursor,
        autocommit=False,
    )

if __name__ == "__main__":
    try:
        conn = get_connection()
        print("Connected to pharmacy_db!")
        conn.close()
    except Exception as e:
        print(f"Connection failed: {e}")
