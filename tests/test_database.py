"""
KASONGO V8
Database Engine Test
"""

import sqlite3
from pathlib import Path

DATABASE = Path("data") / "kasongo.db"


def test_database():

    if not DATABASE.exists():
        print("[ERROR] Database not found:", DATABASE)
        return

    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()

    cursor.execute(
        "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"
    )

    tables = cursor.fetchall()

    print()
    print("======================================")
    print(" KASONGO V8 DATABASE TEST")
    print("======================================")
    print()

    if not tables:
        print("No tables found.")
    else:
        print("Database Tables:")
        for table in tables:
            print(f"  ✓ {table[0]}")

    conn.close()

    print()
    print("Database test completed successfully.")


if __name__ == "__main__":
    test_database()
