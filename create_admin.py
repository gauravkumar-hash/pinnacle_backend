from supabase import create_client

SUPABASE_URL = "https://gifnhplktpyppzfbmzch.supabase.co"
SUPABASE_SERVICE_ROLE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdpZm5ocGxrdHB5cHB6ZmJtemNoIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODM3MjEwMCwiZXhwIjoyMDgzOTQ4MTAwfQ.MC0IcQraiwCyzBv_qzj2Sy25_L7L-reAYhtc0rc2hxc"

supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

# Use dict syntax for admin.create_user
user = supabase.auth.admin.create_user({
    "email": "admin@local.com",
    "password": "Admin@123456",
    "email_confirm": True
})

print("USER CREATED:")
print(user)
