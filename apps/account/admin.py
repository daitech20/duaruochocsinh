# -*- coding: utf-8 -*-
from account.models import (CitizenIdentification, Customer,
                            RepresentativeUnit, Student, User)
from django.contrib import admin


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'phone',
        'email',
        'full_name',
        'is_staff',
        'is_superuser',
        'is_active'
    )


@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'user',
        'gender',
        'address2',
        'representative_unit',
        'representative_unit_check',
        'citizen_identification',
        'date_of_birth'
    )


@admin.register(CitizenIdentification)
class CitizenIdentificationAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'code',
        'front',
        'back'
    )


@admin.register(RepresentativeUnit)
class RepresentativeUnitAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'name',
        'address',
        'phone'
    )


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'gender',
        'classroom',
        'full_name',
        'date_of_birth',
        'image',
        'customer'
    )
