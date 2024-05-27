# -*- coding: utf-8 -*-
from django.db import models
from order.enums import PaymentMethodEnum

from core.utils.django_base_models import BaseModel


class PaymentList(BaseModel):
    payment_method = models.CharField(max_length=20, choices=PaymentMethodEnum.choices,
                                      default=PaymentMethodEnum.PAYPAL)
    client_id = models.CharField(max_length=255)
    secret_key = models.CharField(max_length=255, null=True)

    class Meta:
        unique_together = ('payment_method', 'client_id')
