from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    path('', views.get_client_ip, name="home"),
    path('view_stock', views.view_stock, name="view_stock"),
    path('add_stock', views.add_stock, name="add_stock"),
    path('update_stock/<str:pk>/', views.update_stock, name="update_stock"),
    path('delete_stock/<str:pk>/', views.delete_stock, name="delete_stock"),
    path('stock_detail/<str:pk>/', views.stock_detail, name="stock_detail"),
    path('issue_item/<str:pk>/', views.issue_item, name="issue_item"),
    path('receive_item/<str:pk>/', views.receive_item, name="receive_item"),
    path('re_order/<str:pk>/', views.re_order, name="re_order"),
    path('view_history', views.view_history, name="view_history"),
    path('dependent_forms', views.dependent_forms, name='dependent_forms'),
    path('dependent_update/<str:pk>/', views.dependent_forms_update, name='dependent_update'),
    path('depend_form_view', views.dependent_forms_view, name='depend_form_view'),
    path('depend_form_delete/<str:pk>', views.delete_dependant, name='delete_dependant'),
    path('ajax/load-states/', views.load_stats, name='ajax_load_states'),
    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('scrumboard', views.scrum_list, name='scrumboard'),
    path('scrumboard_view', views.scrum_view, name='scrumboard_view'),
    path('contacts', views.contact, name='contacts'),
    path('accounts/login/', auth_views.LoginView.as_view(template_name='stock/login.html'), name='login'),
    path('accounts/logout/', auth_views.LogoutView.as_view(next_page='/'), name='logout'),
    path('add_repair_request/', views.add_repair_request, name='add_repair_request'),
    path('repair_list/', views.repair_list, name='repair_list'),
    path('send_daily_report_email/', views.send_daily_report_email, name='send_daily_report_email'),
    path('send_repair_status_report_email/', views.send_repair_status_report_email, name='send_repair_status_report_email'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

