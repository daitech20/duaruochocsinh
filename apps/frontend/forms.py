# -*- coding: utf-8 -*-
from account.models import (CitizenIdentification, Customer,
                            RepresentativeUnit, User)
from django import forms
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from django.forms import inlineformset_factory


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
