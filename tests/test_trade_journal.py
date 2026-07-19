"""
KASONGO V8
Trade Journal Test
"""

import sys
from pathlib import Path

# Allow imports from project root
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from kasongo.database import SessionLocal, init_database
from kasongo.database.models import User, Trade
from kasongo.database.trade_journal import TradeJournal


def run_test():

    print("=" * 45)
    print("KASONGO V8 TRADE JOURNAL TEST")
    print("=" * 45)

    # -----------------------------------------
    # Initialize Database
    # -----------------------------------------
    init_database()

    db = SessionLocal()
    journal = TradeJournal(db)

    # -----------------------------------------
    # Create or Load Test User
    # -----------------------------------------
    user = db.query(User).filter_by(username="test_user").first()

    if user is None:
        user = User(
            username="test_user",
            email="test@example.com",
            password_hash="password123",
        )

        db.add(user)
        db.commit()
        db.refresh(user)

        print("[OK] Test user created")
    else:
        print("[OK] Existing test user found")

    # -----------------------------------------
    # Create Trade
    # -----------------------------------------
    trade = Trade(
        user_id=user.id,
        symbol="XAUUSD",
        strategy="CRT",
        signal="BUY",
        entry=3400.00,
        stop_loss=3390.00,
        take_profit=3430.00,
    )

    journal.create_trade(trade)

    print("[OK] Trade created")

    # -----------------------------------------
    # Count Trades
    # -----------------------------------------
    print(f"Total Trades : {journal.count()}")

    # -----------------------------------------
    # Fetch Trades
    # -----------------------------------------
    trades = journal.get_all_trades()

    print()
    print("Stored Trades")
    print("-" * 45)

    for t in trades:
        print(
            f"ID:{t.id} | "
            f"{t.symbol} | "
            f"{t.strategy} | "
            f"{t.signal} | "
            f"{t.result}"
        )

    # -----------------------------------------
    # Close Trade
    # -----------------------------------------
    journal.close_trade(
        trade,
        result="WIN",
        profit=250.50,
    )

    print()
    print("[OK] Trade Closed")
    print(f"Winning Trades : {journal.winning_trades()}")
    print(f"Losing Trades  : {journal.losing_trades()}")

    db.close()

    print()
    print("=" * 45)
    print("TRADE JOURNAL TEST PASSED")
    print("=" * 45)


if __name__ == "__main__":
    run_test()