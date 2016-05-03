#! /usr/bin/env python3
newline = False

import collections

read_problem = input


def remove(counter, letter, word):
    n = 0
    while counter[letter]:
        for c in word:
            counter[c] -= 1
        n += 1
    return n


def solve(line):
    counter = collections.Counter(line)
    zero = remove(counter, "Z", "ZERO")
    two = remove(counter, "W", "TWO")
    four = remove(counter, "U", "FOUR")
    one = remove(counter, "O", "ONE")
    three = remove(counter, "R", "THREE")
    five = remove(counter, "F", "FIVE")
    six = remove(counter, "X", "SIX")
    seven = remove(counter, "S", "SEVEN")
    eight = remove(counter, "G", "EIGHT")
    nine = remove(counter, "I", "NINE")
    return '0' * zero + '1' * one + '2' * two + '3' * three + '4' * four + '5' * five + '6' * six + '7' * seven + '8' * eight + '9' * nine


print_solution = print

cases = int(input())
for n in range(1, cases + 1):
    problem = read_problem()
    solution = solve(problem)
    print("Case #{0}:".format(n), end='\n' if newline else ' ')
    print_solution(solution)
