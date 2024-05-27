# -*- coding: utf-8 -*-
from django.contrib import admin
from service.models import (Route, RouteDetail, Schedule, StudentTrip,
                            TripDetail)


@admin.register(Route)
class RouteAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'pickup',
        'dropoff'
    )


@admin.register(RouteDetail)
class RouteDetailAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'route',
        'station',
        'sequence'
    )


admin.site.register(Schedule)
admin.site.register(StudentTrip)
admin.site.register(TripDetail)
