# -*- coding: utf-8 -*-
from account.models import Admin, Customer
from django.db import models
from order.enums import PaymentMethodEnum, TimePackageEnum
from service.models import Schedule

from core.constants.enums import Status
from core.utils.django_base_models import BaseModel


class Order(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    payment_method = models.CharField(max_length=20, choices=PaymentMethodEnum.choices,
                                      default=PaymentMethodEnum.PAYPAL)
    total_price = models.FloatField()
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name="order_customer")
    payment_id = models.CharField(max_length=255, null=True)

    def __str__(self) -> str:
        return self.customer.full_name


class OrderDetail(BaseModel):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_details", null=True)
    time = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=50, choices=Status.choices)
    schedule = models.ForeignKey(Schedule, on_delete=models.CASCADE, related_name="order_detail_schedule")
    time_package = models.CharField(max_length=20, choices=TimePackageEnum.choices, default=TimePackageEnum.MONTH_3)
    price = models.FloatField()


class OrderStatus(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_status")
    admin = models.ForeignKey(Admin, on_delete=models.CASCADE, related_name="order_status_admin", null=True)
    status = models.CharField(max_length=50, choices=Status.choices)


class Transaction(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="transaction_order")
    amount = models.FloatField()
    status = models.CharField(max_length=50, choices=Status.choices)
