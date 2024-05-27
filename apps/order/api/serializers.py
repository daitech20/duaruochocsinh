# -*- coding: utf-8 -*-
from rest_framework import serializers


class OrderDetailStatsSerializer(serializers.Serializer):
    total_order_count = serializers.IntegerField()
    total_price = serializers.FloatField()
