# -*- coding: utf-8 -*-
from django.db import models


class GenderEnum(models.TextChoices):
    MALE = "male"
    FEMALE = "female"
    OTHER = "other"


class GroupEnum(models.TextChoices):
    ADMIN = "admin"
    STAFF = "staff"
    CUSTOMER = "customer"
