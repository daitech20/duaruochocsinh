# -*- coding: utf-8 -*-
import json  # noqa

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect, render

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
    form = CreateUserForm  # noqa
    context = {'form': form}
    if request.method == "POST":
        form = CreateUserForm(request.POST)  # noqa
        if form.is_valid():
            form.save()
            return redirect('login')
    context = {'form': form}
    return render(request, 'frontend/register.html', context)


def loginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request, 'User or password not corect!')
    context = {}
    return render(request, 'frontend/login.html', context)


def logoutPage(request):
    logout(request)
    return redirect('login')


def search(request):
    return render(request, 'frontend/search.html')


def personal(request):
    return render(request, 'frontend/personal.html')


def perInfor(request):
    return render(request, 'frontend/perInfor.html')


def yourChild(request):
    return render(request, 'frontend/yourChild.html')


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
