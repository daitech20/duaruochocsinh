# -*- coding: utf-8 -*-
from django.urls import path

from . import views

app_name = 'frontend'
urlpatterns = [
    path('', views.home, name="home"),
    path('register/', views.register, name="register"),
    path('login/', views.loginPage, name="login"),
    path('logout/', views.logoutPage, name="logout"),
    path('search/', views.search, name="search"),
    path('service/', views.service, name="service"),
    path('activity/', views.activity, name="activity"),
    path('ongoing/', views.ongoing, name="ongoing"),
    path('schedule/', views.schedule, name="schedule"),
    path('tripDetail/', views.tripDetail, name="tripDetail"),
    path('tripHistory/', views.tripHistory, name="tripHistory"),
    path('policy/', views.policy, name="policy"),
    path('aboutUs/', views.aboutUs, name="aboutUs"),
    path('personal/', views.personal, name="personal"),
    path('perInfor/', views.perInfor, name="perInfor"),
    path('yourChild/', views.yourChild, name="yourChild"),
    path('saveAddress/', views.saveAddress, name="saveAddress"),
    path('payment/', views.payment, name="payment"),
    path('invoiceInfor/', views.invoiceInfor, name="invoiceInfor"),
    path('termPolicy/', views.termPolicy, name="termPolicy"),
    path('support/', views.support, name="support"),
    path('changePW/', views.changePW, name="changePW"),
    path('language/', views.language, name="language"),

    path('cart/', views.cart, name="cart"),
    path('checkout/', views.checkout, name="checkout"),
    path('vehicle/', views.vehicle, name="vehicle"),
    path('station/', views.station, name="station"),
    path('route/', views.route, name="route"),
    path('route/<int:route_id>/', views.route_detail_view, name='route_detail_view'),
]
