# -*- coding: utf-8 -*-
from account.models import Status, User
from django.db import models

from core.utils.django_base_models import BaseModel

# Create your models here.


class Notification(BaseModel):
    content = models.TextField()
    user = models.ManyToManyField(User)
    time = models.DateTimeField()
    status = models.ForeignKey(Status, on_delete=models.CASCADE, related_name="status_notification")
