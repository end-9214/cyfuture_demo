from django.urls import path
from .views import ScanBarcodeView

urlpatterns = [
    path('scan-barcode/', ScanBarcodeView.as_view(), name='scan-barcode'),
]

