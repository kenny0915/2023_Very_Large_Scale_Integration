*************EE3230 VLSI Final Project testbench***************
***Copyright 2023 PHLAB. All right reserved.

*************simulation Setup************************
.prot
.lib 'cic018.l' TT
.unprot
.option post=1
.option accurate=1
.option runlvl=5
.temp 25

*.include 'put your netlist link here'

*** essential VA for testbench ***
.hdl ./pattern_generator.va
.hdl ./checker.va
*************parameter declaration*******************
.param vd=1.8
.param FREQCK=0.1G
.param tclk='1/FREQCK'
.param sim_step='0.001/FREQCK'
.param tstart_meas_p='3.5*tclk'
.param tstop_meas_p='100*tclk'
.param simcase=1
.parameter pattern_mode=0
************* set global VDD/VSS/CLK ****************
.global VDD
.global VSS
.global CLK
*********** CALL Sub-Circuit & Library***************


*****************************************************

************  Top Schematic	 ************************
*** put your top here (need to care pin order)

*Example: XTOP A0.....AN.... / TOP 


*** output capacitor ***
CL_ACC0 ACC0 VSS 100f
CL_ACC1 ACC1 VSS 100f
CL_ACC2 ACC2 VSS 100f
CL_ACC3 ACC3 VSS 100f
CL_ACC4 ACC4 VSS 100f
CL_ACC5 ACC5 VSS 100f
CL_ACC6 ACC6 VSS 100f
CL_ACC7 ACC7 VSS 100f
CL_ACC8 ACC8 VSS 100f
CL_ACC9 ACC9 VSS 100f
CL_ACC10 ACC10 VSS 100f
CL_ACC11 ACC11 VSS 100f
CL_ACC12 ACC12 VSS 100f
CL_ACC13 ACC13 VSS 100f
CL_ACC14 ACC14 VSS 100f
CL_ACC15 ACC15 VSS 100f
CL_MIN0 MIN0 VSS 100f
CL_MIN1 MIN1 VSS 100f
CL_MIN2 MIN2 VSS 100f
CL_MIN3 MIN3 VSS 100f
CL_MIN4 MIN4 VSS 100f
CL_MIN5 MIN5 VSS 100f
CL_MIN6 MIN6 VSS 100f
CL_MIN7 MIN7 VSS 100f
CL_MIN8 MIN8 VSS 100f
CL_MIN9 MIN9 VSS 100f
CL_MIN10 MIN10 VSS 100f
CL_MIN11 MIN11 VSS 100f
CL_MIN12 MIN12 VSS 100f
CL_MIN13 MIN13 VSS 100f
CL_MIN14 MIN14 VSS 100f
CL_MIN15 MIN15 VSS 100f
CL_MAX0 MAX0 VSS 100f
CL_MAX1 MAX1 VSS 100f
CL_MAX2 MAX2 VSS 100f
CL_MAX3 MAX3 VSS 100f
CL_MAX4 MAX4 VSS 100f
CL_MAX5 MAX5 VSS 100f
CL_MAX6 MAX6 VSS 100f
CL_MAX7 MAX7 VSS 100f
CL_MAX8 MAX8 VSS 100f
CL_MAX9 MAX9 VSS 100f
CL_MAX10 MAX10 VSS 100f
CL_MAX11 MAX11 VSS 100f
CL_MAX12 MAX12 VSS 100f
CL_MAX13 MAX13 VSS 100f
CL_MAX14 MAX14 VSS 100f
CL_MAX15 MAX15 VSS 100f

*****************************************************

***Voltage or Circuit Source Description*************

VVDD VDD 0  vd
VVSS VSS 0  0

Xpattern VDD CLK A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 CLEAR dbgo0 / pattern_generator_16b MODE=pattern_mode FREQCK=FREQCK

***			ANSWER CHECKER				*************
Xchecker VDD CLK A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 CLEAR MIN0 MIN1 MIN2 MIN3 MIN4 MIN5 MIN6 MIN7 MIN8 MIN9 MIN10 MIN11 MIN12 MIN13 MIN14 MIN15 MAX0 MAX1 MAX2 MAX3 MAX4 MAX5 MAX6 MAX7 MAX8 MAX9 MAX10 MAX11 MAX12 MAX13 MAX14 MAX15 ACC0 ACC1 ACC2 ACC3 ACC4 ACC5 ACC6 ACC7 ACC8 ACC9 ACC10 ACC11 ACC12 ACC13 ACC14 ACC15 ans_ACC ans_MIN ans_MAX ERR_ACC ERR_MIN ERR_MAX dbgo1 / checker FREQCK=FREQCK


************Simulation to Run************************
***	Mode	Simulation table
***	0		UP-counter pattern / Measure Power & error
***	1		PRBS pattern / Measure Power & error
***	2		specified pattern / Measure Power & error
*****************************************************
.probe v(*)

.if (simcase == 0)
*** Measure Mode 0 UP_counter case
	.trans sim_step tstop_meas_p
	.param pattern_mode=0
	.measure tran PVDD AVG PAR('(V(VDD)*-1*I(VVDD))') from=tstart_meas_p to=tstop_meas_p
	.measure tran ERROR_NUM_ACC FIND V(ERR_ACC) AT tstop_meas_p
	.measure tran ERROR_NUM_MIN FIND V(ERR_MIN) AT tstop_meas_p
	.measure tran ERROR_NUM_MAX FIND V(ERR_MAX) AT tstop_meas_p
.elseif (simcase == 1)
*** Measure Mode 1 PRBS case
	.trans sim_step tstop_meas_p
	.param pattern_mode=1
	.measure tran PVDD AVG PAR('(V(VDD)*-1*I(VVDD))') from=tstart_meas_p to=tstop_meas_p
	.measure tran ERROR_NUM_ACC FIND V(ERR_ACC) AT tstop_meas_p
	.measure tran ERROR_NUM_MIN FIND V(ERR_MIN) AT tstop_meas_p
	.measure tran ERROR_NUM_MAX FIND V(ERR_MAX) AT tstop_meas_p
.elseif (simcase == 2)
*** Measure Mode 2 given data case
	.trans sim_step tstop_meas_p
	.param pattern_mode=2
	.measure tran PVDD AVG PAR('(V(VDD)*-1*I(VVDD))') from=tstart_meas_p to=tstop_meas_p
	.measure tran ERROR_NUM_ACC FIND V(ERR_ACC) AT tstop_meas_p
	.measure tran ERROR_NUM_MIN FIND V(ERR_MIN) AT tstop_meas_p
	.measure tran ERROR_NUM_MAX FIND V(ERR_MAX) AT tstop_meas_p
.else
.endif

*****************************************************
***	   You can change your corner here!      	  ***
*.alter
*.param simcase=1
*.lib 'cic018.l' SS
*.temp 125
*.alter
*.param simcase=2
*****************************************************
.END
