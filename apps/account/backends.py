# -*- coding: utf-8 -*-
from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import check_password

User = get_user_model()


class PhoneAuthenticationBackend(ModelBackend):
    @staticmethod
    def authenticate(request, username=None, password=None):
        try:
            user = User.objects.get(phone=username)
        except User.DoesNotExist:
            return None

        if user and check_password(password, user.password):
            return user

        return None

    @staticmethod
    def get_user(user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
