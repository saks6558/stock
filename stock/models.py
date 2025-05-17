from django.db import models


# Create your models here.
# A way to add a choice box
# payment_method = (
#     ('Cash', 'Cash'),
#     ('Transfer', 'Transfer'),
#     ('Cheque', 'Cheque')
# )


class Category(models.Model):
    group = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')

    def __str__(self):
        return self.group


class Stock(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True)
    item_name = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    quantity = models.IntegerField(default='0', blank=True, null=True)
    receive_quantity = models.IntegerField(default='0', blank=True, null=True)
    received_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    issue_quantity = models.IntegerField(default='0', blank=True, null=True)
    issued_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    issued_to = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    phone_number = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    created_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    re_order = models.IntegerField(default='0', blank=True, null=True)
    last_updated = models.DateTimeField(auto_now_add=False, auto_now=True)
    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    date = models.DateTimeField(auto_now_add=False, auto_now=False)
    export_to_csv = models.BooleanField(default=False)
    image = models.ImageField(upload_to='stock/static/images', null=True, blank=True)

    def __str__(self):
        return self.item_name + " " + str(self.quantity) + " " + str(self.last_updated)


class StockHistory(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True)
    item_name = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    quantity = models.IntegerField(default='0', blank=True, null=True)
    receive_quantity = models.IntegerField(default='0', blank=True, null=True)
    received_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    issue_quantity = models.IntegerField(default='0', blank=True, null=True)
    issued_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    issued_to = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    phone_number = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    created_by = models.CharField(max_length=50, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    re_order = models.IntegerField(default='0', blank=True, null=True)
    last_updated = models.DateTimeField(auto_now_add=False, auto_now=False, null=True)
    timestamp = models.DateTimeField(auto_now_add=False, auto_now=False, null=True)


class User(models.Model):
    user = models.TextField(default=None)

    def __str__(self):
        return self.user


class Country(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class State(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class City(models.Model):
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Person(models.Model):
    name = models.CharField(max_length=150, db_collation='utf8mb4_unicode_ci')
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, blank=True, null=True)
    state = models.ForeignKey(State, on_delete=models.SET_NULL, blank=True, null=True)
    city = models.ForeignKey(City, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return self.name


class Scrums(models.Model):
    task = models.CharField(max_length=100, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    task_description = models.CharField(max_length=100, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    task_date = models.DateTimeField(auto_now_add=False, auto_now=False, null=True, blank=True)

    def __str__(self):
        return self.task


class ScrumTitles(models.Model):
    lists = models.CharField(max_length=150, blank=True, null=True, db_collation='utf8mb4_unicode_ci')

    def __str__(self):
        return str(self.lists)


class Contacts(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    email = models.EmailField(max_length=100, blank=True, null=True)
    occupation = models.CharField(max_length=100, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    phone = models.CharField(max_length=100, blank=100, null=True, db_collation='utf8mb4_unicode_ci')
    location = models.CharField(max_length=100, blank=True, null=True, db_collation='utf8mb4_unicode_ci')
    image = models.ImageField(upload_to='stock/static/images', null=True, blank=True)

    def __str__(self):
        return str(self.name)


class RepairRequest(models.Model):
    STATUS_CHOICES = [
        ('estimate', 'ประเมิน'),
        ('in_progress', 'ดำเนินการซ่อม'),
        ('done', 'ซ่อมเสร็จ'),
        ('returned', 'ส่งคืน'),
    ]
    product_name = models.CharField(max_length=100, db_collation='utf8mb4_unicode_ci')
    customer_name = models.CharField(max_length=100, db_collation='utf8mb4_unicode_ci')
    address = models.TextField(db_collation='utf8mb4_unicode_ci')
    serial_number = models.CharField(max_length=100, db_collation='utf8mb4_unicode_ci')
    problem = models.TextField(db_collation='utf8mb4_unicode_ci')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='estimate', db_collation='utf8mb4_unicode_ci')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.product_name} - {self.customer_name}"
