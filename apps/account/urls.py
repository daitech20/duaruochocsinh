# -*- coding: utf-8 -*-
from django.urls import include, path

app_name = 'account'
urlpatterns = [
    path('api/v1/', include('apps.account.api')),
]
