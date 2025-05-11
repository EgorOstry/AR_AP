import os
from datetime import date
from dotenv import load_dotenv


dotenv_path=os.path.join(os.path.dirname(__file__), ".env")
load_dotenv(dotenv_path=dotenv_path)



UPP_DB_USER = os.getenv("UPP_DB_USER")
UPP_DB_PASS = os.getenv("UPP_DB_PASS")
UPP_DB_HOST= os.getenv("UPP_DB_HOST")
UPP_DB_PORT = os.getenv("UPP_DB_PORT")
UPP_DB_NAME = os.getenv("UPP_DB_NAME")
UPP_DB_DRIVER = os.getenv("UPP_DB_DRIVER")

SAP_DB_USER = os.getenv("SAP_DB_USER")
SAP_DB_PASS = os.getenv("SAP_DB_PASS")
SAP_DB_HOST= os.getenv("SAP_DB_HOST")
SAP_DB_PORT = os.getenv("SAP_DB_PORT")
SAP_DB_NAME = os.getenv("SAP_DB_NAME")
SAP_DB_DRIVER = os.getenv("SAP_DB_DRIVER")

DIR_DB_USER = os.getenv("DIR_DB_USER")
DIR_DB_PASS = os.getenv("DIR_DB_PASS")
DIR_DB_HOST= os.getenv("DIR_DB_HOST")
DIR_DB_PORT = os.getenv("DIR_DB_PORT")
DIR_DB_NAME = os.getenv("DIR_DB_NAME")
DIR_DB_DRIVER = os.getenv("DIR_DB_DRIVER")

excel_reports_path = os.getenv("EXCEL_REPORTS_PATH")
csv_exp_imp_dir = os.getenv("CSV_EXP_IMP_DIR")
export_to_csv_query_dir = os.getenv("EXP_TO_CSV_QUERY_DIR")

sql_query_file = os.path.join(export_to_csv_query_dir, "select_from_upp.sql")
csv_data = os.path.join(csv_exp_imp_dir, "data.csv")

stage_table_name = os.getenv("DST_STAGE_NAME")

exp_to_csv_sqlcmd_command = [
    "sqlcmd",
    "-S", f"{UPP_DB_HOST},{UPP_DB_PORT}",
    "-U", UPP_DB_USER,
    "-P", UPP_DB_PASS,
    "-d", UPP_DB_NAME,
    "-i", sql_query_file,  # SQL-запрос
    "-s", ",",  # Разделитель - запятая (CSV)
    "-W",
    "-f", "65001",  # UTF-8
    "-o", csv_data  # Выходной CSV файл
]

today = date.today()
today_str = today.strftime("%d.%m.%Y")
year, week_num, weekday = today.isocalendar()


task_subject = f'''Дебиторская задолженность, {week_num} неделя'''

task_body = f'''Предоставить комментарии по статусу дебиторской задолженности (ДЗ) во ВЛОЖЕННОМ ФАЙЛЕ (колонка, выделенная, желтым). В случае неизменности статуса – оставить ранее внесенное значение.
Срез данных - на 13:00 {today_str} по Челябинску
Выполнить задачу и заполнить комментарии необходимо в течение УСТАНОВЛЕННОГО СРОКА ЗАДАЧИ. 

!!!ЗАДАЧИ, ВЫПОЛНЕННЫЕ ПО ИСТЕЧЕНИЕ СРОКА, НЕ БУДУТ УЧТЕНЫ В ОТЧЕТНОСТИ!!!
!!!ДОПОЛНИТЕЛЬНЫЕ ВЛОЖЕНИЯ И ВЛОЖЕНИЯ С ИЗМЕНЕННЫМ ИМЕНЕМ НЕ УЧИТЫВАЮТСЯ!!!
!!!КОММЕНТАРИИ, ВНЕСЕННЫЕ В ЯЧЕЙКИ, НЕ ВЫДЕЛЕННЫЕ ЖЕЛТЫМ, НЕ УЧИТЫВАЮТСЯ!!!

На листе «Детализация» приведены подробности возникновения суммы ДЗ (для удобства работы следует воспользоваться кнопкой «Фильтр» в Excel).'''

task_subject = task_subject.replace("\n", "\r\n")
task_body = task_body.replace("\n", "\r\n")
