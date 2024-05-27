# -*- coding: utf-8 -*-
from account.api.serializers import (DriverCreateSerializer, DriverSerializer,
                                     EmployeeCreateSerializer,
                                     EmployeeSerializer, StudentSerializer)
from account.models import Driver, Employee, Student
from django.http.response import Http404
from rest_framework import generics

from core.utils.api_resp import ErrorResponseException, success_api_resp


class StudentList(generics.ListAPIView):
    queryset = Student.objects.all().select_related('customer')
    serializer_class = StudentSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class StudentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer
    lookup_field = 'id'
    permission_classes = []

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))

    def update(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return success_api_resp(data=serializer.data)
            else:
                raise ErrorResponseException(error=serializer.errors)
        except Http404 as e:
            raise ErrorResponseException(error=str(e))

    def destroy(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            instance.delete()
            return success_api_resp(data=[])
        except Http404 as e:
            raise ErrorResponseException(error=str(e))


class EmployeeCreateView(generics.CreateAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeCreateSerializer


class EmployeeList(generics.ListAPIView):
    queryset = Employee.objects.all().select_related('user')
    serializer_class = EmployeeSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class DriverCreateView(generics.CreateAPIView):
    queryset = Driver.objects.all()
    serializer_class = DriverCreateSerializer


class DriverList(generics.ListAPIView):
    queryset = Driver.objects.all().select_related('user')
    serializer_class = DriverSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)
