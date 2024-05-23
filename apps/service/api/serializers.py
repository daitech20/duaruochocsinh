# -*- coding: utf-8 -*-
from rest_framework import serializers
from service.models import Route, RouteDetail, Station, Vehicle


class VehicleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehicle
        fields = (
            'id',
            'code',
            'vehicle_type',
            'price'
        )


class StationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Station
        fields = (
            'id',
            'latitude',
            'longitude',
            'name'
        )


class RouteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Route
        fields = (
            'id',
            'name',
            'pickup',
            'dropoff'
        )


class RouteDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = RouteDetail
        fields = ['id', 'route', 'station', 'sequence']


class RouteDetailListSerializer(serializers.ModelSerializer):
    station = StationSerializer()

    class Meta:
        model = RouteDetail
        fields = ['id', 'route', 'station', 'sequence']


class RouteDSerializer(serializers.ModelSerializer):
    pickup = StationSerializer()
    dropoff = StationSerializer()
    route_detail = RouteDetailListSerializer(many=True)

    class Meta:
        model = Route
        fields = (
            'id',
            'name',
            'pickup',
            'dropoff',
            'route_detail',
        )
