# -*- coding: utf-8 -*-
import datetime

from django.db.models import Count, Sum
from order.models import OrderDetail
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from core.utils.api_resp import success_api_resp

from .serializers import OrderDetailStatsSerializer


class OrderDetailStatsByMonthView(APIView):
    def get(self, request, month, year):
        try:
            date_from = datetime.date(int(year), int(month), 1)
            date_to = (date_from + datetime.timedelta(days=32)).replace(day=1)
        except ValueError:
            return Response({"error": "Invalid date"}, status=status.HTTP_400_BAD_REQUEST)

        stats = OrderDetail.objects.filter(
            time__gte=date_from,
            time__lt=date_to,
            status="success"
        ).aggregate(
            total_order_count=Count('id'),
            total_price=Sum('price')
        )

        serializer = OrderDetailStatsSerializer(stats)
        return success_api_resp(data=serializer.data)


class OrderDetailStatsByTimePackageView(APIView):
    def get(self, request):
        stats = OrderDetail.objects.filter(status="success").values('time_package').annotate(
            total_order_count=Count('id'),
            total_price=Sum('price')
        ).order_by('time_package')

        return success_api_resp(data=stats)
