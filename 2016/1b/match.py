#! /usr/bin/env python3
newline = False


def read_problem():
    coders, jammers = input().split()
    coders = [None if c == '?' else int(c) for c in coders]
    jammers = [None if c == '?' else int(c) for c in jammers]
    return (coders, jammers)


def score(coders, jammers):
    c = int(''.join(str(i) for i in coders))
    j = int(''.join(str(i) for i in jammers))
    return abs(c - j), c, j, coders, jammers


def solve(cj):
    coders = cj[0][:]
    jammers = cj[1][:]
    compare = 0
    for i in range(len(coders)):
        if coders[i] is None and jammers[i] is None:
            if compare < 0:
                coders[i] = 9
                jammers[i] = 0
            elif compare > 0:
                coders[i] = 0
                jammers[i] = 9
            else:
                coders[i] = jammers[i] = 0
                res0 = score(*solve((coders, jammers)))
                coders[i], jammers[i] = 0, 1
                res1 = score(*solve((coders, jammers)))
                coders[i], jammers[i] = 1, 0
                res2 = score(*solve((coders, jammers)))
                _, _, _, coders, jammers = min(res0, res1, res2)
                return coders, jammers
        elif coders[i] is None:
            if compare < 0:
                coders[i] = 9
            elif compare > 0:
                coders[i] = 0
            else:
                coders[i] = jammers[i]
                res0 = score(*solve((coders, jammers)))
                if jammers[i] > 0:
                    coders[i] = jammers[i] - 1
                    res1 = score(*solve((coders, jammers)))
                else:
                    res1 = 10**len(coders), 0, 0, 0, 0
                if jammers[i] < 9:
                    coders[i] = jammers[i] + 1
                    res2 = score(*solve((coders, jammers)))
                else:
                    res2 = 10**len(coders), 0, 0, 0, 0
                _, _, _, coders, jammers = min(res0, res1, res2)
                return coders, jammers
        elif jammers[i] is None:
            if compare < 0:
                jammers[i] = 0
            elif compare > 0:
                jammers[i] = 9
            else:
                jammers[i] = coders[i]
                res0 = score(*solve((coders, jammers)))
                if coders[i] > 0:
                    jammers[i] = coders[i] - 1
                    res1 = score(*solve((coders, jammers)))
                else:
                    res1 = 10**len(coders), 0, 0, 0, 0
                if coders[i] < 9:
                    jammers[i] = coders[i] + 1
                    res2 = score(*solve((coders, jammers)))
                else:
                    res2 = 10**len(coders), 0, 0, 0, 0
                _, _, _, coders, jammers = min(res0, res1, res2)
                return coders, jammers
        else:
            if compare == 0:
                if coders[i] < jammers[i]:
                    compare = -1
                elif coders[i] > jammers[i]:
                    compare = 1
    return (coders, jammers)


def print_solution(cj):
    coders = ''.join(str(i) for i in cj[0])
    jammers = ''.join(str(i) for i in cj[1])
    print(coders, jammers)


cases = int(input())
for n in range(1, cases + 1):
    problem = read_problem()
    solution = solve(problem)
    print("Case #{0}:".format(n), end='\n' if newline else ' ')
    print_solution(solution)
