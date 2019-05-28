#!/usr/bin/env python3

import pytest

from eric import foo

@pytest.mark.test1
def test_version_var():
    assert foo.VERSION == '1.5.dev2'


@pytest.mark.test2
def test_get_version():
    assert foo.get_version() == '1.5.dev'


@pytest.mark.test3
def test_always_true():
    assert True


@pytest.mark.test4
def test_always_false():
    assert False is not True
