$ErrorActionPreference = "Stop"

$testRoot = "tests"

if (-not (Test-Path $testRoot)) {
    New-Item -ItemType Directory -Path $testRoot | Out-Null
}

@'
"""
KASONGO V8
Trade Journal Test
"""

from kasongo.database import SessionLocal, init_database
from kasongo.database.models import User, Trade
from kasongo.database.trade_journal import TradeJournal


def run_test():

    print("=" * 45)
    print("KASONGO V8 TRADE JOURNAL TEST")
    print("=" * 45)

    init_database()

    db = SessionLocal()
    journal = TradeJournal(db)

    # -----------------------------------------
    # Create Test User
    # -----------------------------------------
    user = User(
        username="test_user",
        email="test@example.com",
        password_hash="password123",
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    print("[OK] Test user created")

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
    # Count
    # -----------------------------------------
    print(f"Total Trades : {journal.count()}")

    # -----------------------------------------
    # Fetch
    # -----------------------------------------
    trades = journal.get_all_trades()

    print()
    print("Stored Trades")

    for t in trades:
        print(
            f"{t.id} | "
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

    print("Winning Trades :", journal.winning_trades())
    print("Losing Trades  :", journal.losing_trades())

    db.close()

    print()
    print("=" * 45)
    print("TRADE JOURNAL TEST PASSED")
    print("=" * 45)


if __name__ == "__main__":
    run_test()
'@ | Set-Content -Encoding UTF8 "$testRoot\test_trade_journal.py"

Write-Host ""
Write-Host "========================================"
Write-Host " TRADE JOURNAL TEST CREATED"
Write-Host "========================================"