*************EE3230 VLSI HW4 testbench***************
***Copyright 2023 PHLAB. All right reserved.
 
*************simulation Setup************************
.prot
.lib 'cic018.l' TT
.unprot
.option post=1
.option accurate=1
.option runlvl=6
.temp 25

*************include your circuit file*******************
.include ''

*************parameter declaration*******************
.param vd=1.8
.param tclk=20n trf=200p tclkhalf='tclk/2-trf'
.param tdata=80n tdatahalf='tdata/2-trf'
.param t_setup=0
.param t_hold=0
.param tdelay_d='tclk/4-t_setup+t_hold' tdelay_d_power='tdelay_d-tclk/20'
.param tdelay_clk='tclk/4'

.param tstart_meas_p='2*tclk'
.param tstop_meas_p='6*tclk'
.param simcase=0

************* set global VDD/VSS/CLK ****************
.global VDD
.global VSS
.global CLK

************  Top Schematic	 ************************
*** put your top MS_DFF here (need to care pin order)
XMS_DFF CLK D Q QB VDD VSS / MS_DFF
Cload Q VSS 50f

*****************************************************

***Voltage or Circuit Source Description*************

VVDD VDD 0  vd
VVSS VSS 0  0
VCLK CLK VSS PULSE 0 vd tdelay_clk trf trf tclkhalf tclk


************Simulation to Run************************
***			Simulation table
***	0		Power
***	1		Setup time rising & CK2Q & D2Q
***	2		Setup time falling & CK2Q & D2Q
***	3		Hold time rising
***	4		Hold time falling
*****************************************************
.probe v(*) i(*)

.if (simcase == 0)
*** Measure power
	.ic V(Q) 0
	VDATA D VSS PULSE 0 1.8 tdelay_d_power trf trf tdatahalf tdata
	.trans 1p tstop_meas_p
	.measure tran PVDD AVG PAR('(V(VDD)*-1*I(VVDD))') from=tstart_meas_p to=tstop_meas_p
.elseif (simcase == 1)
*** setup time Vout rising 0->1.8, Q=0=>fail, Q=vd=>pass
	.ic V(Q) 0
	VDATA D VSS PULSE 0 1.8 tdelay_d trf trf tdatahalf tdata
	.trans 1p tclk  sweep t_setup 0 130p 1p
	.meas TRAN Q find V(Q) WHEN V(CLK)=0.9 FALL=1
	.meas TRAN CLK2Q_lh TRIG V(CLK) VAL = 0.9 RISE = 1
	+                   TARG V(Q)   VAL = 0.9 RISE = 1
	.meas TRAN D2Q_lh 	TRIG V(D) 	VAL = 0.9 RISE = 1
	+                   TARG V(Q)   VAL = 0.9 RISE = 1
.elseif (simcase == 2)
*** setup time Vout falling 1.8->0, Q=1.8=>fail, Q=0=>pass
	.ic V(Q) vd
	VDATA D VSS PULSE 1.8 0 tdelay_d trf trf tdatahalf tdata
	.trans 1p 20n  sweep t_setup 0 130p 1p
	.meas TRAN Q find V(Q) WHEN V(CLK)=0.9 FALL=1
	.meas TRAN CLK2Q_hl TRIG V(CLK) VAL = 0.9 RISE = 1
	+                   TARG V(Q)   VAL = 0.9 FALL = 1
	.meas TRAN D2Q_hl 	TRIG V(D) 	VAL = 0.9 FALL = 1
	+                   TARG V(Q)   VAL = 0.9 FALL = 1
.elseif (simcase == 3)
*** hold time vd transition is 1.8->0,Vout change as 0(fail)->1.8(pass)
	.ic V(Q) 0
	VDATA D VSS PULSE 1.8 0 tdelay_d trf trf tdatahalf tdata
	.trans 1p 20n sweep t_hold -90p 30p 1p
	.meas TRAN Q_ishigh find V(Q) WHEN V(CLK)=0.9 FALL=1
.elseif (simcase == 4)
*** hold time  vd transition is 0->1.8,Vout change as 1.8(fail)->0(pass)
	.ic V(Q) vd
	VDATA D VSS PULSE 0 1.8 tdelay_d trf trf tdatahalf tdata
	.trans 1p 20n sweep t_hold -90p 30p 1p
	.meas TRAN Q_islow find V(Q) WHEN V(CLK)=0.9 FALL=1
.else
.endif

*****************************************************
.alter
.param simcase=1
.alter
.param simcase=2
.alter
.param simcase=3
.alter
.param simcase=4
.alter
.param simcase=5
*****************************************************
.END
