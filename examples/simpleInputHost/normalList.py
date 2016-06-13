#! /usr/bin/python2
import random

## generate list of 10 from norm(0,1)
x = [0] * 10
for i in range(len(x)):
    x[i] = random.gauss(0, 1)
