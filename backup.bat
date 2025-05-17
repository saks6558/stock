@echo off
echo ===================================
echo    Stock Management System Backup
echo ===================================
echo.

echo 1. กำลังสำรองข้อมูล...
set BACKUP_DIR=backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_DIR=%BACKUP_DIR: =0%

echo สร้างโฟลเดอร์สำรองข้อมูล: %BACKUP_DIR%
mkdir %BACKUP_DIR%

echo.
echo 2. กำลังคัดลอกไฟล์...
xcopy /E /I /Y stock %BACKUP_DIR%\stock
xcopy /E /I /Y stockmgtr %BACKUP_DIR%\stockmgtr
xcopy /E /I /Y static %BACKUP_DIR%\static
xcopy /E /I /Y media %BACKUP_DIR%\media
xcopy /Y manage.py %BACKUP_DIR%
xcopy /Y requirements.txt %BACKUP_DIR%
xcopy /Y setup.bat %BACKUP_DIR%
xcopy /Y run.bat %BACKUP_DIR%
xcopy /Y db.sqlite3 %BACKUP_DIR%

echo.
echo 3. กำลังบีบอัดไฟล์...
powershell Compress-Archive -Path %BACKUP_DIR% -DestinationPath %BACKUP_DIR%.zip -Force

echo.
echo 4. กำลังลบโฟลเดอร์ชั่วคราว...
rmdir /S /Q %BACKUP_DIR%

echo.
echo ===================================
echo    สำรองข้อมูลเสร็จสมบูรณ์
echo ===================================
echo.
echo ไฟล์สำรองข้อมูล: %BACKUP_DIR%.zip
echo.
echo วิธีการย้ายเครื่อง:
echo 1. คัดลอกไฟล์ %BACKUP_DIR%.zip ไปยังเครื่องใหม่
echo 2. แตกไฟล์ %BACKUP_DIR%.zip
echo 3. รัน setup.bat ในโฟลเดอร์ที่แตกไฟล์
echo.
echo ===================================
pause 