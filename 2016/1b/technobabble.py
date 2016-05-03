#! /usr/bin/env python3
newline = False

import itertools


def read_problem():
    n = int(input())
    return [input().split() for i in range(n)]


def solve(topics):
    maxfake = 0
    first = dict()
    second = dict()
    real = set()

    for n, topic in enumerate(topics):
        if topic[0] in first:
            first[topic[0]].append(n)
        else:
            first[topic[0]] = [n]
        if topic[1] in second:
            second[topic[1]].append(n)
        else:
            second[topic[1]] = [n]

    for word, ids in first.items():
        if len(ids) == 1:
            real.add(ids[0])
    for word, ids in second.items():
        if len(ids) == 1:
            real.add(ids[0])

    todofirst = []
    for ids in first.values():
        if all(id not in real for id in ids):
            todofirst.append(ids)

    todosecond = []
    for ids in second.values():
        if all(id not in real for id in ids):
            todosecond.append(ids)

    if len(todofirst) == 0:
        return len(topics) - len(real) - len(todosecond)
    elif len(todosecond) == 0:
        return len(topics) - len(real) - len(todofirst)

    if len(todofirst) < len(todosecond):
        for realids in itertools.product(*todofirst):
            newreal = real.union(realids)
            last = sum(all(id not in newreal for id in ids)
                       for ids in todosecond)
            fake = len(topics) - len(newreal) - last
            maxfake = max(fake, maxfake)
    else:
        for realids in itertools.product(*todosecond):
            newreal = real.union(realids)
            last = sum(all(id not in newreal for id in ids)
                       for ids in todofirst)
            fake = len(topics) - len(newreal) - last
            maxfake = max(fake, maxfake)

    return maxfake


print_solution = print

cases = int(input())
for n in range(1, cases + 1):
    problem = read_problem()
    solution = solve(problem)
    print("Case #{0}:".format(n), end='\n' if newline else ' ')
    print_solution(solution)
