# -*- coding: utf-8 -*-
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.db import models

# change forms register


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password1', 'password2']


# Create your models here.
class Customer(models.Model):
    phone_number = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=False)
    name = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class Employee(models.Model):
    phone_number = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=False)
    name = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class Service(models.Model):
    name = models.CharField(max_length=200, null=True)
    price = models.FloatField()
    type = models.BooleanField(default=False, null=True, blank=False)
    # type này là cá nhân hay nhà trường, mặc định cá nhân
    car = models.BooleanField(default=False, null=True, blank=False)
    # loại xe 4,7,16. Mặc định 4 chỗ
    time_package = models.BooleanField(default=False, null=True, blank=False)
    # thời gian gói dịch vụ 3,6,9 tháng. Mặc định là 3 tháng

    def __str__(self):
        return self.name


class Transaction(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, blank=True, null=True)
    date_order = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=200, null=True)
    complete = models.BooleanField(default=False, null=True, blank=False)
    transaction_id = models.CharField(max_length=200, null=True)

    def __str__(self):
        return str(self.id)


class TransactionItem(models.Model):
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, blank=True, null=True)
    transaction = models.ForeignKey(Transaction, on_delete=models.SET_NULL, blank=True, null=True)
    date_added = models.DateTimeField(auto_now_add=True)
    end_time = models.DateTimeField(null=True, blank=True)


class Trip(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, blank=True, null=True)
    transaction = models.ForeignKey(Transaction, on_delete=models.SET_NULL, blank=True, null=True)
    address_start = models.CharField(max_length=200, null=True)
    address_end = models.CharField(max_length=200, null=True)
    state = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.address_start
