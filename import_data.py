import config
from app.procedure import TaskCreator
from app.logger_decorator import log_dec


@log_dec
def main():
    procedure = TaskCreator(config.excel_reports_path, config.csv_exp_imp_dir)
    procedure.run()


if __name__ == '__main__':
    main()