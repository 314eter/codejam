import codejam

@codejam.input
def read(input):
    smax, string = input.readline().split()
    slist = list(map(int, string))
    return (int(smax), slist)

@codejam.solver
def solve(smax, slist):
    friends = 0
    total = 0
    for s in range(smax):
        total += slist[s]
        if total < s + 1:
            friends += s + 1 - total
            total = s + 1
    return friends

@codejam.output
def format(case, result):
    return "Case #{0}: {1}".format(case, result)

if __name__ == '__main__':
    codejam.run()
