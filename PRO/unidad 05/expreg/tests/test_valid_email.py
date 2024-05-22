import sys

import pytest

sys.path.insert(0, '../ejer')
from valid_email import is_valid_email

TESTDATA = (
    ('info@iespuertodelacruz.es', True),
    ('info@', False),
    ('info@iespto.gobcan.edu.es', True),
    ('info-alumnado@iespto.gobcan.edu.es', True),
    ('info$alumnado@iespto.gobcan.edu.es', False),
    ('info@iespto.gobcan.edu.es/', False),
    ('info@iespto.gobcan.edu.es/blog/', False),
)


@pytest.mark.parametrize('email,expected', TESTDATA)
def test_core(email: str, expected: list[str]):
    assert is_valid_email(email) is expected
