# -*- coding: utf-8 -*-
from django.urls import include, path

app_name = 'order'
urlpatterns = [
    path('api/v1/', include('apps.order.api')),
]
