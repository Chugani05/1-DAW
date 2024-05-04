BITE = 8
IP_BITE_SIZE = 4 * BITE


def get_bit_mask(mask: int) -> str:
    ones = '1' * mask
    zeros = '0' * (IP_BITE_SIZE - mask)
    return ones + zeros


def get_mask_ip(n: int) -> str:
    buffer = []
    bite_mask = get_bit_mask(n)
    for i in range(0, IP_BITE_SIZE, BITE):
        mask_chunk = bite_mask[i : i + BITE]
        mask_octet = int(mask_chunk, 2)
        buffer.append(str(mask_octet))
    return '.'.join(buffer)


if __name__ == '__main__':
    get_mask_ip(8)
