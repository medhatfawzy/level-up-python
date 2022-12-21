import pyximport
pyximport.install()
from find_prime_factors import find_prime_factors


if __name__ == "__main__":
    print(find_prime_factors(630))
    print(find_prime_factors(13))