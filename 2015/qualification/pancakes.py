import codejam
import collections
import itertools
import math

@codejam.input
def read(input):
    input.skipline()
    diners = input.readlist(int)
    return (diners,)

def special_minute(counter, pancakes, splits):
    counter[pancakes] = 0
    for split in splits:
        counter[pancakes - split] += 1
        counter[split] += 1
    newtime = besttime(counter)
    for split in splits:
        counter[pancakes - split] -= 1
        counter[split] -= 1
    counter[pancakes] = len(splits)
    return newtime

def besttime(counter):
    pancakes = max(pc for pc in counter if counter[pc])
    if pancakes <= 3:
        return pancakes
    else:
        count = counter[pancakes]
        mintime = pancakes
        for splits in itertools.combinations_with_replacement(range(1, pancakes // 2 + 1), count):
            newtime = special_minute(counter, pancakes, splits) + count
            if newtime < mintime:
                mintime = newtime
        return mintime

@codejam.solver
def solve(diners):
    counter = collections.Counter(diners)
    return besttime(counter)

@codejam.output
def format(case, result):
    return "Case #{0}: {1}".format(case, result)

if __name__ == '__main__':
    codejam.run()
