def sort(asc=True):
    def decorator(func):
        def wrapper(*args, **kwargs):
            if asc:
                return sorted(func(*args, **kwargs))
            else:
                return sorted(func(*args, **kwargs), reverse=True)

        return wrapper

    return decorator


@sort()
def extract_evens(*values):
    return (v for v in values if v % 2 == 0)


if __name__ == "__main__":
    print(extract_evens(8, 1, 4, 2, 5))
