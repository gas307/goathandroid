from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from auth.google_auth import verify_google_token, is_user_in_db

app = FastAPI()

# Opcjonalnie: CORS, jeśli potrzebujesz
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/auth/google")
def auth_google(token: str):
    print(f"🔐 Otrzymany token: {token}")
    
    email = verify_google_token(token)
    if not email:
        print("❌ Nieprawidłowy token")
        raise HTTPException(status_code=401, detail="Invalid token")

    print(f"📩 Email z tokena: {email}")
    
    if is_user_in_db(email):
        print("✅ Email jest w bazie danych")
        return {"status": "success", "email": email}
    else:
        print("❌ Email NIE istnieje w bazie danych")
        raise HTTPException(status_code=403, detail="Unauthorized user")


