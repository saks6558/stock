@echo off
chcp 65001
cls
echo ===================================
echo    ติดตั้ง Stock Management System
echo ===================================
echo.

echo 1. กำลังตรวจสอบ Python...
python --version > nul 2>&1
if errorlevel 1 (
    echo [INFO] ไม่พบ Python กำลังดาวน์โหลด...
    echo กำลังดาวน์โหลด Python 3.8.10...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe' -OutFile 'python-installer.exe'}"
    echo กำลังติดตั้ง Python...
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python-installer.exe
    echo [INFO] ติดตั้ง Python เสร็จสิ้น
)

echo.
echo 2. กำลังสร้างโครงสร้างโปรเจค...
if not exist "stockmgtr" mkdir stockmgtr
if not exist "stock" mkdir stock
if not exist "media" mkdir media
if not exist "static" mkdir static

echo 3. กำลังสร้างไฟล์ requirements.txt...
echo django==3.2.4 > requirements.txt
echo django-environ==0.8.0 >> requirements.txt
echo pillow==9.0.0 >> requirements.txt
echo reportlab==3.6.8 >> requirements.txt

echo 4. กำลังสร้างไฟล์ manage.py...
echo import os > manage.py
echo import sys >> manage.py
echo. >> manage.py
echo if __name__ == "__main__": >> manage.py
echo     os.environ.setdefault("DJANGO_SETTINGS_MODULE", "stockmgtr.settings") >> manage.py
echo     try: >> manage.py
echo         from django.core.management import execute_from_command_line >> manage.py
echo     except ImportError as exc: >> manage.py
echo         raise ImportError( >> manage.py
echo             "Couldn't import Django. Are you sure it's installed?" >> manage.py
echo         ) from exc >> manage.py
echo     execute_from_command_line(sys.argv) >> manage.py

echo 5. กำลังสร้างไฟล์ settings.py...
if not exist "stockmgtr\settings.py" (
    echo from pathlib import Path > stockmgtr\settings.py
    echo import os >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo BASE_DIR = Path(__file__).resolve().parent.parent >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo SECRET_KEY = 'django-insecure-1234567890abcdefghijklmnopqrstuvwxyz' >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo DEBUG = True >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo ALLOWED_HOSTS = ['*'] >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo INSTALLED_APPS = [ >> stockmgtr\settings.py
    echo     'django.contrib.admin', >> stockmgtr\settings.py
    echo     'django.contrib.auth', >> stockmgtr\settings.py
    echo     'django.contrib.contenttypes', >> stockmgtr\settings.py
    echo     'django.contrib.sessions', >> stockmgtr\settings.py
    echo     'django.contrib.messages', >> stockmgtr\settings.py
    echo     'django.contrib.staticfiles', >> stockmgtr\settings.py
    echo     'stock', >> stockmgtr\settings.py
    echo ] >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo MIDDLEWARE = [ >> stockmgtr\settings.py
    echo     'django.middleware.security.SecurityMiddleware', >> stockmgtr\settings.py
    echo     'django.contrib.sessions.middleware.SessionMiddleware', >> stockmgtr\settings.py
    echo     'django.middleware.common.CommonMiddleware', >> stockmgtr\settings.py
    echo     'django.middleware.csrf.CsrfViewMiddleware', >> stockmgtr\settings.py
    echo     'django.contrib.auth.middleware.AuthenticationMiddleware', >> stockmgtr\settings.py
    echo     'django.contrib.messages.middleware.MessageMiddleware', >> stockmgtr\settings.py
    echo     'django.middleware.clickjacking.XFrameOptionsMiddleware', >> stockmgtr\settings.py
    echo ] >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo ROOT_URLCONF = 'stockmgtr.urls' >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo TEMPLATES = [ >> stockmgtr\settings.py
    echo     { >> stockmgtr\settings.py
    echo         'BACKEND': 'django.template.backends.django.DjangoTemplates', >> stockmgtr\settings.py
    echo         'DIRS': [], >> stockmgtr\settings.py
    echo         'APP_DIRS': True, >> stockmgtr\settings.py
    echo         'OPTIONS': { >> stockmgtr\settings.py
    echo             'context_processors': [ >> stockmgtr\settings.py
    echo                 'django.template.context_processors.debug', >> stockmgtr\settings.py
    echo                 'django.template.context_processors.request', >> stockmgtr\settings.py
    echo                 'django.contrib.auth.context_processors.auth', >> stockmgtr\settings.py
    echo                 'django.contrib.messages.context_processors.messages', >> stockmgtr\settings.py
    echo             ], >> stockmgtr\settings.py
    echo         }, >> stockmgtr\settings.py
    echo     }, >> stockmgtr\settings.py
    echo ] >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo WSGI_APPLICATION = 'stockmgtr.wsgi.application' >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo DATABASES = { >> stockmgtr\settings.py
    echo     'default': { >> stockmgtr\settings.py
    echo         'ENGINE': 'django.db.backends.sqlite3', >> stockmgtr\settings.py
    echo         'NAME': BASE_DIR / 'db.sqlite3', >> stockmgtr\settings.py
    echo     } >> stockmgtr\settings.py
    echo } >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo AUTH_PASSWORD_VALIDATORS = [ >> stockmgtr\settings.py
    echo     { >> stockmgtr\settings.py
    echo         'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator', >> stockmgtr\settings.py
    echo     }, >> stockmgtr\settings.py
    echo     { >> stockmgtr\settings.py
    echo         'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator', >> stockmgtr\settings.py
    echo     }, >> stockmgtr\settings.py
    echo     { >> stockmgtr\settings.py
    echo         'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator', >> stockmgtr\settings.py
    echo     }, >> stockmgtr\settings.py
    echo     { >> stockmgtr\settings.py
    echo         'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator', >> stockmgtr\settings.py
    echo     }, >> stockmgtr\settings.py
    echo ] >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo LANGUAGE_CODE = 'th-th' >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo TIME_ZONE = 'Asia/Bangkok' >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo USE_I18N = True >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo USE_L10N = True >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo USE_TZ = True >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo STATIC_URL = '/static/' >> stockmgtr\settings.py
    echo STATIC_ROOT = os.path.join(BASE_DIR, 'static') >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo MEDIA_URL = '/media/' >> stockmgtr\settings.py
    echo MEDIA_ROOT = os.path.join(BASE_DIR, 'media') >> stockmgtr\settings.py
    echo. >> stockmgtr\settings.py
    echo DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField' >> stockmgtr\settings.py
)

