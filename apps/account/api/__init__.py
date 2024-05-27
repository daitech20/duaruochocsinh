# -*- coding: utf-8 -*-
from account.api.views import (DriverCreateView, DriverList,
                               EmployeeCreateView, EmployeeList, StudentDetail,
                               StudentList)
from django.urls import path

urlpatterns = [
    path('list-student', StudentList.as_view(), name='list_student'),
    path('get-student/<int:id>', StudentDetail.as_view(), name='detail_student'),
    path('update-student/<int:id>', StudentDetail.as_view(), name='update_student'),
    path('delete-student/<int:id>', StudentDetail.as_view(), name='delete_student'),
    path('create-employee', EmployeeCreateView.as_view(), name='employee-create'),
    path('list-employee', EmployeeList.as_view(), name='list_employee'),
    path('create-driver', DriverCreateView.as_view(), name='driver-create'),
    path('list-driver', DriverList.as_view(), name='list_driver'),
]
