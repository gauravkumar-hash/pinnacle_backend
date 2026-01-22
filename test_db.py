# test_db.py
from sqlalchemy import create_engine, text

db_url = "postgresql+psycopg://postgres:SbillHhkiyrFH9uX@db.ksminnjzhpczzmtoztgt.supabase.co:5432/postgres"

engine = create_engine(db_url)

try:
    with engine.connect() as conn:
        result = conn.execute(text("SELECT 1"))
        print("DB connected! Result:", result.scalar())
except Exception as e:
    print("DB connection failed:", e)
