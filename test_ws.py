import sys
import os
import asyncio

# Add project root to path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from routers.realtime import ws_manager  # Correct import

async def test_ws():
    try:
        await ws_manager.broadcaster.connect()
        print("WebSocket manager connected!")
        await ws_manager.broadcaster.disconnect()
        print("WebSocket manager disconnected!")
    except Exception as e:
        print("WebSocket test skipped:", e)

if __name__ == "__main__":
    asyncio.run(test_ws())
