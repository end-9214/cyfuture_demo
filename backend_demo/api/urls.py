from django.urls import path
from . import views

urlpatterns = [
    path('scan-barcode/', views.ScanBarcodeView.as_view(), name='scan-barcode'),
]


//new code for api integration

from django.urls import path
from .views import ScanBarcodeView

urlpatterns = [
    path('scan-barcode/', ScanBarcodeView.as_view(), name='scan-barcode'),
]

