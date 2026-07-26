"""
KASONGO V8
Core Settings
"""

from dataclasses import dataclass


@dataclass
class Settings:
    APP_NAME: str = "KASONGO V8"
    VERSION: str = "1.0.0"
    DEBUG: bool = True


settings = Settings()
