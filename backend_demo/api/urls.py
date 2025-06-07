from django.urls import path
from . import views

urlpatterns = [
    path('scan-barcode/', views.ScanBarcodeView.as_view(), name='scan-barcode'),
]
