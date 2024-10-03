import sys

import pytest

sys.path.insert(0, '../ejer')
from calc_from_str import calc

TESTDATA = (
    ('3+2', 5),
    ('3-2', 1),
    ('3*2', 6),
    ('3/2', 1.5),
    ('3 / 2', 1.5),
    ('30 -24', 6),
    ('40    *   5', 200),
)


@pytest.mark.parametrize('expression,expected', TESTDATA)
def test_core(expression: str, expected: list[str]):
    assert calc(expression) == expected
