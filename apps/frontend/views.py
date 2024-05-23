# -*- coding: utf-8 -*-
import json  # noqa

from account.models import CitizenIdentification, RepresentativeUnit
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render
from service.models import Route, Station, Vehicle

from .forms import (CitizenIdentificationForm, CustomerFormSet,
                    CustomUserCreationForm, RepresentativeUnitForm, RouteForm,
                    StationForm, StudentForm, UserForm, VehicleForm)
from .models import *  # noqa

# Create your views here.


def home(request):
    context = {}
    return render(request, 'frontend/home.html', context)


def service(request):
    context = {}
    return render(request, 'frontend/service.html', context)


def activity(request):
    context = {}
    return render(request, 'frontend/activity.html', context)


def ongoing(request):
    context = {}
    return render(request, 'frontend/ongoing.html', context)


def schedule(request):
    context = {}
    return render(request, 'frontend/schedule.html', context)


def tripDetail(request):
    context = {}
    return render(request, 'frontend/tripDetail.html', context)


def tripHistory(request):
    context = {}
    return render(request, 'frontend/tripHistory.html', context)


def policy(request):
    context = {}
    return render(request, 'frontend/policy.html', context)


def aboutUs(request):
    context = {}
    return render(request, 'frontend/aboutUs.html', context)


def cart(request):
    context = {}
    return render(request, 'frontend/cart.html', context)


def checkout(request):
    context = {}
    return render(request, 'frontend/checkout.html', context)


def register(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)  # noqa
        if form.is_valid():
            form.save()
            return redirect('frontend:login')
        else:
            for field_name, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f"{field_name}: {error}")
    else:
        form = CustomUserCreationForm()

    return render(request, 'frontend/register.html', {'form': form})


def loginPage(request):
    if request.user.is_authenticated:
        return redirect('frontend:home')

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('frontend:home')
        else:
            messages.error(request, 'User or password not corect!')

    context = {}
    return render(request, 'frontend/login.html', context)


def logoutPage(request):
    logout(request)
    return redirect('frontend:login')


def search(request):
    return render(request, 'frontend/search.html')


def personal(request):
    return render(request, 'frontend/personal.html')


@login_required
def perInfor(request):
    user = request.user
    ProfileFormSet = None
    initial_province_id = initial_district_id = initial_ward_id = None
    initial_representative_unit_province_id = initial_representative_unit_district_id = initial_representative_unit_ward_id = None  # noqa

    if hasattr(user, 'customers'):
        ProfileFormSet = CustomerFormSet
        customer = user.customers
        initial_province_id = (
            customer.address.district_code.province_code.code
            if customer.address and customer.address.district_code and customer.address.district_code.province_code
            else None
        )
        initial_district_id = (
            customer.address.district_code.code
            if customer.address and customer.address.district_code
            else None
        )
        initial_ward_id = (
            customer.address.id
            if customer.address
            else None
        )
        initial_representative_unit_province_id = (
            customer.representative_unit.address.district_code.province_code.code
            if customer.representative_unit and customer.representative_unit.address
            else None
        )
        initial_representative_unit_district_id = (
            customer.representative_unit.address.district_code.code
            if customer.representative_unit and customer.representative_unit.address
            else None
        )
        initial_representative_unit_ward_id = (
            customer.representative_unit.address.id
            if customer.representative_unit and customer.representative_unit.address
            else None
        )

    if request.method == "POST":
        user_form = UserForm(request.POST, request.FILES, instance=user)
        if user_form.is_valid():
            user_form.save()

        # Customer form
        if ProfileFormSet:
            profile_formset = ProfileFormSet(request.POST, request.FILES, instance=user)
            if profile_formset.is_valid():
                profile_formset.save()

            customer_instance = user.customers
            try:
                citizen_identification_instance = customer_instance.citizen_identification
            except CitizenIdentification.DoesNotExist:
                citizen_identification_instance = None

            try:
                representative_unit_instance = customer_instance.representative_unit
            except RepresentativeUnit.DoesNotExist:
                representative_unit_instance = None

            citizen_identification_form = CitizenIdentificationForm(
                request.POST, request.FILES, instance=citizen_identification_instance)
            representative_unit_form = RepresentativeUnitForm(
                request.POST, request.FILES, instance=representative_unit_instance)

            if citizen_identification_form.is_valid() and representative_unit_form.is_valid():
                citizen_identification = citizen_identification_form.save()
                customer_instance.citizen_identification = citizen_identification

                representative_unit = representative_unit_form.save()
                customer_instance.representative_unit = representative_unit
                customer_instance.save()

        return redirect('/perInfor')
    else:
        # Admin form
        user_form = UserForm(instance=user)

        # Customer form
        if ProfileFormSet:
            profile_formset = ProfileFormSet(instance=user)
            customer_instance = user.customers
            try:
                citizen_identification_instance = customer_instance.citizen_identification
            except CitizenIdentification.DoesNotExist:
                citizen_identification_instance = None
            citizen_identification_form = CitizenIdentificationForm(instance=citizen_identification_instance)

            try:
                representative_unit_instance = customer_instance.representative_unit
            except RepresentativeUnit.DoesNotExist:
                representative_unit_instance = None
            representative_unit_form = RepresentativeUnitForm(instance=representative_unit_instance)

        else:
            profile_formset = None
            citizen_identification_form = None
            representative_unit_form = None

    user_errors = user_form.errors if user_form.errors else None
    profile_errors = profile_formset.errors if profile_formset and profile_formset.errors else None  # noqa
    citizen_identification_errors = citizen_identification_form.errors if citizen_identification_form and citizen_identification_form.errors else None  # noqa
    representative_unit_errors = representative_unit_form.errors if representative_unit_form and representative_unit_form.errors else None  # noqa

    return render(request, 'frontend/perInfor.html', {
        'user_form': user_form,
        'profile_formset': profile_formset,
        'citizen_identification_form': citizen_identification_form,
        'representative_unit_form': representative_unit_form,
        'user_errors': user_errors,
        'profile_errors': profile_errors,
        'initial_province_id': initial_province_id,
        'initial_district_id': initial_district_id,
        'initial_ward_id': initial_ward_id,
        'initial_representative_unit_province_id': initial_representative_unit_province_id,
        'initial_representative_unit_district_id': initial_representative_unit_district_id,
        'initial_representative_unit_ward_id': initial_representative_unit_ward_id,
        'citizen_identification_errors': citizen_identification_errors,
        'representative_unit_errors': representative_unit_errors,
    })


