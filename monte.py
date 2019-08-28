import multiprocessing as mp
import random
import time

no_points = 10**7

def checker(x: int):
    if x[0]**2 + x[1]**2 < 1:
        return 1
    return 0

def monte_para(points: int):
    pool = mp.Pool(processes=2)
    x = pool.map(checker, [(random.random(), random.random()) for i in range(points)])
    return 4*sum(x)/points

start = time.time()
x = monte_para(no_points)
end = time.time()
print("monte using {} points took {} seconds to run\nThe end result is: {} ".format(no_points, end-start, x))