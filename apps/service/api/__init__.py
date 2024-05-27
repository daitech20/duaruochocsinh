# -*- coding: utf-8 -*-
from django.urls import path
from service.api.views import (AttendanceCreate, AttendanceDetailView,
                               AttendanceList, RouteDetailCreate,
                               RouteDetailUpdateView, RouteDetailView,
                               RouteList, RouteUpdateView, StationDetail,
                               StationList, StudentTripDetail, StudentTripList,
                               TripDetailView, VehicleDetail, VehicleList)

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
    path('list-student-trip', StudentTripList.as_view(), name='list_student_trip'),
    path('get-student-trip/<int:id>', StudentTripDetail.as_view(), name='detail_student_trip'),
    path('update-student-trip/<int:id>', StudentTripDetail.as_view(), name='update_student_trip'),
    path('delete-student-trip/<int:id>', StudentTripDetail.as_view(), name='delete_student_trip'),
    path('get-trip-detail/<int:id>', TripDetailView.as_view(), name='detail_trip_detail'),
    path('list-attendance', AttendanceList.as_view(), name='list_attendance'),
    path('create-attendance', AttendanceCreate.as_view(), name='create_attendance'),
    path('get-attendance/<int:id>', AttendanceDetailView.as_view(), name='get_attendance'),
]
