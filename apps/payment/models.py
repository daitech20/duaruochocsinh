# -*- coding: utf-8 -*-
from django.db import models

from core.utils.django_base_models import BaseModel


class PaymentMethod(BaseModel):
    name = models.CharField(max_length=55)

    def __str__(self) -> str:
        return self.name


class PaymentList(BaseModel):
    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.CASCADE, related_name="payment_payment_method")
    client_id = models.CharField(max_length=255)

    class Meta:
        unique_together = ('payment_method', 'client_id')
