from django.core.management.base import BaseCommand
from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from stock.models import RepairRequest
from datetime import datetime, timedelta

class Command(BaseCommand):
    help = 'Send daily repair status report (excluding returned)'

    def handle(self, *args, **kwargs):
        # ดึงรายการแจ้งซ่อมที่ไม่ใช่สถานะ "ส่งคืน"
        repairs = RepairRequest.objects.exclude(status='returned').order_by('status')
        status_map = dict(RepairRequest.STATUS_CHOICES)
        subject = 'แจ้งเตือนสถานะรายการแจ้งซ่อม (10 โมงเช้า)'
        from_email = 'kittitat.t2000@gmail.com'
        to_emails = ['kittitat.t1999@gmail.com', 'nanchaya.tiec@gmail.com', 'Kittitat.p@testinstrument.co.th']
        text_content = 'รายการแจ้งซ่อม (ยกเว้นสถานะส่งคืน):\n' + '\n'.join([
            f"{r.product_name} ({r.customer_name}) - สถานะ: {status_map.get(r.status, r.status)}" for r in repairs
        ])
        now = datetime.now()
        html_rows = []
        for r in repairs:
            days_since = (now - r.created_at.replace(tzinfo=None)).days
            if days_since > 7:
                row = f'<tr style="color:red"><td>{r.product_name}</td><td>{r.customer_name}</td><td>{status_map.get(r.status, r.status)}</td><td>{r.created_at.strftime("%Y-%m-%d")}</td></tr>'
            else:
                row = f'<tr><td>{r.product_name}</td><td>{r.customer_name}</td><td>{status_map.get(r.status, r.status)}</td><td>{r.created_at.strftime("%Y-%m-%d")}</td></tr>'
            html_rows.append(row)
        html_content = f"""
        <html>
        <body>
            <h2>แจ้งเตือนสถานะรายการแจ้งซ่อม (10 โมงเช้า)</h2>
            <table border='1' cellpadding='5' cellspacing='0'>
                <tr><th>ชื่อสินค้า</th><th>ลูกค้า</th><th>สถานะ</th><th>วันที่แจ้ง</th></tr>
                {''.join(html_rows)}
            </table>
            <hr>
            <p>ขอบคุณที่ใช้บริการระบบ Stock Management<br>กิตติธัช พงศาปาน (กาย) 061-050-5996</p>
        </body>
        </html>
        """
        msg = EmailMultiAlternatives(subject, text_content, from_email, to_emails)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
        self.stdout.write(self.style.SUCCESS('Repair status report sent!')) 