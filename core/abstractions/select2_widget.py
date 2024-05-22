# -*- coding: utf-8 -*-
from django_select2.forms import ModelSelect2MultipleWidget, ModelSelect2Widget


class CustomModelSelect2Widget(ModelSelect2Widget):
    def build_attrs(self, base_attrs, extra_attrs=None, **kwargs):
        attrs = super().build_attrs(base_attrs, extra_attrs, **kwargs)
        attrs.setdefault('style', '')
        attrs['style'] += 'width: 500px;'
        return attrs


class CustomModelSelect2MultipleWidget(ModelSelect2MultipleWidget):
    def build_attrs(self, base_attrs, extra_attrs=None, **kwargs):
        attrs = super().build_attrs(base_attrs, extra_attrs, **kwargs)
        attrs.setdefault('style', '')
        attrs['style'] += 'width: 500px;'
        return attrs
