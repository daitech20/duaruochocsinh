# -*- coding: utf-8 -*-
import django.contrib.auth.password_validation as validators
from account.models import Customer, Driver, Employee, Student, User
from django.core import exceptions
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


class UserCreateSerializer(serializers.ModelSerializer):
    phone = serializers.CharField()
    email = serializers.EmailField()
    full_name = serializers.CharField()
    password = serializers.CharField(write_only=True, required=True)
    password2 = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = User
        fields = ['id', 'phone', 'password', 'email', 'password2', 'full_name', 'is_staff', 'is_superuser']

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match"})
        errors = dict()
        try:
            # validate the password and catch the exception
            validators.validate_password(password=attrs['password'])
            # the exception raised here is different than serializers.ValidationError
        except exceptions.ValidationError as e:
            errors['password'] = list(e.messages)

        if errors:
            raise serializers.ValidationError(errors)

        return attrs

    def create(self, validated_data):
        validated_data.pop('password2')
        if User.objects.filter(phone=validated_data["phone"]).exists():
            raise serializers.ValidationError({"phone": "Phone already exists"})
        if User.objects.filter(email=validated_data["email"]).exists():
            raise serializers.ValidationError({"email": "Email already exists"})

        # user = User.objects.create(
        #     phone=validated_data['phone'],
        #     first_name=validated_data['first_name'],
        #     last_name=validated_data['last_name'],
        #     email=validated_data['email']
        # )
        user = User.objects.create_user(**validated_data)

        user.set_password(validated_data['password'])
        user.save()

        return user


class EmployeeSerializer(serializers.ModelSerializer):
    user = UserDetailSerializer()

    class Meta:
        model = Employee
        fields = (
            'id',
            'user',
            'full_name',
            'address2',
            'salary',
        )


class EmployeeCreateSerializer(serializers.ModelSerializer):
    user = UserCreateSerializer()

    class Meta:
        model = Employee
        fields = ['user']

    def create(self, validated_data):
        user_data = validated_data.pop('user')
        user = UserCreateSerializer.create(UserCreateSerializer(), validated_data=user_data)
        employee = Employee.objects.create(user=user, **validated_data, full_name=user.full_name)
        return employee


class DriverCreateSerializer(serializers.ModelSerializer):
    user = UserCreateSerializer()

    class Meta:
        model = Driver
        fields = ['user']

    def create(self, validated_data):
        user_data = validated_data.pop('user')
        user = UserCreateSerializer.create(UserCreateSerializer(), validated_data=user_data)
        driver = Driver.objects.create(user=user, **validated_data, full_name=user.full_name)
        return driver


class DriverSerializer(serializers.ModelSerializer):
    user = UserCreateSerializer()

    class Meta:
        model = Driver
        fields = (
            'id',
            'user',
            'full_name',
            'address2',
            'salary',
        )
