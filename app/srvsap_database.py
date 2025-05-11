import config
import pyodbc
from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, sessionmaker


# раздел подключения через sqlalchemy

DATABASE_URL = f"mssql+pyodbc://{config.SAP_DB_USER}:{config.SAP_DB_PASS}@{config.SAP_DB_HOST}:{config.SAP_DB_PORT}/{config.SAP_DB_NAME}?driver={config.SAP_DB_DRIVER}&charset=utf8"
engine = create_engine(DATABASE_URL, fast_executemany=True)
Session = sessionmaker(bind=engine)


# раздел подключения через pyodbc
conn_str = f"DRIVER={{SQL Server Native Client 11.0}};SERVER={config.SAP_DB_HOST},{config.SAP_DB_PORT};DATABASE={config.SAP_DB_NAME};UID={config.SAP_DB_USER};PWD={config.SAP_DB_PASS}"
conn = pyodbc.connect(conn_str)
