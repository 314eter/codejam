import codejam

one = 1
i = 2
j = 3
k = 4

quaternion = {'1': 1, 'i': 2, 'j': 3, 'k': 4}
letter = ['', '1', 'i', 'j', 'k']

multable = [
    [0, 0, 0, 0, 0],
    [0, 1, 2, 3, 4],
    [0, 2,-1, 4,-3],
    [0, 3,-4,-1, 2],
    [0, 4, 3,-2,-1]
]

def mul(x, y):
    prod = multable[abs(x)][abs(y)]
    return prod if (x < 0) == (y < 0) else -prod

@codejam.input
def read(input):
    _, repeat = input.readlist(int)
    string = [quaternion[char] for char in input.readline()]
    return (string, repeat)


def first(string, repeat, pos, q):
    x = one
    occured = set()
    if pos == 0:
        occured.add(one)
    for p in range(pos, len(string)):
        x = mul(x, string[p])
        if x == q:
            return (0, p)
    for r in range(1, repeat):
        if x in occured:
            return (repeat, 0)
        else:
            occured.add(x)
        for p in range(len(string)):
            x = mul(x, string[p])
            if x == q:
                return (r, p)
    return (repeat, 0)

def compute(string, repeat, pos):
    x1 = one
    x2 = one
    for p in range(pos, len(string)):
        x1 = mul(x1, string[p])
    if repeat > 1:
        for p in range(len(string)):
            x2 = mul(x2, string[p])
        x3 = one
        xp = x2
        while repeat > 0:
            if repeat % 2:
                x3 = mul(x3, xp)
            repeat = repeat >> 1
            xp = mul(xp, xp)
        x1 = mul(x1, x3)
    return x1

@codejam.solver
def solve(string, repeat):
    pos = 0
    for q in (i, j):
        r, p = first(string, repeat, pos, q)
        repeat -= r
        pos = p + 1
        if pos == len(string):
            repeat -= 1
            pos = 0
        if repeat <= 0:
            return False
    return compute(string, repeat, pos) == k


@codejam.output
def format(case, result):
    return "Case #{0}: {1}".format(case, 'YES' if result else 'NO')

if __name__ == '__main__':
    codejam.run()
