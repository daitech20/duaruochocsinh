# -*- coding: utf-8 -*-
from functools import wraps


def track_page_visit(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        print(request.META.get('REMOTE_ADDR'))
        print(request.META.get('HTTP_USER_AGENT'))
        return view_func(request, *args, **kwargs)
    return _wrapped_view
