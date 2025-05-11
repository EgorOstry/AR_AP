import config
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE_URL = f"mssql+pyodbc://{config.UPP_DB_USER}:{config.UPP_DB_PASS}@{config.UPP_DB_HOST}:{config.UPP_DB_PORT}/{config.UPP_DB_NAME}?driver={config.UPP_DB_DRIVER}&charset=utf8"
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)



