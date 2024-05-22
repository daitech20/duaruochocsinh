# -*- coding: utf-8 -*-
from django.db import models


# Create your models here.
class AdministrativeRegion(models.Model):
    name = models.CharField(max_length=255)
    name_en = models.CharField(max_length=255)
    code_name = models.CharField(max_length=255, null=True, blank=True)
    code_name_en = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return self.name

    def region(self) -> str:
        return self.name


class AdministrativeUnit(models.Model):
    full_name = models.CharField(max_length=255, null=True, blank=True)
    full_name_en = models.CharField(max_length=255, null=True, blank=True)
    short_name = models.CharField(max_length=255, null=True, blank=True)
    short_name_en = models.CharField(max_length=255, null=True, blank=True)
    code_name = models.CharField(max_length=255, null=True, blank=True)
    code_name_en = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return self.full_name


class Province(models.Model):
    code = models.CharField(max_length=20, unique=True)
    name = models.CharField(max_length=255)
    name_en = models.CharField(max_length=255, null=True, blank=True)
    full_name = models.CharField(max_length=255)
    full_name_en = models.CharField(max_length=255, null=True, blank=True)
    code_name = models.CharField(max_length=255, null=True, blank=True)
    administrative_unit = models.ForeignKey(AdministrativeUnit, on_delete=models.CASCADE, related_name="provinces_unit")
    administrative_region = models.ForeignKey(
        AdministrativeRegion, on_delete=models.CASCADE, related_name="provinces_region")

    def __str__(self) -> str:
        return self.full_name

    def province(self) -> str:
        return self.full_name


class District(models.Model):
    code = models.CharField(max_length=20, unique=True)
    name = models.CharField(max_length=255)
    name_en = models.CharField(max_length=255, null=True, blank=True)
    full_name = models.CharField(max_length=255)
    full_name_en = models.CharField(max_length=255, null=True, blank=True)
    code_name = models.CharField(max_length=255, null=True, blank=True)
    administrative_unit = models.ForeignKey(AdministrativeUnit, on_delete=models.CASCADE, related_name="districts_unit")
    province_code = models.ForeignKey(
        Province,
        on_delete=models.CASCADE,
        related_name="districts_province",
        to_field="code",
    )

    def __str__(self) -> str:
        return self.full_name

    def district(self) -> str:
        return self.full_name


class Ward(models.Model):
    code = models.CharField(max_length=20, unique=True)
    name = models.CharField(max_length=255)
    name_en = models.CharField(max_length=255, null=True, blank=True)
    full_name = models.CharField(max_length=255)
    full_name_en = models.CharField(max_length=255, null=True, blank=True)
    code_name = models.CharField(max_length=255, null=True, blank=True)
    administrative_unit = models.ForeignKey(AdministrativeUnit, on_delete=models.CASCADE, related_name="wards_unit")
    district_code = models.ForeignKey(
        District,
        on_delete=models.CASCADE,
        related_name="wards_district",
        to_field="code",
    )

    def __str__(self) -> str:
        return self.full_name

    def location(self) -> str:
        return "{} - {} - {}".format(
            self.full_name,
            self.district_code.district(),
            self.district_code.province_code.province()
        )
