# -*- coding: utf-8 -*-
from django.contrib import admin  # noqa
from order.models import Order, OrderDetail, OrderStatus

# Register your models here.

admin.site.register(Order)
admin.site.register(OrderDetail)
admin.site.register(OrderStatus)
