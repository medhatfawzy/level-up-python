#!python
#cython: language_level=3


cdef is_prime(int p):
    """
    The simplest primality test is trial division: given an input number, n, 
    check whether it is evenly divisible by any prime number between 2 and √n 
    (i.e. that the division leaves no remainder). If so, then n is composite. Otherwise, it is prime.
    To improve this algorithm, we can utilze the fact that every prime number > 3 can be expressed as:
        6k (+ or -) 1
    """
    if p <= 3:
        return p > 1
    if p % 2 == 0 or  p % 3 == 0:
        return False
    cdef int i = 6
    for i in range (6, int(p**0.5) + 1, 6):
        if p % (i - 1) == 0 or p % (i + 1):
            return False
    return True

cpdef list_prime_factors (int number):
    """
    This is a function that return a list of the prime factors that a number has,
    if the number is prime, it returns the number in a list.
    """
    cdef list factors = []
    cdef int i = 2
    for i in range(2, number + 1):
        if (number % i != 0): 
            continue
        if not is_prime(i): 
            continue
        factors.append(i)
    return factors

cpdef factors_prime(int number):
    """
    This is a function that returns a list of numbers that are primes,
    if multiplied the result is the number.
    """
    cdef list factors = []
    cdef int divider = 2

    while number >= divider:
        if(number % divider == 0):
            factors.append(divider)
            number /= divider
        else:
            divider += 1
    
    if len(factors) == 0:
        factors.append(number)
    return factors
