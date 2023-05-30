import sys

def fibonacciNoRecursivo(n: int) -> int:
  secuenciaNFibonacci : list = [0, 1]
  if (n == 0 or n == 1):
    return secuenciaNFibonacci[n]
  else:
    i : int = 1
    while (i < n):
      secuenciaNFibonacci.append(secuenciaNFibonacci[i] + secuenciaNFibonacci[i-1])
      i = i + 1
    return secuenciaNFibonacci[n]

if __name__ == '__main__':
  x = int(input())
  print(fibonacciNoRecursivo(x))