# -*- coding: utf-8 -*-
from account.models import User
from django.db import models

from core.constants.enums import Status
from core.utils.django_base_models import BaseModel

# Create your models here.


class Notification(BaseModel):
    content = models.TextField()
    user = models.ManyToManyField(User)
    time = models.DateTimeField()
    status = models.CharField(max_length=50, choices=Status.choices)
