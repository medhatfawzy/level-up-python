from math import sqrt, ceil

cdef is_prime(int p):
    """
    The simplest primality test is trial division: given an input number, n, 
    check whether it is evenly divisible by any prime number between 2 and √n 
    (i.e. that the division leaves no remainder). If so, then n is composite. Otherwise, it is prime.
    """
    if (p == 2):
        return True
    for i in range (2, ceil(sqrt(p) + 1)):
        if p % i == 0:
            return False
    return True

cpdef find_prime_factors (int x):
    factors =[]
    for i in range(2, x+1):
        if (x % i == 0 and is_prime(i)):
            factors.append(i)
    return factors