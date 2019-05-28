#!/usr/bin/env python3

"""Test Module."""  # pylint: disable=blacklisted-name


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
