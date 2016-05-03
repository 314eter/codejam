import codejam

@codejam.input
def read(input):
    N, rows, cols = input.readlist(int)
    return (N, rows, cols)

@codejam.solver
def solve(N, rows, cols):
    if (rows * cols) % N:
        return 'RICHARD'
    if rows > cols:
        rows, cols = cols, rows

    if N <= 2:
        return 'GABRIEL'

    if N == 3:
        return 'RICHARD' if rows == 1 else 'GABRIEL'

    if N == 4:
        return 'RICHARD' if rows <= 2 else 'GABRIEL'

    if N == 5:
        if rows <= 2 or (rows, cols) == (3, 5):
            return 'RICHARD'
        else:
            return 'GABRIEL'

    if N == 6:
        return 'RICHARD' if rows <= 3 else 'GABRIEL'

    if N == 7:
        return 'RICHARD'


@codejam.output
def format(case, result):
    return "Case #{0}: {1}".format(case, result)

if __name__ == '__main__':
    codejam.run()
