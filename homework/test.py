def combo(a, b):
  """Return the smallest integer with all of the digits of a and b
  >>> combo(531, 432)
  45312
  >>> combo(531, 4321)
  45321
  >>> combo(1234, 9123)
  91234
  >>> combo(0, 321)
  321
  """

  if a == 0 or b == 0:
    return a + b
  elif a % 10 == b % 10:
    return combo(a // 10, b // 10) * 10 + a % 10
  return min(combo(a // 10, b) * 10 + a % 10, combo(a, b // 10) * 10 + b % 10)
