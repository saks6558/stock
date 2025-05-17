from django.contrib import admin
from .form import *
from .models import RepairRequest, Stock, StockHistory, Category


# Register your models here.


class StockCreateAdmin(admin.ModelAdmin):
    list_display = ['category', 'item_name', 'quantity']
    form = StockCreateForm
    list_filter = ['category']
    search_fields = ['category', 'item_name']


class RepairRequestAdmin(admin.ModelAdmin):
    list_display = ['product_name', 'customer_name', 'status', 'created_at']
    list_filter = ['status', 'created_at']
    search_fields = ['product_name', 'customer_name', 'serial_number']
    readonly_fields = ['created_at']
    list_editable = ['status']
    list_per_page = 20


@admin.register(StockHistory)
class StockHistoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'item_name', 'quantity', 'issue_quantity', 'receive_quantity', 'issued_by', 'received_by', 'last_updated')
    list_filter = ('category', 'last_updated')
    search_fields = ('item_name', 'issued_by', 'received_by')
    date_hierarchy = 'last_updated'
    ordering = ('-last_updated',)
    readonly_fields = ('timestamp',)
    
    fieldsets = (
        ('ข้อมูลสินค้า', {
            'fields': ('category', 'item_name', 'quantity', 're_order')
        }),
        ('ข้อมูลการเบิก-จ่าย', {
            'fields': ('issue_quantity', 'receive_quantity', 'issued_by', 'received_by', 'issued_to', 'phone_number')
        }),
        ('ข้อมูลเวลา', {
            'fields': ('last_updated', 'timestamp')
        }),
    )


admin.site.register(Stock, StockCreateAdmin)
admin.site.register(Category)
admin.site.register(User)
admin.site.register(Country)
admin.site.register(State)
admin.site.register(City)
admin.site.register(Person)
admin.site.register(Contacts)
admin.site.register(RepairRequest, RepairRequestAdmin)
