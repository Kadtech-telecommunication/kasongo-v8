$ErrorActionPreference = "Stop"

$root = "kasongo\database"

if (-not (Test-Path $root)) {
    throw "Database folder not found: $root"
}

@'
"""
KASONGO V8
Trade Journal Repository
"""

from typing import List, Optional

from sqlalchemy.orm import Session

from .models import Trade


class TradeJournal:
    """
    Repository for Trade operations.
    """

    def __init__(self, db: Session):
        self.db = db

    # ==========================================
    # CREATE
    # ==========================================

    def create_trade(self, trade: Trade) -> Trade:
        self.db.add(trade)
        self.db.commit()
        self.db.refresh(trade)
        return trade

    # ==========================================
    # READ
    # ==========================================

    def get_trade(self, trade_id: int) -> Optional[Trade]:
        return (
            self.db.query(Trade)
            .filter(Trade.id == trade_id)
            .first()
        )

    def get_all_trades(self) -> List[Trade]:
        return (
            self.db.query(Trade)
            .order_by(Trade.created_at.desc())
            .all()
        )

    def get_trades_by_symbol(self, symbol: str) -> List[Trade]:
        return (
            self.db.query(Trade)
            .filter(Trade.symbol == symbol)
            .all()
        )

    def get_trades_by_strategy(self, strategy: str) -> List[Trade]:
        return (
            self.db.query(Trade)
            .filter(Trade.strategy == strategy)
            .all()
        )

    # ==========================================
    # UPDATE
    # ==========================================

    def update_trade(self, trade: Trade):
        self.db.commit()
        self.db.refresh(trade)
        return trade

    def close_trade(
        self,
        trade: Trade,
        result: str,
        profit: float,
    ):
        trade.result = result
        trade.profit = profit

        self.db.commit()
        self.db.refresh(trade)

        return trade

    # ==========================================
    # DELETE
    # ==========================================

    def delete_trade(self, trade: Trade):
        self.db.delete(trade)
        self.db.commit()

    # ==========================================
    # STATISTICS
    # ==========================================

    def count(self) -> int:
        return self.db.query(Trade).count()

    def winning_trades(self) -> int:
        return (
            self.db.query(Trade)
            .filter(Trade.profit > 0)
            .count()
        )

    def losing_trades(self) -> int:
        return (
            self.db.query(Trade)
            .filter(Trade.profit <= 0)
            .count()
        )

'@ | Set-Content -Encoding UTF8 "$root\trade_journal.py"

Write-Host ""
Write-Host "======================================="
Write-Host " KASONGO V8 TRADE JOURNAL CREATED"
Write-Host "======================================="
Write-Host ""
Write-Host "Generated:"
Write-Host " - trade_journal.py"
Write-Host ""