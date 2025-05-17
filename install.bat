@echo off
chcp 65001
cls
echo ===================================
echo    ติดตั้ง Stock Management System
echo ===================================
echo.

echo 1. กำลังตรวจสอบไฟล์ที่จำเป็น...
if not exist "requirements.txt" (
    echo [ERROR] ไม่พบไฟล์ requirements.txt
    echo กรุณาตรวจสอบว่าได้คัดลอกไฟล์ทั้งหมดมาครบถ้วน
    pause
    exit /b 1
)

if not exist "manage.py" (
    echo [ERROR] ไม่พบไฟล์ manage.py
    echo กรุณาตรวจสอบว่าได้คัดลอกไฟล์ทั้งหมดมาครบถ้วน
    pause
    exit /b 1
)

if not exist "stockmgtr" (
    echo [ERROR] ไม่พบโฟลเดอร์ stockmgtr
    echo กรุณาตรวจสอบว่าได้คัดลอกไฟล์ทั้งหมดมาครบถ้วน
    pause
    exit /b 1
)

echo 2. กำลังตรวจสอบ Python...
python --version
if errorlevel 1 (
    echo [ERROR] ไม่พบ Python กรุณาติดตั้ง Python ก่อน
    echo ดาวน์โหลด Python ได้ที่: https://www.python.org/downloads/
    echo หมายเหตุ: ต้องติดตั้ง Python เวอร์ชัน 3.8 หรือสูงกว่า
    pause
    exit /b 1
)

echo.
echo 3. กำลังติดตั้ง dependencies...
echo กำลังติดตั้ง django-environ...
pip install django-environ
if errorlevel 1 (
    echo [ERROR] ไม่สามารถติดตั้ง django-environ ได้
    pause
    exit /b 1
)

echo กำลังติดตั้ง requirements...
pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] ไม่สามารถติดตั้ง requirements ได้
    pause
    exit /b 1
)

echo.
echo 4. กำลังตั้งค่าฐานข้อมูล...
python manage.py migrate
if errorlevel 1 (
    echo [ERROR] ไม่สามารถทำ migrate ได้
    pause
    exit /b 1
)

echo.
echo 5. กำลังสร้าง superuser...
echo from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'gayboss43') if not User.objects.filter(username='admin').exists() else None | python manage.py shell

echo.
echo ===================================
echo    ติดตั้งเสร็จสมบูรณ์
echo ===================================
echo.
echo ข้อมูลเข้าสู่ระบบ:
echo - Username: admin
echo - Password: gayboss43
echo.
echo ใช้ไฟล์ run_server.bat เพื่อเริ่มระบบ
echo.
pause 