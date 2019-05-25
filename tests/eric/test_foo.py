#!/usr/bin/env python3

import pytest

from eric import foo

def test_version_var():
    assert foo.VERSION == '1.5.dev'


def test_get_version():
    assert foo.get_version() == '1.5.dev'
