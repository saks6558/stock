stock-management-backup
วิธีการย้ายโปรเจคไปยังเครื่องใหม่:
บนเครื่องปัจจุบัน:
สร้างโฟลเดอร์ใหม่ชื่อ stock-management-backup
คัดลอกไฟล์และโฟลเดอร์ต่อไปนี้ไปยังโฟลเดอร์ stock-management-backup:
โฟลเดอร์ stockmgtr
โฟลเดอร์ stock
โฟลเดอร์ media
โฟลเดอร์ static
ไฟล์ manage.py
ไฟล์ requirements.txt
ไฟล์ db.sqlite3
ไฟล์ run_server.bat
สร้างไฟล์ ZIP จากโฟลเดอร์ stock-management-backup
บนเครื่องใหม่:
ติดตั้ง Python 3.8 หรือสูงกว่า
แก้ไขไฟล์ run_server.bat ให้แสดง IP ที่ถูกต้อง (ผมได้แก้ไขให้ใช้ %COMPUTERNAME% ซึ่งจะแสดงชื่อเครื่องโดยอัตโนมัติ)
ดับเบิลคลิกที่ไฟล์ run_server.bat เพื่อเริ่มระบบ
ข้อมูลเข้าสู่ระบบยังคงเหมือนเดิม:
Username: admin
Password: gayboss43
ต้องการให้ผมช่วยสร้างไฟล์ batch สำหรับการสำรองข้อมูลและย้ายโปรเจคไหมครับ?