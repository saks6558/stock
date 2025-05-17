# Stock Management System

ระบบจัดการสินค้าคงคลังที่พัฒนาด้วย Django Framework

## 📋 คุณสมบัติหลัก

- ระบบจัดการสินค้าคงคลัง
- ระบบจัดการผู้ใช้
- ระบบรายงาน
- ระบบแจ้งเตือนสินค้าใกล้หมด
- ระบบสำรองข้อมูล
- ระบบจัดการรูปภาพสินค้า

## 🚀 การติดตั้ง

### 1. ความต้องการของระบบ
- Python 3.8.10 หรือสูงกว่า
- Windows 10 หรือสูงกว่า
- พื้นที่ว่างอย่างน้อย 500MB

### 2. ดาวน์โหลดและติดตั้ง Python
1. ดาวน์โหลด Python 3.8.10 จาก [Python.org](https://www.python.org/downloads/release/python-3810/)
2. ติดตั้ง Python โดยเลือก "Add Python to PATH"
3. ตรวจสอบการติดตั้งโดยเปิด Command Prompt และพิมพ์:
```bash
python --version
```

### 3. ติดตั้งระบบ
1. ดาวน์โหลดโปรเจคจาก [GitHub Repository](https://github.com/yourusername/stock-management)
2. แตกไฟล์ ZIP ไปยังโฟลเดอร์ที่ต้องการ
3. ดับเบิลคลิกที่ไฟล์ `setup.bat`
4. รอให้ระบบติดตั้งเสร็จสิ้น

### 4. เริ่มใช้งานระบบ
1. ดับเบิลคลิกที่ไฟล์ `run_server.bat`
2. เปิดเว็บเบราว์เซอร์และไปที่ [http://localhost:8000](http://localhost:8000)

## 👤 ข้อมูลเข้าสู่ระบบเริ่มต้น
- Username: admin
- Password: gayboss43

## 📁 โครงสร้างโปรเจค
```
stock-managementguy/
├── stock/                  # แอพพลิเคชันหลัก
│   ├── models.py          # โมเดลฐานข้อมูล
│   ├── views.py           # ตัวควบคุมการทำงาน
│   ├── urls.py            # การกำหนดเส้นทาง URL
│   └── templates/         # ไฟล์ HTML
├── stockmgtr/             # การตั้งค่าโปรเจค
│   ├── settings.py        # การตั้งค่าระบบ
│   └── urls.py            # URL หลัก
├── media/                 # ไฟล์รูปภาพ
├── static/                # ไฟล์ CSS, JavaScript
├── backup/                # ไฟล์สำรองข้อมูล
└── manage.py              # ไฟล์จัดการ Django
```

## 🔧 การตั้งค่าเพิ่มเติม

### การตั้งค่า Email
แก้ไขไฟล์ `.env` ในโฟลเดอร์หลัก:
```
SECRET_KEY=your_secret_key
PASSWORD=your_email_password
```

### การสำรองข้อมูล
1. ดับเบิลคลิกที่ไฟล์ `backup.bat`
2. ไฟล์สำรองจะถูกเก็บในโฟลเดอร์ `backup/`

## 📚 เอกสารเพิ่มเติม
- [Django Documentation](https://docs.djangoproject.com/en/3.2/)
- [Python Documentation](https://docs.python.org/3.8/)
- [Bootstrap Documentation](https://getbootstrap.com/docs/4.6/)

## 🛠️ การแก้ไขปัญหา

### ปัญหาที่พบบ่อย
1. **ไม่สามารถติดตั้ง Python ได้**
   - ตรวจสอบว่าได้ดาวน์โหลดเวอร์ชันที่ถูกต้อง
   - ตรวจสอบการตั้งค่า Windows Defender

2. **ไม่สามารถรันเซิร์ฟเวอร์ได้**
   - ตรวจสอบว่า Python ถูกติดตั้งถูกต้อง
   - ตรวจสอบว่าไม่มีโปรแกรมอื่นใช้พอร์ต 8000

3. **ไม่สามารถเข้าสู่ระบบได้**
   - ตรวจสอบการเชื่อมต่ออินเทอร์เน็ต
   - ตรวจสอบการตั้งค่าไฟล์ .env

## 📞 ติดต่อผู้พัฒนา
- Email: kittitat.t2000@gmail.com
- GitHub: [Your GitHub Profile]
- Website: [Your Website]

## 📄 ลิขสิทธิ์
© 2024 Stock Management System. All rights reserved.

## 🔄 การอัปเดต
- เวอร์ชัน 1.0.0 (2024-03-20)
  - เพิ่มระบบจัดการสินค้า
  - เพิ่มระบบรายงาน
  - เพิ่มระบบสำรองข้อมูล

## ⚠️ หมายเหตุ
- ระบบนี้พัฒนาสำหรับ Windows เท่านั้น
- ควรสำรองข้อมูลเป็นประจำ
- ควรเปลี่ยนรหัสผ่านเริ่มต้นหลังจากติดตั้ง
