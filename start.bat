@echo off
chcp 65001
cls
echo ===================================
echo    Stock Management System
echo ===================================
echo.

echo 1. ตรวจสอบการติดตั้ง...
if not exist "db.sqlite3" (
    echo กำลังติดตั้งระบบ...
    pip install django-environ
    pip install -r requirements.txt
    python manage.py migrate
    echo from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'gayboss43') if not User.objects.filter(username='admin').exists() else None | python manage.py shell
)

echo.
echo 2. กำลังเริ่มระบบ...
echo.
echo เข้าถึงระบบได้ที่:
echo - เครื่องตัวเอง: http://127.0.0.1:8000
echo - เครื่องอื่นในวงแลน: http://192.168.1.54:8000
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