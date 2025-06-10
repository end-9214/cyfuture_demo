from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import status
from PIL import Image
from pyzbar.pyzbar import decode
import requests
from io import BytesIO
import random

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

            # Generate random environmental data (no external API call)
            health_score = random.randint(1, 10)
            carbon_footprint = round(random.uniform(0.1, 5.0), 2)
            water_usage = round(random.uniform(0.1, 10.0), 2)
            insights = random.choice([
                "This product is eco-friendly!",
                "Consider reducing usage for a greener planet.",
                "Great choice for sustainability.",
                "Try to recycle the packaging.",
                "High carbon footprint, consider alternatives."
            ])
            alternatives = [
                {
                    "name": f"Alternative Product {i+1}",
                    "barcode": str(random.randint(1000000000000, 9999999999999)),
                    "health_score": random.randint(1, 10)
                } for i in range(3)
            ]

            return Response({
                'barcode': barcode_number,
                'health_score': health_score,
                'carbon_footprint': carbon_footprint,
                'water_usage': water_usage,
                'insights': insights,
                'alternatives': alternatives
            })
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
