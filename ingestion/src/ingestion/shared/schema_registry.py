"""
Pydantic models that define the data contract for each source system.
These are the shapes that ingestion scripts must produce before writing Parquet.
Validation happens at the boundary — upstream data is assumed dirty.
"""

from datetime import date, datetime
from decimal import Decimal
from typing import Optional

from pydantic import BaseModel


class CegidTransaction(BaseModel):
    transaction_id: str
    store_id: str
    brand_id: str
    transaction_date: datetime
    product_id: str
    category_id: Optional[str] = None
    quantity: int
    unit_price: Decimal
    total_price: Decimal
    payment_type: Optional[str] = None


class SapInventoryRecord(BaseModel):
    inventory_id: str
    product_id: str
    brand_id: str
    category_id: str
    store_id: str
    quantity_on_hand: int
    quantity_reserved: int
    reorder_point: int
    unit_cost: Decimal
    snapshot_date: date


class SalesforceCustomer(BaseModel):
    customer_id: str
    email: str
    first_name: str
    last_name: str
    phone: Optional[str] = None
    city: str
    region: str
    postal_code: str
    country: str = "FR"
    loyalty_tier: str
    acquisition_channel: str
    preferred_brand: str
    created_at: datetime
    last_purchase_date: Optional[date] = None
    lifetime_value: Decimal
