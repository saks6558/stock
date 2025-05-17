Backup Information
=================

This backup was created on: [Current Date]

Contents:
1. database_backup.sql - MySQL database backup
2. stock/ - Stock management application files
3. stockmgtr/ - Project configuration files
4. media/ - Uploaded media files
5. static/ - Static files (CSS, JS, images)
6. requirements.txt - Python dependencies
7. manage.py - Django management script

To restore this backup:

1. Create a new MySQL database named 'project'
2. Import the database:
   mysql -u root project < database_backup.sql

3. Copy all files back to their original locations
4. Install dependencies:
   pip install -r requirements.txt

5. Run migrations:
   python manage.py migrate

6. Start the server:
   python manage.py runserver 