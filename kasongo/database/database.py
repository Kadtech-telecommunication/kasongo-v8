"""
KASONGO V8
Database Engine
"""

from pathlib import Path

from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker

# ==========================================
# Database Location
# ==========================================

DATA_DIR = Path("data")
DATA_DIR.mkdir(exist_ok=True)

DATABASE_URL = f"sqlite:///{DATA_DIR / 'kasongo.db'}"

# ==========================================
# SQLAlchemy Engine
# ==========================================

engine = create_engine(
    DATABASE_URL,
    echo=False,
    future=True,
)

# ==========================================
# Session Factory
# ==========================================

SessionLocal = sessionmaker(
    bind=engine,
    autoflush=False,
    autocommit=False,
)

# ==========================================
# Base ORM Class
# ==========================================

Base = declarative_base()

# ==========================================
# Database Initialization
# ==========================================

def init_database():
    """
    Create all registered database tables.
    """
    from . import models

    Base.metadata.create_all(bind=engine)