# reverse array in place

array = [1,2,3,4,5]

# iterative solution
def reverse_array(array)
  return array if array.length == 1

  j = array.length
  (j / 2).times do |i|
    j -= 1
    array[i],array[j] = array[j],array[i]
  end
  return array
end
# reverse_array(array)
# reverse_array([1])

def reverse(array, i, j)
  if i < j
    array[i],array[j] = array[j],array[i]
    i += 1
    j -= 1
    reverse(array, i, j)
  end
  return array
end

def reverse_array_recursive(array)
  return array if array.length == 1
  j = array.length - 1
  reverse(array, 0, j)
  return array
end
# p reverse_array_recursive(array)


# examples of palidrome: racecar, tacocats, mom, dad
# check if string is palindrome return true or false
def palidrome?(word)
  j = word.length - 1
  half_length = word.length / 2

  half_length.times do |i|
    if word[i] != word[j]
      return false
    end
    j -= 1
  end

  return true
end
# p palidrome?('racecar')
# p palidrome?('mom')
# p palidrome?('hello')
# p palidrome?('cynthia')

def palidrome_recursive?(word)
end

# return the nth fib numb in series
# 1  2  3  4  5  6  7   8   9
# 0, 1, 1, 2, 3, 5, 8, 13, 21 ...
def fibonacci(n)
  if n == 0 || n == 1
    return n
  end

  first = 0
  second = 1
  current = 1

  while n > 2
    first = second
    second = current
    current = first + second
    n -= 1
  end

  return current
end
# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)
# p fibonacci(7)

def fibonacci_recursive(n)
  if n == 0 || n == 1
    return n
  end
  # ex n = 5: fib(4) + fib(3) ==> fib(3) + fib(2) ==> fib(2) + 1 =
  return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end
# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)
# p fibonacci(7)
