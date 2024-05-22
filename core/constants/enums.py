# -*- coding: utf-8 -*-
from enum import Enum

from django.db import models


class EnumChoice(Enum):
    @classmethod
    def choices(cls):
        return tuple((i.value, i.name) for i in cls)


class MediaType(models.TextChoices):
    IMAGE = "image"
    VIDEO = "video"


class Status(models.TextChoices):
    ACTIVE = "active"
    INACTIVE = "inactive"
