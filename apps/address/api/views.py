# -*- coding: utf-8 -*-
from address.api.serializers import (DistrictSerializer, ProvinceSerializer,
                                     WardSerializer)
from address.models import District, Province, Ward
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters, generics

from core.utils.api_resp import ErrorResponseException, success_api_resp


class ProvinceList(generics.ListAPIView):
    queryset = Province.objects.all()
    serializer_class = ProvinceSerializer
    permission_classes = []
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['name', 'code']
    filterset_fields = ['administrative_unit', 'administrative_region']
    ordering_fields = ['-id']

    def get_queryset(self):
        queryset = Province.objects.select_related('administrative_unit', 'administrative_region')
        queryset = self.filter_queryset(queryset)

        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class ProvinceDetail(generics.RetrieveAPIView):
    queryset = Province.objects.all()
    serializer_class = ProvinceSerializer
    permission_classes = []
    lookup_field = 'code'

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)

            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))


class DistrictList(generics.ListAPIView):
    queryset = District.objects.all()
    serializer_class = DistrictSerializer
    permission_classes = []
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['name', 'code']
    filterset_fields = ['province_code']
    ordering_fields = ['-id']

    def get_queryset(self):
        queryset = District.objects.select_related('province_code', 'administrative_unit')
        queryset = self.filter_queryset(queryset)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class DistrictDetail(generics.RetrieveAPIView):
    queryset = District.objects.all()
    serializer_class = DistrictSerializer
    permission_classes = []
    lookup_field = 'code'

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)

            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))


class WardList(generics.ListAPIView):
    queryset = Ward.objects.all()
    serializer_class = WardSerializer
    permission_classes = []
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['name', 'code']
    filterset_fields = ['district_code']
    ordering_fields = ['-id']

    def get_queryset(self):
        queryset = Ward.objects.select_related(
            'district_code',
            'district_code__province_code',
            'district_code__province_code__administrative_unit',
            'district_code__province_code__administrative_region',
            'administrative_unit'
        )
        queryset = self.filter_queryset(queryset)
        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class WardDetail(generics.RetrieveAPIView):
    queryset = Ward.objects.all()
    serializer_class = WardSerializer
    permission_classes = []
    lookup_field = 'code'

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)

            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))
