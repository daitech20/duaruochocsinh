# -*- coding: utf-8 -*-
from account.enums import GenderEnum
from account.error_codes import AccountErrorCode
from address.models import Ward
from django.contrib.auth.models import (AbstractBaseUser, BaseUserManager,
                                        PermissionsMixin)
from django.core.validators import RegexValidator
from django.db import models

from core.utils.django_base_models import BaseModel


class Status(BaseModel):
    name = models.CharField(max_length=55)

    def __str__(self) -> str:
        return self.name


class CustomUserManager(BaseUserManager):
    def create_user(self, phone, password=None, is_staff=False, is_superuser=False, **extra_fields):
        if not phone:
            raise ValueError("Phone number must be set")

        user = self.model(phone=phone, is_staff=is_staff, is_superuser=is_superuser, is_active=False, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_staff(self, phone, password=None, **extra_fields):
        return self.create_user(phone=phone, password=password, is_staff=True, **extra_fields)

    def create_superuser(self, phone, password=None, **extra_fields):
        return self.create_user(phone=phone, password=password, is_staff=True, is_superuser=True, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    phone = models.CharField(
        unique=True,
        max_length=10,
        db_index=True,
        validators=[
            RegexValidator(
                regex=r"^0\d{9}$",
                message="Phone number must start with 0 and have 10 digits",
                code=AccountErrorCode.INVALID_PHONE_NUMBER,
            )
        ],
    )
    email = models.EmailField(null=True, unique=True)
    full_name = models.CharField(max_length=50, null=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    objects = CustomUserManager()

    USERNAME_FIELD = "phone"
    REQUIRED_FIELDS = ["full_name"]

    def __str__(self) -> str:
        return self.full_name

    class Meta:
        indexes = [
            models.Index(fields=['full_name']),
            models.Index(fields=['phone']),
        ]


class Admin(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="admin")
    gender = models.CharField(max_length=10, choices=GenderEnum.choices, null=True, blank=True)
    full_name = models.CharField(max_length=50)
    address = models.ForeignKey(Ward, on_delete=models.CASCADE, null=True)
    address2 = models.CharField(max_length=50, null=True)

    def __str__(self) -> str:
        return self.user.full_name

    class Meta:
        ordering = ['-id']

    @property
    def display_name(self):
        return self.full_name


class RepresentativeUnit(BaseModel):
    name = models.CharField(max_length=50)
    address = models.ForeignKey(Ward, on_delete=models.SET_NULL, null=True)
    phone = models.CharField(
        max_length=10,
        validators=[
            RegexValidator(
                regex=r"^0\d{9}$",
                message="Phone number must start with 0 and have 10 digits",
                code=AccountErrorCode.INVALID_PHONE_NUMBER,
            )
        ],
    )


class CitizenIdentification(BaseModel):
    code = models.CharField(max_length=12)
    front = models.ImageField(upload_to="cccd")
    back = models.ImageField(upload_to="cccd")


class Customer(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="customers", null=True, blank=True)
    gender = models.CharField(max_length=10, choices=GenderEnum.choices, null=True, blank=True)
    full_name = models.CharField(max_length=50)
    address = models.ForeignKey(Ward, on_delete=models.CASCADE,
                                related_name="customer_address", null=True)
    address2 = models.CharField(max_length=50, null=True)
    representative_unit = models.ForeignKey(RepresentativeUnit, on_delete=models.SET_NULL,
                                            related_name="customer_representative_unit", null=True)

    representative_unit_check = models.BooleanField(default=False)
    citizen_identification = models.ForeignKey(CitizenIdentification, on_delete=models.CASCADE,
                                               related_name="customer_citizen_identification", null=True)
    date_of_birth = models.DateField(blank=True, null=True)

    def __str__(self) -> str:
        return self.full_name

    class Meta:
        ordering = ['-id']

    @property
    def display_name(self):
        return self.full_name


class Student(BaseModel):
    gender = models.CharField(max_length=10, choices=GenderEnum.choices, null=True, blank=True)
    full_name = models.CharField(max_length=50)
    classroom = models.CharField(max_length=10)
    date_of_birth = models.DateField(blank=True, null=True)
    image = models.ImageField(upload_to="student")
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name="students_customer")

    def __str__(self) -> str:
        return self.full_name

    class Meta:
        ordering = ['-id']

    @property
    def display_name(self):
        return self.full_name


class Employee(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="employees", null=True, blank=True)
    gender = models.CharField(max_length=10, choices=GenderEnum.choices, null=True, blank=True)
    full_name = models.CharField(max_length=50)
    address = models.ForeignKey(Ward, on_delete=models.CASCADE,
                                related_name="employee_address", null=True)
    address2 = models.CharField(max_length=50, null=True)
    representative_unit = models.ForeignKey(RepresentativeUnit, on_delete=models.SET_NULL,
                                            related_name="employee_representative_unit", null=True)

    representative_unit_check = models.BooleanField(default=False)
    citizen_identification = models.ForeignKey(CitizenIdentification, on_delete=models.CASCADE,
                                               related_name="employee_citizen_identification")
    date_of_birth = models.DateField(blank=True, null=True)
    salary = models.FloatField(default=0.0)

    def __str__(self) -> str:
        return self.full_name

    class Meta:
        ordering = ['-id']

    @property
    def display_name(self):
        return self.full_name


class Driver(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="drivers", null=True, blank=True)
    gender = models.CharField(max_length=10, choices=GenderEnum.choices, null=True, blank=True)
    full_name = models.CharField(max_length=50)
    address = models.ForeignKey(Ward, on_delete=models.CASCADE,
                                related_name="driver_address", null=True)
    address2 = models.CharField(max_length=50, null=True)
    representative_unit = models.ForeignKey(RepresentativeUnit, on_delete=models.SET_NULL,
                                            related_name="driver_representative_unit", null=True)

    representative_unit_check = models.BooleanField(default=False)
    citizen_identification = models.ForeignKey(CitizenIdentification, on_delete=models.CASCADE,
                                               related_name="driver_citizen_identification")
    date_of_birth = models.DateField(blank=True, null=True)
    salary = models.FloatField(default=0.0)

    def __str__(self) -> str:
        return self.full_name

    class Meta:
        ordering = ['-id']

    @property
    def display_name(self):
        return self.full_name
