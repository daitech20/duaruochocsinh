# -*- coding: utf-8 -*-
from django.contrib import admin
from service.models import Route, RouteDetail


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
