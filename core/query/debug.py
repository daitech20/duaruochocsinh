# -*- coding: utf-8 -*-
import functools
import time

from django.db import connection, reset_queries


def query_debugger(func):
    @functools.wraps(func)
    def inner_func(*args, **kwargs):
        reset_queries()

        start_queries = len(connection.queries)

        start = time.perf_counter()
        result = func(*args, **kwargs)
        end = time.perf_counter()

        end_queries = len(connection.queries)

        print("Function : " + func.__name__)
        print("Number of Queries : {}".format(end_queries - start_queries))
        print("Finished in : {}".format(end - start))

        return result

    return inner_func


def log_queries(func):
    def wrapper(*args, **kwargs):
        try:
            # Ghi lại tất cả các truy vấn cơ sở dữ liệu
            with connection.cursor() as cursor:
                cursor.execute('SET GLOBAL log_output = "FILE";')
                cursor.execute('SET GLOBAL general_log_file = "/tmp/django_queries.log";')
                cursor.execute('SET GLOBAL general_log = "ON";')
            return func(*args, **kwargs)
        finally:
            # Tắt việc ghi log khi hoàn thành
            with connection.cursor() as cursor:
                cursor.execute('SET GLOBAL general_log = "OFF";')

            # In các truy vấn cơ sở dữ liệu ra terminal
            for query in connection.queries:
                print(query['sql'])
    return wrapper