@login_required
def yourChild(request):
    user = request.user
    students = user.customers.students_customer.all()

    if request.method == 'POST':
        form = StudentForm(request.POST, request.FILES)
        if form.is_valid():
            student = form.save(commit=False)
            student.customer = user.customers
            student.save()
            return redirect('/yourChild')
    else:
        form = StudentForm()

    form_errors = form.errors if form.errors else None

    context = {
        "students": students,
        "form": form,
        "form_errors": form_errors,
    }

    return render(request, 'frontend/yourChild.html', context)


def saveAddress(request):
    return render(request, 'frontend/saveAddress.html')


def payment(request):
    return render(request, 'frontend/payment.html')


def invoiceInfor(request):
    return render(request, 'frontend/invoiceInfor.html')


def termPolicy(request):
    return render(request, 'frontend/termPolicy.html')


def support(request):
    return render(request, 'frontend/support.html')


def changePW(request):
    return render(request, 'frontend/changePW.html')


def language(request):
    return render(request, 'frontend/language.html')


@login_required
def vehicle(request):
    vehicles = Vehicle.objects.all()
    if request.method == 'POST':
        form = VehicleForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/vehicle')
    else:
        form = VehicleForm()

    form_errors = form.errors if form.errors else None

    context = {
        "vehicles": vehicles,
        "form": form,
        "form_errors": form_errors,
    }

    return render(request, 'frontend/vehicle.html', context)


@login_required
def station(request):
    stations = Station.objects.all()
    if request.method == 'POST':
        form = StationForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/station')
    else:
        form = StationForm()

    form_errors = form.errors if form.errors else None

    context = {
        "stations": stations,
        "form": form,
        "form_errors": form_errors,
    }

    return render(request, 'frontend/station.html', context)


@login_required
def route(request):
    routes = Route.objects.all()
    stations = Station.objects.all()
    if request.method == 'POST':
        form = RouteForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/route')
    else:
        form = RouteForm()

    form_errors = form.errors if form.errors else None

    context = {
        "routes": routes,
        "form": form,
        "form_errors": form_errors,
        "stations": stations,
    }

    return render(request, 'frontend/route.html', context)


def route_detail_view(request, route_id):
    route = get_object_or_404(Route, id=route_id)
    route_details = route.route_detail.all().order_by('sequence')
    stations = Station.objects.all()
    return render(
        request,
        'frontend/route_detail.html',
        {
            'route': route,
            'stations': stations,
            'route_details': route_details
        }
    )
