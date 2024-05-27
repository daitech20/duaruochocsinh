# -*- coding: utf-8 -*-
from account.models import Customer, Driver, Employee, Student, User
from drf_extra_fields.fields import Base64ImageField
from rest_framework import serializers


class UserDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            'id',
            'phone',
            'full_name',
            'email'
        )


class StudentSerializer(serializers.ModelSerializer):
    image = Base64ImageField(required=False)

    class Meta:
        model = Student
        fields = (
            'id',
            'gender',
            'full_name',
            'classroom',
            'date_of_birth',
            'image',
            'customer'
        )


class CustomerDetailSerializer(serializers.ModelSerializer):
    user = UserDetailSerializer()

    class Meta:
        model = Customer
        fields = (
            'id',
            'user',
            'gender',
            'full_name',
            'user'
        )


class DriverDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Driver
        fields = (
            'id',
            'user',
            'gender',
            'full_name'
        )


class EmployeeDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Employee
        fields = (
            'id',
            'user',
            'gender',
            'full_name'
        )


class StudentDetailSerializer(serializers.ModelSerializer):
    image = Base64ImageField(required=False)
    customer = CustomerDetailSerializer()

    class Meta:
        model = Student
        fields = (
            'id',
            'gender',
            'full_name',
            'classroom',
            'date_of_birth',
            'image',
            'customer'
        )
