# -*- coding: utf-8 -*-
from account.models import Admin, Customer, Status
from django.db import models
from payment.models import PaymentMethod
from service.models import Schedule, TimePackage

from core.utils.django_base_models import BaseModel


class Order(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.CASCADE, related_name="order_payment_method")
    total_price = models.FloatField()
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name="order_customer")

    def __str__(self) -> str:
        return self.customer.full_name


class OrderDetail(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    status = models.ForeignKey(Status, on_delete=models.CASCADE, related_name="order_detail_status")
    schedule = models.ForeignKey(Schedule, on_delete=models.CASCADE, related_name="order_detail_schedule")
    time_package = models.ForeignKey(TimePackage, on_delete=models.CASCADE, related_name="order_detail_time_package")
    price = models.FloatField()


class OrderStatus(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_status")
    admin = models.ForeignKey(Admin, on_delete=models.CASCADE, related_name="order_status_admin")
    status = models.ForeignKey(Status, on_delete=models.CASCADE)


class Transaction(BaseModel):
    time = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="transaction_order")
    amount = models.FloatField()
    status = models.ForeignKey(Status, on_delete=models.CASCADE)
