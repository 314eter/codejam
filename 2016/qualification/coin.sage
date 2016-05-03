import sys

k = int(sys.argv[1])
j = int(sys.argv[2])

l = [0] * k
l[0] = l[-1] = 1

def number(l, base):
  return sum(l[i] * base^i for i in range(len(l)))

def proof(l):
  return [divisors(number(l, b))[1] for b in range(2, 11)]

print "Case #1:

count = 0
while True:
  if all(not is_prime(number(l, b)) for b in range(2, 11)):
    print ''.join(str(i) for i in reversed(l)), ' '.join(str(i) for i in proof(l))
    count += 1
    if count == j:
      break
  for i in range(1, k):
    if l[i] == 0:
      l[i] = 1
      break
    else:
      l[i] = 0
  else:
    break
