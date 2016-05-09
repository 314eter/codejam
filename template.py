#! /usr/bin/env python3
newline = False


def read_problem():
    return input()


def solve(problem):
    return solution


def print_solution(solution):
    pass


cases = int(input())
for n in range(1, cases + 1):
    problem = read_problem()
    solution = solve(problem)
    print("Case #{0}:".format(n), end='\n' if newline else ' ')
    print_solution(solution)
