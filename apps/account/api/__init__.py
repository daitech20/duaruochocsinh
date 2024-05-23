# -*- coding: utf-8 -*-
from account.api.views import StudentDetail, StudentList
from django.urls import path

urlpatterns = [
    path('list-student', StudentList.as_view(), name='list_student'),
    path('get-student/<int:id>', StudentDetail.as_view(), name='detail_student'),
    path('update-student/<int:id>', StudentDetail.as_view(), name='update_student'),
    path('delete-student/<int:id>', StudentDetail.as_view(), name='delete_student'),
]
