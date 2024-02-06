** 110061217 hw2 Q3
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
+measdgt = 5
.temp  25

vdd vdd gnd 1.8
vinc vinc gnd pulse(0 1.8 10n .1n .1n 10n 20.2n)
vinb vinb gnd 1.8
vina vina gnd 1.8

.meas tran tfall trig v(vinc) val='0.9' rise=1 targ v(vout) val='0.9' fall=1
.meas tran trise trig v(vinc) val='0.9' fall=1 targ v(vout) val='0.9' rise=1

.tran .1p 50n

mpc vout vinc vdd vdd p_18 l=.2u w=.486u m=1
mpb vout vinb vdd vdd p_18 l=.2u w=.486u m=1
mpa vout vina vdd vdd p_18 l=.2u w=.486u m=1

mnc vout vinc vb gnd n_18 l=.2u w=1.2u m=1
mnb vb vinb va gnd n_18 l=.2u w=1.2u m=1
mna va vina gnd gnd n_18 l=.2u w=1.2u m=1
cout vout gnd 20f

.alter
.lib 'cic018.l' ff
.temp  -40

.alter
.lib 'cic018.l' ss
.temp 125

.alter
.lib 'cic018.l' sf
.temp 25

.alter
.lib 'cic018.l' fs
.temp 25

.alter
.lib 'cic018.l' tt
.temp 25

vinc vinc gnd 1.8
vinb vinb gnd 1.8
vina vina gnd pulse(0 1.8 5n .1n .1n 10n 20.2n)

.meas tran tfall trig v(vina) val=0.9 rise=1 targ v(vout) val=0.9 fall=1
.meas tran trise trig v(vina) val=0.9 fall=1 targ v(vout) val=0.9 rise=1

.alter
.lib 'cic018.l' ff
.temp  -40

vinc vinc gnd 1.8
vinb vinb gnd 1.8
vina vina gnd pulse(0 1.8 5n .1n .1n 10n 20.2n)

.meas tran tfall trig v(vina) val=0.9 rise=1 targ v(vout) val=0.9 fall=1
.meas tran trise trig v(vina) val=0.9 fall=1 targ v(vout) val=0.9 rise=1

.alter
.lib 'cic018.l' ss
.temp 125

vinc vinc gnd 1.8
vinb vinb gnd 1.8
vina vina gnd pulse(0 1.8 5n .1n .1n 10n 20.2n)

.meas tran tfall trig v(vina) val=0.9 rise=1 targ v(vout) val=0.9 fall=1
.meas tran trise trig v(vina) val=0.9 fall=1 targ v(vout) val=0.9 rise=1

.alter
.lib 'cic018.l' sf
.temp 25

vinc vinc gnd 1.8
vinb vinb gnd 1.8
vina vina gnd pulse(0 1.8 5n .1n .1n 10n 20.2n)

.meas tran tfall trig v(vina) val=0.9 rise=1 targ v(vout) val=0.9 fall=1
.meas tran trise trig v(vina) val=0.9 fall=1 targ v(vout) val=0.9 rise=1

.alter
.lib 'cic018.l' fs
.temp 25

vinc vinc gnd 1.8
vinb vinb gnd 1.8
vina vina gnd pulse(0 1.8 10n 100p 100p 10n 20.2n)

.meas tran tfall trig v(vina) val=0.9 rise=1 targ v(vout) val=0.9 fall=1
.meas tran trise trig v(vina) val=0.9 fall=1 targ v(vout) val=0.9 rise=1
.tran 1p 50n

.op
.end
