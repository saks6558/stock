from django.core.management.base import BaseCommand
from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from stock.models import Stock, RepairRequest
from django.db import models

class Command(BaseCommand):
    help = 'Send daily stock and repair report'

    def handle(self, *args, **kwargs):
        total_stock = Stock.objects.aggregate(total=models.Sum('quantity'))['total'] or 0
        repair_count = RepairRequest.objects.count()
        # สต็อกต่ำกว่าระดับแจ้งเตือน
        low_stocks = Stock.objects.filter(quantity__lte=models.F('re_order'))
        # รายการแจ้งซ่อมที่ยังไม่เสร็จ
        pending_repairs = RepairRequest.objects.exclude(status='done')
        subject = 'Daily Stock & Repair Report'
        from_email = 'kittitat.t2000@gmail.com'
        to_emails = ['kittitat.t1999@gmail.com', 'nanchaya.tiec@gmail.com']
        text_content = f"จำนวนสต็อกทั้งหมด: {total_stock}\nรายการแจ้งซ่อม: {repair_count}"
        html_content = f"""
        <html>
        <body>
            <h2>รายงานประจำวัน (Daily Report)</h2>
            <ul>
                <li><strong>จำนวนสต็อกทั้งหมด:</strong> {total_stock}</li>
                <li><strong>รายการแจ้งซ่อม:</strong> {repair_count}</li>
            </ul>
            <h3>แจ้งเตือนสต็อกต่ำ</h3>
            <table border='1' cellpadding='5' cellspacing='0'>
                <tr><th>ชื่อสินค้า</th><th>จำนวนคงเหลือ</th><th>ระดับแจ้งเตือน</th></tr>
                {''.join(f'<tr><td>{s.item_name}</td><td>{s.quantity}</td><td>{s.re_order}</td></tr>' for s in low_stocks)}
            </table>
            <h3>รายการแจ้งซ่อมที่ยังไม่เสร็จ</h3>
            <ul>
                {''.join(f'<li>{r.product_name} ({r.customer_name}) - สถานะ: {r.get_status_display()}</li>' for r in pending_repairs)}
            </ul>
            <hr>
            <p>ขอบคุณที่ใช้บริการระบบ Stock Management<br>กิตติธัช พงศาปาน (กาย) 061-050-5996</p>
        </body>
        </html>
        """
        msg = EmailMultiAlternatives(subject, text_content, from_email, to_emails)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
        self.stdout.write(self.style.SUCCESS('Daily report sent!')) 