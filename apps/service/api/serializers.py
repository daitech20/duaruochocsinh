# -*- coding: utf-8 -*-
from account.api.serializers import (DriverDetailSerializer,
                                     EmployeeDetailSerializer,
                                     StudentDetailSerializer)
from rest_framework import serializers
from service.models import (Attendance, Route, RouteDetail, Schedule, Station,
                            StudentTrip, TripDetail, Vehicle)


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


class StudentTripSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentTrip
        fields = (
            'id',
            'schedule',
            'status',
            'notification',
            'student',
        )


class StudentTripDetailSerializer(serializers.ModelSerializer):
    student = StudentDetailSerializer()

    class Meta:
        model = StudentTrip
        fields = (
            'id',
            'schedule',
            'status',
            'notification',
            'student',
        )


class ScheduleDetailSerializer(serializers.ModelSerializer):
    vehicle = VehicleSerializer()
    route = RouteSerializer()
    driver = DriverDetailSerializer()
    employee = EmployeeDetailSerializer()
    schedule_student_trip = StudentTripDetailSerializer(many=True)

    class Meta:
        model = Schedule
        fields = (
            'id',
            'distance',
            'start_day',
            'end_day',
            'pickup_time',
            'route',
            'vehicle',
            'driver',
            'employee',
            'schedule_student_trip',
        )


class TripDetailSerializer(serializers.ModelSerializer):
    schedule = ScheduleDetailSerializer()

    class Meta:
        model = TripDetail
        fields = (
            'id',
            'start_time',
            'end_time',
            'schedule',
            'status',
        )


class AttendanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attendance
        fields = (
            'id',
            'trip_detail',
            'student',
            'note',
            'employee'
        )
