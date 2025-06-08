from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import status
from PIL import Image
from pyzbar.pyzbar import decode
import requests
from io import BytesIO

# Create your views here.

class ScanBarcodeView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        image_file = request.FILES.get('image')
        if not image_file:
            return Response({'error': 'No image provided.'}, status=status.HTTP_400_BAD_REQUEST)
        try:
            image = Image.open(image_file)
            barcodes = decode(image)
            if not barcodes:
                return Response({'error': 'No barcode found in image.'}, status=status.HTTP_400_BAD_REQUEST)
            barcode_number = barcodes[0].data.decode('utf-8')
            api_url = f'https://world.openfoodfacts.net/api/v2/product/{barcode_number}'
            api_response = requests.get(api_url)
            if api_response.status_code != 200:
                return Response({'error': 'Failed to fetch product data.'}, status=status.HTTP_502_BAD_GATEWAY)
            data = api_response.json()
            ecoscore_data = data.get('product', {}).get('ecoscore_data')
            return Response({'barcode': barcode_number, 'ecoscore_data': ecoscore_data})
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