echo 6. กำลังสร้างไฟล์ urls.py...
if not exist "stockmgtr\urls.py" (
    echo from django.contrib import admin > stockmgtr\urls.py
    echo from django.urls import path, include >> stockmgtr\urls.py
    echo from django.conf import settings >> stockmgtr\urls.py
    echo from django.conf.urls.static import static >> stockmgtr\urls.py
    echo. >> stockmgtr\urls.py
    echo urlpatterns = [ >> stockmgtr\urls.py
    echo     path('admin/', admin.site.urls), >> stockmgtr\urls.py
    echo     path('', include('stock.urls')), >> stockmgtr\urls.py
    echo ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) >> stockmgtr\urls.py
)

echo 7. กำลังสร้างไฟล์ wsgi.py...
if not exist "stockmgtr\wsgi.py" (
    echo import os > stockmgtr\wsgi.py
    echo from django.core.wsgi import get_wsgi_application >> stockmgtr\wsgi.py
    echo. >> stockmgtr\wsgi.py
    echo os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'stockmgtr.settings') >> stockmgtr\wsgi.py
    echo. >> stockmgtr\wsgi.py
    echo application = get_wsgi_application() >> stockmgtr\wsgi.py
)

echo 8. กำลังสร้างไฟล์ asgi.py...
if not exist "stockmgtr\asgi.py" (
    echo import os > stockmgtr\asgi.py
    echo from django.core.asgi import get_asgi_application >> stockmgtr\asgi.py
    echo. >> stockmgtr\asgi.py
    echo os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'stockmgtr.settings') >> stockmgtr\asgi.py
    echo. >> stockmgtr\asgi.py
    echo application = get_asgi_application() >> stockmgtr\asgi.py
)

echo 9. กำลังสร้างไฟล์ __init__.py...
if not exist "stockmgtr\__init__.py" type nul > stockmgtr\__init__.py
if not exist "stock\__init__.py" type nul > stock\__init__.py

echo 10. กำลังติดตั้ง dependencies...
pip install -r requirements.txt

echo 11. กำลังทำการ migrate...
python manage.py makemigrations
python manage.py migrate

echo 12. กำลังสร้าง superuser...
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