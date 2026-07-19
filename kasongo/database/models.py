"""
KASONGO V8
Database Models
"""

from datetime import datetime

from sqlalchemy import Column
from sqlalchemy import DateTime
from sqlalchemy import Float
from sqlalchemy import Integer
from sqlalchemy import String

from .database import Base


# ==========================================
# Trade Journal
# ==========================================

class Trade(Base):
    __tablename__ = "trades"

    id = Column(Integer, primary_key=True, index=True)

    symbol = Column(String(20))
    strategy = Column(String(50))

    direction = Column(String(10))

    entry = Column(Float)
    stop_loss = Column(Float)
    take_profit = Column(Float)

    lot_size = Column(Float)

    profit = Column(Float, default=0.0)

    status = Column(String(20))

    created_at = Column(
        DateTime,
        default=datetime.utcnow
    )


# ==========================================
# Signals
# ==========================================

class Signal(Base):

    __tablename__ = "signals"

    id = Column(Integer, primary_key=True)

    symbol = Column(String(20))

    timeframe = Column(String(10))

    strategy = Column(String(50))

    direction = Column(String(10))

    confidence = Column(Float)

    created_at = Column(
        DateTime,
        default=datetime.utcnow
    )


# ==========================================
# User Settings
# ==========================================

class UserSettings(Base):

    __tablename__ = "settings"

    id = Column(Integer, primary_key=True)

    risk_percent = Column(Float, default=1.0)

    max_daily_loss = Column(Float, default=5.0)

    auto_trade = Column(String(10), default="OFF")