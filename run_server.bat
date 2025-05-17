@echo off
chcp 65001
cls
echo ===================================
echo    Stock Management System
echo ===================================
echo.
echo กำลังเริ่มระบบ...
echo.
echo เข้าถึงระบบได้ที่:
echo - เครื่องตัวเอง: http://127.0.0.1:8000
echo - เครื่องอื่นในวงแลน: http://%COMPUTERNAME%:8000
echo.
echo ข้อมูลเข้าสู่ระบบ:
echo - Username: admin
echo - Password: gayboss43
echo.
echo กด Ctrl+C เพื่อหยุดการทำงาน
echo.
echo ===================================
echo.

set SECRET_KEY=django-insecure-1234567890abcdefghijklmnopqrstuvwxyz
set PASSWORD=szpjclceizqmyyus

python manage.py runserver 0.0.0.0:8000 