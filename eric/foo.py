#!/usr/bin/env python3

"""Test Module."""  # pylint: disable=blacklisted-name

from typing import Any

import requests_html

VERSION = '1.5.dev'


def get_version() -> str:
    """Comment on this function."""
    return VERSION


def untested_function() -> str:
    """Comment on this function."""
    return 'I\'m not tested'


def another_untested_function() -> str:
    """Comment on this function."""
    return 'I\'m not tested'


def yet_another_untested_function() -> str:
    """Another comment."""
    for var in range(100):
        print('Test me Please', var)
    return 'I\'m not tested as well'


def and_yet_another_untested_function() -> str:
    """Complain about not being tested."""
    for var in range(100):
        print(F'Test me Please, Please: {var}')
    return 'I\'m not tested as well, are you serious?'


def scrape_url(url: str) -> Any:  # type: ignore
    """Scrape a url."""
    session = requests_html.HTMLSession()
    resp = session.get(url, timeout=5)
    resp.html.render()
    return resp.html.html
