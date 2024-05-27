# -*- coding: utf-8 -*-
import paypalrestsdk
from account.models import CitizenIdentification, RepresentativeUnit
from django.conf import settings
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse  # noqa
from django.views.generic import TemplateView
from order.models import Order, OrderDetail, OrderStatus
from service.models import (Route, RouteDetail, Schedule, Station, StudentTrip,
                            TripDetail, Vehicle)

from core.constants.enums import Status

from .forms import (CitizenIdentificationForm, CustomerFormSet,
                    CustomUserCreationForm, RepresentativeUnitForm, RouteForm,
                    ScheduleForm, StationForm, StudentForm, StudentTripForm,
                    TripDetailForm, UserForm, VehicleForm)
from .models import *  # noqa

# Create your views here.


def home(request):
    context = {}
    return render(request, 'frontend/home.html', context)


@login_required
def service(request):
    context = {}
    return render(request, 'frontend/service.html', context)


def activity(request):
    context = {}
    return render(request, 'frontend/activity.html', context)


def ongoing(request):
    context = {}
    return render(request, 'frontend/ongoing.html', context)


@login_required
def schedule(request):
    if hasattr(request.user, 'customers'):
        customer = request.user.customers
        paid_orders = Order.objects.filter(
            customer=customer,
            order_details__status='success'
        ).distinct()
    else:
        paid_orders = Order.objects.filter(
            order_details__status='success'
        ).distinct()

    order_details = OrderDetail.objects.filter(
        order__in=paid_orders,
        status='success'
    )

    paid_schedules = Schedule.objects.filter(
        order_detail_schedule__in=order_details
    ).distinct()

    context = {
        "paid_schedules": paid_schedules
    }
    return render(request, 'frontend/schedule.html', context)


def tripDetail(request):
    context = {}
    return render(request, 'frontend/tripDetail.html', context)


@login_required
def tripHistory(request, schedule_id):
    user = request.user
    schedule = Schedule.objects.get(id=schedule_id)
    trips_detail = TripDetail.objects.filter(schedule=schedule).order_by("-start_time")

    if request.method == 'POST':
        form = TripDetailForm(request.POST, request.FILES, initial={'schedule': schedule_id})
        if form.is_valid():
            form.save()
            return redirect('frontend:tripHistory', schedule_id=schedule_id)
    else:
        form = TripDetailForm(initial={'schedule': schedule_id})

    form_errors = form.errors if form.errors else None
    context = {
        "form": form,
        "form_errors": form_errors,
        "schedule": schedule,
        "trips_detail": trips_detail,
        "user_id": user.id
    }
    if user.employees:
        context.update({
            "employee_id": user.employees.id
        })

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


paypalrestsdk.configure({
    "mode": "sandbox",  # Change to "live" for production
    "client_id": settings.PAYPAL_CLIENT_ID,
    "client_secret": settings.PAYPAL_SECRET,
})


@login_required
def checkout(request):
    user = request.user
    route_id = request.GET.get('route_id')
    route = Route.objects.get(id=route_id)
    route_details = RouteDetail.objects.filter(route_id=route_id).order_by('sequence')
    time_package = request.GET.get('time_package')
    vehicel_type = request.GET.get('vehicel_type')
    pickup_time = request.GET.get('pickup_time')
    distance = request.GET.get('distance')

    if request.method == "POST":
        form = ScheduleForm(request.POST, vehicle_type=vehicel_type, initial={'route': route_id})
        if form.is_valid():
            schedule = form.save()
            total_amount = request.POST.get('total_amount')
            order = Order.objects.create(
                total_price=total_amount,
                customer=user.customers
            )
            OrderDetail.objects.create(
                order=order,
                status=Status.PENDING,
                schedule=schedule,
                time_package=time_package,
                price=total_amount
            )
            OrderStatus.objects.create(
                order=order,
                status=Status.PENDING
            )

            payment = paypalrestsdk.Payment({
                "intent": "sale",
                "payer": {
                    "payment_method": "paypal",
                },
                "redirect_urls": {
                    "return_url": request.build_absolute_uri(reverse("frontend:payment_success")),
                    "cancel_url": request.build_absolute_uri(reverse("frontend:payment_cancel")),
                },
                "transactions": [
                    {
                        "amount": {
                            "total": total_amount,
                            "currency": "USD",
                        },
                        "description": "Dịch vụ đưa rước học sinh",
                    }
                ],
            })

            if payment.create():
                order.payment_id = payment.id
                order.save()
                return redirect(payment.links[1].href)
            else:
                return render(request, 'frontend:payment_cancel')

        else:
            for field_name, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f"{field_name}: {error}")
    else:
        form = ScheduleForm(vehicle_type=vehicel_type, initial={'route': route_id})

    form_errors = form.errors if form.errors else None

    context = {
        'route': route,
        'route_details': route_details,
        'time_package': time_package,
        'vehicel_type': vehicel_type,
        'pickup_time': pickup_time,
        'distance': distance,
        'form': form,
        'form_errors': form_errors
    }

    return render(request, 'frontend/checkout.html', context)


class PaymentCancelView(TemplateView):
    template_name = 'frontend/payment_cancel.html'


def payment_success(request):
    payment_id = request.GET.get('paymentId')
    payer_id = request.GET.get('PayerID')

    payment = paypalrestsdk.Payment.find(payment_id)

    if payment.execute({"payer_id": payer_id}):
        order = Order.objects.get(payment_id=payment_id)
        order.save()
        order_details = order.order_details.all()

        for od in order_details:
            od.status = Status.SUCCESS
            od.save()

        OrderStatus.objects.create(
            order=order,
            status=Status.SUCCESS
        )

        return render(request, 'frontend/payment_success.html', {'order': order})
    else:
        return render(request, 'frontend/payment_cancel.html')


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
    return redirect('frontend:home')


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


@login_required
def schedule_manage(request, schedule_id):
    user = request.user
    customer = user.customers

    schedule = Schedule.objects.get(id=schedule_id)
    students_trip = StudentTrip.objects.filter(schedule=schedule)

    if request.method == 'POST':
        form = StudentTripForm(request.POST, request.FILES, initial={'schedule': schedule_id})
        if form.is_valid():
            form.save()
            return redirect('frontend:schedule_manage', schedule_id=schedule_id)
    else:
        form = StudentTripForm(customer=customer, initial={'schedule': schedule_id})

    form_errors = form.errors if form.errors else None

    context = {
        "schedule": schedule,
        "students_trip": students_trip,
        "form": form,
        "form_errors": form_errors,
        "user": user
    }

    return render(request, 'frontend/schedule_manage.html', context)
