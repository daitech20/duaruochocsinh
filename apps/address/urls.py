# -*- coding: utf-8 -*-
from django.urls import include, path

app_name = 'address'
urlpatterns = [
    path('api/v1/', include('apps.address.api')),
]
