"""
KASONGO V8
Database Models
"""

from datetime import datetime

from sqlalchemy import (
    Boolean,
    DateTime,
    Float,
    ForeignKey,
    Integer,
    String,
)

from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column
from sqlalchemy.orm import relationship

from .database import Base


# ==========================================================
# Base Model
# ==========================================================

class BaseModel(Base):
    __abstract__ = True

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)

    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        default=datetime.utcnow,
    )

    updated_at: Mapped[datetime] = mapped_column(
        DateTime,
        default=datetime.utcnow,
        onupdate=datetime.utcnow,
    )


# ==========================================================
# User
# ==========================================================

class User(BaseModel):
    __tablename__ = "users"

    username: Mapped[str] = mapped_column(
        String(100),
        unique=True,
        nullable=False,
    )

    email: Mapped[str] = mapped_column(
        String(255),
        unique=True,
        nullable=False,
    )

    password_hash: Mapped[str] = mapped_column(
        String(255),
        nullable=False,
    )

    is_active: Mapped[bool] = mapped_column(
        Boolean,
        default=True,
    )

    subscription_plan: Mapped[str] = mapped_column(
        String(50),
        default="FREE",
    )

    trades = relationship(
        "Trade",
        back_populates="user",
    )


# ==========================================================
# Trade
# ==========================================================

class Trade(BaseModel):
    __tablename__ = "trades"

    user_id: Mapped[int] = mapped_column(
        ForeignKey("users.id")
    )

    symbol: Mapped[str] = mapped_column(String(30))

    strategy: Mapped[str] = mapped_column(String(100))

    signal: Mapped[str] = mapped_column(String(20))

    entry: Mapped[float] = mapped_column(Float)

    stop_loss: Mapped[float] = mapped_column(Float)

    take_profit: Mapped[float] = mapped_column(Float)

    result: Mapped[str] = mapped_column(
        String(30),
        default="OPEN",
    )

    profit: Mapped[float] = mapped_column(
        Float,
        default=0.0,
    )

    user = relationship(
        "User",
        back_populates="trades",
    )


# ==========================================================
# Signal
# ==========================================================

class Signal(BaseModel):
    __tablename__ = "signals"

    symbol: Mapped[str] = mapped_column(String(30))

    timeframe: Mapped[str] = mapped_column(String(20))

    strategy: Mapped[str] = mapped_column(String(100))

    signal_type: Mapped[str] = mapped_column(String(20))

    confidence: Mapped[float] = mapped_column(Float)

    entry: Mapped[float] = mapped_column(Float)

    stop_loss: Mapped[float] = mapped_column(Float)

    take_profit: Mapped[float] = mapped_column(Float)

    status: Mapped[str] = mapped_column(
        String(20),
        default="ACTIVE",
    )


# ==========================================================
# Strategy Performance
# ==========================================================

class StrategyPerformance(BaseModel):
    __tablename__ = "strategy_performance"

    strategy_name: Mapped[str] = mapped_column(
        String(100),
        unique=True,
    )

    total_trades: Mapped[int] = mapped_column(
        Integer,
        default=0,
    )

    wins: Mapped[int] = mapped_column(
        Integer,
        default=0,
    )

    losses: Mapped[int] = mapped_column(
        Integer,
        default=0,
    )

    win_rate: Mapped[float] = mapped_column(
        Float,
        default=0.0,
    )


# ==========================================================
# Learning Record
# ==========================================================

class LearningRecord(BaseModel):
    __tablename__ = "learning_records"

    symbol: Mapped[str] = mapped_column(String(30))

    strategy: Mapped[str] = mapped_column(String(100))

    timeframe: Mapped[str] = mapped_column(String(20))

    outcome: Mapped[str] = mapped_column(String(20))

    confidence: Mapped[float] = mapped_column(Float)


# ==========================================================
# Market Snapshot
# ==========================================================

class MarketSnapshot(BaseModel):
    __tablename__ = "market_snapshots"

    symbol: Mapped[str] = mapped_column(String(30))

    timeframe: Mapped[str] = mapped_column(String(20))

    trend: Mapped[str] = mapped_column(String(20))

    price: Mapped[float] = mapped_column(Float)

    volatility: Mapped[float] = mapped_column(Float)

    volume: Mapped[float] = mapped_column(Float)
