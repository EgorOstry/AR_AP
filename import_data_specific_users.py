import config
from app.procedure import TaskCreator
from app.logger_decorator import log_dec


@log_dec
def main():
    # upp_users_codes_list = ["РР0007897"] # Комарова
    # upp_users_codes_list = ["ЭА0001883"] # Зубкова
    upp_users_codes_list = ["ЭА0001768"]  # Стручкова
    procedure = TaskCreator(config.excel_reports_path, config.csv_exp_imp_dir, upp_users_codes_list=upp_users_codes_list, manual_dir_body_text='TEST_1 2025-06-05')
    procedure.run()


if __name__ == '__main__':
    main()