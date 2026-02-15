# SqlAlchemy engine and session

# database.py

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# SQLite connection
DATABASE_URL = "sqlite:////Users/tcollier/Dropbox/Amateur Radio/MACLoggerDX/MLDX_Logs/HARC_SNN_3_PROD.sql"  # Adjust path if necessary

engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


# Dependency to get DB session

def get_session():
	db = SessionLocal()
	try:
		yield db
	finally:
		db.close()
