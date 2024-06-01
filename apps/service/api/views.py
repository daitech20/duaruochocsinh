# -*- coding: utf-8 -*-
from django.http.response import Http404
from rest_framework import generics
from service.api.serializers import (AttendanceSerializer,
                                     RouteDetailSerializer, RouteDSerializer,
                                     RouteSerializer, StationSerializer,
                                     StudentTripSerializer,
                                     TripDetailSerializer,
                                     TripDetailUpdateSerializer,
                                     VehicleSerializer)
from service.models import (Attendance, Route, RouteDetail, Station,
                            StudentTrip, TripDetail, Vehicle)

from core.utils.api_resp import ErrorResponseException, success_api_resp


class VehicleList(generics.ListAPIView):
    queryset = Vehicle.objects.all()
    serializer_class = VehicleSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class VehicleDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Vehicle.objects.all()
    serializer_class = VehicleSerializer
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


class StationList(generics.ListAPIView):
    queryset = Station.objects.all()
    serializer_class = StationSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class StationDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Station.objects.all()
    serializer_class = StationSerializer
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


class RouteList(generics.ListAPIView):
    queryset = Route.objects.all()
    serializer_class = RouteSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class RouteDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Route.objects.all()
    serializer_class = RouteDSerializer
    lookup_field = 'id'
    permission_classes = []

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))


class RouteUpdateView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Route.objects.all()
    serializer_class = RouteSerializer
    lookup_field = 'id'
    permission_classes = []

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


class RouteDetailCreate(generics.CreateAPIView):
    queryset = RouteDetail.objects.all()
    serializer_class = RouteDetailSerializer
    permission_classes = []

    def perform_create(self, serializer):
        serializer.save()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return success_api_resp(data=serializer.data)


class RouteDetailUpdateView(generics.RetrieveUpdateDestroyAPIView):
    queryset = RouteDetail.objects.all()
    serializer_class = RouteDetailSerializer
    lookup_field = 'id'
    permission_classes = []

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
            route_id = instance.route.id
            instance.delete()
            self.update_sequence(route_id)
            return success_api_resp(data=[])
        except Http404 as e:
            raise ErrorResponseException(error=str(e))

    def update_sequence(self, route_id):
        details = RouteDetail.objects.filter(route_id=route_id).order_by('sequence')
        for index, detail in enumerate(details, start=1):
            detail.sequence = index + 1
            detail.save()


class StudentTripList(generics.ListAPIView):
    queryset = StudentTrip.objects.all()
    serializer_class = StudentTripSerializer

    def get_queryset(self):
        schedule_id = self.request.query_params.get('schedule_id')
        queryset = StudentTrip.objects.filter(schedule_id=schedule_id)

        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class StudentTripDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = StudentTrip.objects.all()
    serializer_class = StudentTripSerializer
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


class TripDetailView(generics.RetrieveAPIView):
    queryset = TripDetail.objects.all()
    serializer_class = TripDetailSerializer
    lookup_field = 'id'
    permission_classes = []

    def retrieve(self, request, *args, **kwargs):
        try:
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            return success_api_resp(data=serializer.data)
        except Exception as e:
            raise ErrorResponseException(error=str(e))


class TripDetailUpdateView(generics.RetrieveUpdateDestroyAPIView):
    queryset = TripDetail.objects.all()
    serializer_class = TripDetailUpdateSerializer
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


class AttendanceList(generics.ListAPIView):
    queryset = Attendance.objects.all()
    serializer_class = AttendanceSerializer

    def get_queryset(self):
        queryset = Attendance.objects.all()
        student_id = self.request.query_params.get('student_id', None)
        trip_detail_id = self.request.query_params.get('trip_detail_id', None)

        if student_id is not None and trip_detail_id is not None:
            queryset = queryset.filter(student_id=student_id, trip_detail_id=trip_detail_id)

        return queryset

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return success_api_resp(data=serializer.data)


class AttendanceCreate(generics.CreateAPIView):
    queryset = Attendance.objects.all()
    serializer_class = AttendanceSerializer
    permission_classes = []

    def perform_create(self, serializer):
        serializer.save()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return success_api_resp(data=serializer.data)


class AttendanceDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Attendance.objects.all()
    serializer_class = AttendanceSerializer
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
