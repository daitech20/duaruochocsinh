# -*- coding: utf-8 -*-
from account.models import Driver, Employee, Status, Student
from django.core.exceptions import ValidationError
from django.db import models
from notification.models import Notification
from service.enums import VehicleTypeEnum

from core.utils.django_base_models import BaseModel


class Vehicle(BaseModel):
    code = models.CharField(max_length=55)
    vehicle_type = models.CharField(max_length=55, choices=VehicleTypeEnum.choices, default=VehicleTypeEnum.SEAT_16)
    price = models.FloatField(default=0.0)

    def __str__(self) -> str:
        return self.code


class Station(BaseModel):
    latitude = models.CharField(max_length=255)
    longitude = models.CharField(max_length=255)
    name = models.CharField(max_length=255)

    def __str__(self) -> str:
        return self.name


class Route(BaseModel):
    name = models.CharField(max_length=255)
    pickup = models.ForeignKey(Station, on_delete=models.CASCADE, related_name="pickup_station")
    dropoff = models.ForeignKey(Station, on_delete=models.CASCADE, related_name="dropoff_station")

    def clean(self):
        if self.pickup == self.dropoff:
            raise ValidationError("Pickup and dropoff stations must be different.")

    def save(self, *args, **kwargs):
        self.clean()
        super().save(*args, **kwargs)


class RouteDetail(BaseModel):
    route = models.ForeignKey(Route, on_delete=models.CASCADE, related_name="route_detail")
    station = models.ForeignKey(Station, on_delete=models.CASCADE, related_name="station_route")
    sequence = models.PositiveIntegerField()

    class Meta:
        unique_together = ('route', 'station', 'sequence')


class Schedule(BaseModel):
    distance = models.IntegerField()
    estimated_time = models.IntegerField()
    start_day = models.DateField()
    end_day = models.DateField()
    route = models.ForeignKey(Route, on_delete=models.CASCADE, related_name="route_schedule")
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE, related_name="vehicle_schedule")
    driver = models.ForeignKey(Driver, on_delete=models.CASCADE, related_name="driver_schedule")
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,
                                 related_name="employee_schedule", null=True, blank=True)


class Location(BaseModel):
    time = models.DateTimeField()
    latitude = models.CharField(max_length=255)
    longitude = models.CharField(max_length=255)
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE, related_name="vehicle_location")


class TimePackage(BaseModel):
    name = models.CharField(max_length=255)
    total_days = models.PositiveIntegerField(default=0)


class TripDetail(BaseModel):
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    schedule = models.ForeignKey(Schedule, on_delete=models.CASCADE, related_name="schedule_trip_detail")
    status = models.ForeignKey(Status, on_delete=models.CASCADE, related_name="status_trip_detail")


class StudentTrip(BaseModel):
    schedule = models.ForeignKey(Schedule, on_delete=models.CASCADE, related_name="schedule_student_trip")
    status = models.ForeignKey(Status, on_delete=models.CASCADE, related_name="status_student_trip")
    notification = models.ForeignKey(Notification, on_delete=models.CASCADE, related_name="notification_student_trip")
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name="student_student_trip")

    class Meta:
        unique_together = ('student', 'schedule')


class StudentStatus(BaseModel):
    trip_detail = models.ForeignKey(TripDetail, on_delete=models.CASCADE, related_name="trip_detail_student_status")
    status = models.ForeignKey(Status, on_delete=models.CASCADE, related_name="status_student_status")
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name="student_student_status")
    time = models.DateTimeField(auto_now_add=True)


class Attendance(BaseModel):
    trip_detail = models.ForeignKey(TripDetail, on_delete=models.CASCADE, related_name="trip_detail_attendance")
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name="student_attendance")
    time = models.DateTimeField(auto_now_add=True)
    note = models.CharField(max_length=255, null=True, blank=True)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, related_name="attendance_employee")
