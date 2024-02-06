x0 = 1
x1 = 0
x2 = 0
x3 = 0
x4 = 0
x5 = 0
x6 = 0
x7 = 0
x8 = 0
x9 = 0
x10 = 0
x11 = 0
x12 = 0
x13 = 0
x14 = 0
x15 = 0
L = 0
valid = 0
num = 1
while valid == 0:
    x14 = x13
    x13 = x12
    x12 = x11
    x11 = x10
    x10 = x9
    x9 = x8
    x8 = x7
    x7 = x6
    x6 = x5
    x5 = x4
    x4 = x3
    x3 = x2
    x2 = x1
    x1 = x0
    x0 = x14 ^ x13
    L = x0 + x1*2 + x2*4 + x3*8 + x4*16+ x5*32 + x6*64 + x7*128 + x8*512 + x9*1024 + x10*2048 + x11*4096 + x12*8192 + x13*16384 +x14*32768 - x15*65536
    #if L == 124:
    print (num, '-' , L)
    if num == 1000:
        valid = 1
    num += 1