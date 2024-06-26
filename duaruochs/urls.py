# -*- coding: utf-8 -*-
"""
URL configuration for duaruochs project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("admin/", admin.site.urls),
    path("select2/", include("django_select2.urls")),
    path("address/", include("apps.address.urls")),
    path("account/", include("apps.account.urls")),
    path("service/", include("apps.service.urls")),
    path("order/", include("apps.order.urls")),
    path("", include('frontend.urls', namespace="frontend")),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
