# test_all.py
import os
import asyncio
from sqlalchemy import create_engine, text
from dotenv import load_dotenv  # For loading environment variables

# Load environment variables from .env
load_dotenv()

# --- DATABASE TEST ---
print("=== Testing Database Connection ===")
db_url = os.getenv("POSTGRES_URL")
if not db_url:
    print("POSTGRES_URL not set in environment variables!")
else:
    try:
        engine = create_engine(db_url)
        with engine.connect() as conn:
            result = conn.execute(text("SELECT 1"))
            print("Database connected! Result:", result.scalar())
    except Exception as e:
        print("Database connection failed:", e)

# --- REDIS / WEBSOCKET TEST ---
print("\n=== Testing WebSocket / Redis ===")
try:
    from routers.realtime import ws_manager  # Import your WebSocket manager

    async def test_ws():
        try:
            await ws_manager.broadcaster.connect()
            print("WebSocket manager connected!")
            await ws_manager.broadcaster.disconnect()
            print("WebSocket manager disconnected!")
        except Exception as e:
            print("WebSocket test failed:", e)

    asyncio.run(test_ws())
except ModuleNotFoundError as e:
    print("WebSocket module not found:", e)
except Exception as e:
    print("WebSocket test setup failed:", e)

# --- FIREBASE TEST ---
print("\n=== Testing Firebase Credentials ===")
try:
    import firebase_admin
    from config import firebase_app  # Use already initialized Firebase app

    print("Firebase app is already initialized:", firebase_app.name)

    # Optional: test something with Firebase
    # from firebase_admin import auth
    # users = auth.list_users().users
    # print("Number of users in Firebase Auth:", len(users))

except ModuleNotFoundError:
    print("Firebase SDK not installed!")
except ImportError as e:
    print("Firebase app not found in config.py:", e)
except Exception as e:
    print("Firebase test failed:", e)
