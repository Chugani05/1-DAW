# ******************
# FIBONACCI ITERABLE
# ******************


class Fibonacci:
    def __init__(self, n):
        self.n = n
        self.current = 0
        self.next = 1
        self.count = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.count < self.n:
            result = self.current
            self.current, self.next = self.next, self.current + self.next
            self.count += 1
            return result
        else:
            raise StopIteration


def run(n: int):
    return list(Fibonacci(n))
