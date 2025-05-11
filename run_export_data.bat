@echo off
:: cd C:\AR_AP
call venv\Scripts\activate
python -u export_data.py
:: timeout /t 100