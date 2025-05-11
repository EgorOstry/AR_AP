import config
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE_URL = f"mssql+pyodbc://{config.DIR_DB_USER}:{config.DIR_DB_PASS}@{config.DIR_DB_HOST}:{config.DIR_DB_PORT}/{config.DIR_DB_NAME}?driver={config.DIR_DB_DRIVER}&charset=utf8"
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)

# строка для подключения к объектам Directum
connection_string = f"ServerName={config.DIR_DB_HOST};DBName={config.DIR_DB_NAME};username={config.DIR_DB_USER};password={config.DIR_DB_PASS}"
