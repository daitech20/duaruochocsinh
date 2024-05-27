# -*- coding: utf-8 -*-
# urls.py
from django.urls import path

from .views import (OrderDetailStatsByMonthView,
                    OrderDetailStatsByTimePackageView)

urlpatterns = [
    path('month/<int:month>/<int:year>/', OrderDetailStatsByMonthView.as_view(), name='order-detail-stats-by-month'),
    path('time-package/', OrderDetailStatsByTimePackageView.as_view(), name='order-detail-stats-by-time-package'),
]
