from unittest import result


this_file = 'lab06.py'


def make_adder_inc(n):
    """
    >>> adder1 = make_adder_inc(5)
    >>> adder2 = make_adder_inc(6)
    >>> adder1(2) 
    7
    >>> adder1(2) # 5 + 2 + 1
    8
    >>> adder1(10) # 5 + 10 + 2
    17
    >>> [adder1(x) for x in [1, 2, 3]]
    [9, 11, 13]
    >>> adder2(5)
    11
    """

    def adder_inc(value):
        nonlocal base 

        result = base + value
        base += 1
        return result
    
    base = n
    return adder_inc


def make_fib():
    """Returns a function that returns the next Fibonacci number
    every time it is called.

    >>> fib = make_fib()
    >>> fib()
    0
    >>> fib()
    1
    >>> fib()
    1
    >>> fib()
    2
    >>> fib()
    3
    >>> fib2 = make_fib()
    >>> fib() + sum([fib2() for _ in range(5)])
    12
    >>> from construct_check import check
    >>> # Do not use lists in your implementation
    >>> check(this_file, 'make_fib', ['List'])
    True
    """
    def fib():
        nonlocal fib_index, fib_now, fib_prev

        if fib_index == 0: 
            fib_index += 1
            return 0
        if fib_index == 1:
            fib_index += 1
            return 1
        
        fib_now, fib_prev = fib_now + fib_prev, fib_now
        return fib_now

    fib_index = 0
    fib_now = 1
    fib_prev = 0

    return fib

# Generators
def naturals():
    """A generator function that yields the infinite sequence of natural
    numbers, starting at 1.

    >>> m = naturals()
    >>> type(m)
    <class 'generator'>
    >>> [next(m) for _ in range(10)]
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    """
    i = 1
    while True:
        yield i
        i += 1

def scale(it, multiplier):
    """Yield elements of the iterable it scaled by a number multiplier.

    >>> m = scale([1, 5, 2], 5)
    >>> type(m)
    <class 'generator'>
    >>> list(m)
    [5, 25, 10]

    >>> m = scale(naturals(), 2)
    >>> [next(m) for _ in range(5)]
    [2, 4, 6, 8, 10]
    """

    for num in it:
        yield num * multiplier

def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    yield n
    if n > 1:
      if n % 2 == 0:
        yield from hailstone(n // 2)
      else:
        yield from hailstone(3 * n + 1)


if __name__ == "__main__":
    for num in hailstone(10):
        print(num)
