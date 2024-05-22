# -*- coding: utf-8 -*-
from rest_framework.pagination import LimitOffsetPagination


class PaginationMixin(LimitOffsetPagination):
    default_limit = 15
    limit_query_param = 'limit'
    offset_query_param = 'offset'
    max_limit = 100
