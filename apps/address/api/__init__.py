# -*- coding: utf-8 -*-
from address.api.views import (DistrictDetail, DistrictList, ProvinceDetail,
                               ProvinceList, WardDetail, WardList)
from django.urls import path

urlpatterns = [
    path('list-province', ProvinceList.as_view(), name='list_province'),
    path('get-province/<str:code>', ProvinceDetail.as_view(), name='detail_province'),
    path('list-district', DistrictList.as_view(), name='list_district'),
    path('get-district/<str:code>', DistrictDetail.as_view(), name='detail_district'),
    path('list-ward', WardList.as_view(), name='list_ward'),
    path('get-ward/<str:code>', WardDetail.as_view(), name='detail_ward')
]
