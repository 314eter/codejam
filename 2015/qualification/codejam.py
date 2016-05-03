import fileinput

class CodejamException(Exception):
    def __init__(self, func):
        self.func = func

    def __str__(self):
        return "Don't use {0}.".format(self.func)


class Input:
    def __init__(self):
        self.input = fileinput.input()

    def _convert(self, thing):
        try:
            return int(thing)
        except ValueError:
            try:
                return float(thing)
            except ValueError:
                return thing

    def skipline(self):
        self.input.readline()

    def readline(self):
        return self.input.readline().strip()

    def readvalue(self, read=None):
        if not read:
            read = self._convert
        thing = self.input.readline().strip()
        return read(thing)

    def readlist(self, read=None):
        if not read:
            read = self._convert
        things = self.input.readline().strip().split()
        return [read(thing) for thing in things]


_readcase = None

def input(func):
    global _readcase
    _readcase = func
    def dummy(*args, **kwargs):
        raise CodejamException(func)
    return dummy


_solver = None

def solver(func):
    global _solver
    _solver = func
    return func


_format = None

def output(func):
    global _format
    _format = func
    def format(result):
        return _format(0, result)
    return format


def run(caselines=1, solver=None, output=""):
    input = Input()
    cases = input.readvalue(int)
    for case in range(1, cases + 1):
        if _readcase:
            args = _readcase(input)
        else:
            args = [input.readlist() for i in range(caselines)]

        if _solver:
            result = _solver(*args)
        else:
            result = solver(*args)

        if _format:
            formatted = _format(case, result)
        else:
            formatted = output.format(case=case, result=result)

        print(formatted)

