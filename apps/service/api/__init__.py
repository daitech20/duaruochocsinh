# -*- coding: utf-8 -*-
from django.urls import path
from service.api.views import (RouteDetailCreate, RouteDetailUpdateView,
                               RouteDetailView, RouteList, RouteUpdateView,
                               StationDetail, StationList, VehicleDetail,
                               VehicleList)

urlpatterns = [
    path('list-vehicle', VehicleList.as_view(), name='list_vehicle'),
    path('get-vehicle/<int:id>', VehicleDetail.as_view(), name='detail_vehicle'),
    path('update-vehicle/<int:id>', VehicleDetail.as_view(), name='update_vehicle'),
    path('delete-vehicle/<int:id>', VehicleDetail.as_view(), name='delete_vehicle'),
    path('list-station', StationList.as_view(), name='list_station'),
    path('get-station/<int:id>', StationDetail.as_view(), name='detail_station'),
    path('update-station/<int:id>', StationDetail.as_view(), name='update_station'),
    path('delete-station/<int:id>', StationDetail.as_view(), name='delete_station'),
    path('list-route', RouteList.as_view(), name='list_route'),
    path('get-route/<int:id>', RouteDetailView.as_view(), name='detail_route'),
    path('update-route/<int:id>', RouteUpdateView.as_view(), name='update_route'),
    path('delete-route/<int:id>', RouteUpdateView.as_view(), name='delete_route'),
    path('add-route-detail', RouteDetailCreate.as_view(), name='add_route_detail'),
    path('delete-route-detail/<int:id>', RouteDetailUpdateView.as_view(), name='delete_route_detail'),
]
