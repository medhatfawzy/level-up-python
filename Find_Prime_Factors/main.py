import pyximport
pyximport.install()
from functions import list_prime_factors, factors_prime


if __name__ == "__main__":
    print(list_prime_factors(760))
    print(factors_prime(760))
    print(list_prime_factors(630))
    print(factors_prime(630))
    print(list_prime_factors(13))
    print(factors_prime(13))
