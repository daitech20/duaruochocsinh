# -*- coding: utf-8 -*-
from account.models import (CitizenIdentification, Customer,
                            RepresentativeUnit, Student, User)
from django import forms
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from django.forms import inlineformset_factory
from service.models import (Route, RouteDetail, Schedule, Station, StudentTrip,
                            TripDetail, Vehicle)


class CustomUserCreationForm(forms.ModelForm):
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}))
    password2 = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'placeholder': 'Confirm Password'}))
    full_name = forms.CharField(max_length=100, required=True, help_text='Required.')

    class Meta:
        model = User
        fields = ('phone', 'password1', 'password2', 'full_name', 'email')

    # Định nghĩa các widget cho trường phone
    widgets = {
        'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone number'}),
        'email': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
        'full_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Full name'}),
    }

    def clean_password1(self):
        password1 = self.cleaned_data.get("password1")
        try:
            validate_password(password1)
        except ValidationError as e:
            raise forms.ValidationError(e.messages)
        return password1

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])

        if commit:
            user.save()

        Customer.objects.create(
            user=user,
            full_name=user.full_name
        )

        return user


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['full_name']

    widgets = {
        'full_name': forms.TextInput(attrs={'class': 'form-control'}),
    }

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class RepresentativeUnitForm(forms.ModelForm):
    class Meta:
        model = RepresentativeUnit
        fields = ['name', 'phone', 'address']


class CitizenIdentificationForm(forms.ModelForm):
    class Meta:
        model = CitizenIdentification
        fields = ['code', 'front', 'back']


class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['gender', 'date_of_birth', 'address', 'address2', 'date_of_birth']
        widgets = {
            'date_of_birth': forms.DateInput(attrs={'type': 'date'}),
        }


CustomerFormSet = inlineformset_factory(User, Customer, form=CustomerForm, can_delete=False)


class PerInforForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('phone', 'full_name',)

    widgets = {
        'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone number'}),
        'full_name': forms.TextInput(attrs={'class': 'form-control'}),
    }

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ('gender', 'full_name', 'classroom', 'date_of_birth', 'image')
        widgets = {
            'date_of_birth': forms.DateInput(attrs={'type': 'date'}),
        }

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class VehicleForm(forms.ModelForm):
    class Meta:
        model = Vehicle
        fields = ('code', 'vehicle_type', 'price')

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class StationForm(forms.ModelForm):
    class Meta:
        model = Station
        fields = ('latitude', 'longitude', 'name')

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class RouteForm(forms.ModelForm):
    class Meta:
        model = Route
        fields = ('name', 'pickup', 'dropoff')

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class RouteDetailForm(forms.ModelForm):
    class Meta:
        model = RouteDetail
        fields = ['station', 'sequence']


class ScheduleForm(forms.ModelForm):
    class Meta:
        model = Schedule
        fields = ['start_day', 'end_day', 'distance', 'pickup_time', 'route', 'vehicle', 'driver', 'employee']
        widgets = {
            'start_day': forms.DateInput(attrs={'type': 'date'}),
            'end_day': forms.DateInput(attrs={'type': 'date'}),
            'pickup_time': forms.TimeInput(attrs={'type': 'time'}),
        }

    def __init__(self, *args, **kwargs):
        vehicle_type = kwargs.pop('vehicle_type', None)
        super(ScheduleForm, self).__init__(*args, **kwargs)
        if vehicle_type:
            self.fields['vehicle'].queryset = Vehicle.objects.filter(vehicle_type=vehicle_type)


class StudentTripForm(forms.ModelForm):
    class Meta:
        model = StudentTrip
        fields = ('schedule', 'student')

    def __init__(self, *args, **kwargs):
        customer = kwargs.pop('customer', None)
        print(customer)
        super(StudentTripForm, self).__init__(*args, **kwargs)
        if customer:
            self.fields['student'].queryset = Student.objects.filter(customer=customer)

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user


class TripDetailForm(forms.ModelForm):
    class Meta:
        model = TripDetail
        fields = ('start_time', 'schedule')
        widgets = {
            'start_time': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()

        return user
