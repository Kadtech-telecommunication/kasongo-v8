"""
Custom Exceptions
"""


class KasongoError(Exception):
    """Base exception."""


class MarketError(KasongoError):
    """Market engine exception."""


class StrategyError(KasongoError):
    """Strategy engine exception."""


class ExecutionError(KasongoError):
    """Execution engine exception."""
