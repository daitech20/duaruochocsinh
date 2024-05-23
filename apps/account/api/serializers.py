# -*- coding: utf-8 -*-
from account.models import Student
from drf_extra_fields.fields import Base64ImageField
from rest_framework import serializers


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
