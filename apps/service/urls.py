# -*- coding: utf-8 -*-
from django.urls import include, path

app_name = 'service'
urlpatterns = [
    path('api/v1/', include('apps.service.api')),
]
