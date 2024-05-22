# -*- coding: utf-8 -*-
from address.models import District, Province, Ward
from rest_framework import serializers


class ProvinceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Province
        fields = (
            'id',
            'code',
            'name',
            'name_en',
            'full_name',
            'full_name_en',
            'code_name',
            'administrative_unit',
            'administrative_region'
        )


class DistrictSerializer(serializers.ModelSerializer):
    province_code = ProvinceSerializer()

    class Meta:
        model = District
        fields = (
            'id',
            'code',
            'name',
            'name_en',
            'full_name',
            'full_name_en',
            'code_name',
            'administrative_unit',
            'province_code'
        )


class WardSerializer(serializers.ModelSerializer):
    district_code = DistrictSerializer()

    class Meta:
        model = Ward
        fields = (
            'id',
            'code',
            'name',
            'name_en',
            'full_name',
            'full_name_en',
            'code_name',
            'administrative_unit',
            'district_code'
        )
