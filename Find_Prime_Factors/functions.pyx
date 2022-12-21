from libc.math cimport sqrt

cdef is_prime(int p):
    """
    The simplest primality test is trial division: given an input number, n, 
    check whether it is evenly divisible by any prime number between 2 and √n 
    (i.e. that the division leaves no remainder). If so, then n is composite. Otherwise, it is prime.
    """
    if (p == 2):
        return True
    cdef int i = 2
    for i in range (2, int(sqrt(p)) + 1):
        if p % i == 0:
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
        if (number % i == 0 and is_prime(i)):
            factors.append(i)
    return factors


cpdef factors_prime(int number):
    """
    This is a function that returns a list of numbers that are primes,
    if multiplied the result is the number.
    """
    cdef list factors = []
    cdef int i = 2
    while number > 1:
        if(number % i == 0 and is_prime(i)):
            factors.append(i)
            number /= i
        else:
            i+=1
    return factors
