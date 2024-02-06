.subckt sum2 P0 P1 G0 G1 Cin S0 S1 VDD VSS
* S0
Xxor0 P0 Cin S0 VDD VSS xor2 m=1
* S1
Xnand1 P0 Cin tmp0 VDD VSS nand2 m=1
Xinv0 G0 G0B VDD VSS inv m=1
Xnand2 G0B tmp0 C0 VDD VSS nand2 m=1
Xxor1 P1 C0 S1 VDD VSS xor2 m=1
.ends