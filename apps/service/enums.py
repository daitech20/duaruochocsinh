# -*- coding: utf-8 -*-
from django.db import models


class VehicleTypeEnum(models.TextChoices):
    SEAT_16 = "16 chỗ"
    SEAT_29 = "29 chỗ"
    SEAT_45 = "45 chỗ"
