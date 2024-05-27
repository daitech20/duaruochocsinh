# -*- coding: utf-8 -*-
from django.db import models


class TimePackageEnum(models.TextChoices):
    MONTH_3 = "3 tháng"
    MONTH_6 = "6 tháng"
    MONTH_9 = "9 Tháng"


class PaymentMethodEnum(models.TextChoices):
    PAYPAL = "paypal"
