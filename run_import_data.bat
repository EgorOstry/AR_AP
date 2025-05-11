@echo off
:: cd C:\AR_AP
call venv\Scripts\activate
python -u import_data.py
:: timeout /t 100