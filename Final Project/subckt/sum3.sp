.subckt sum3 P0 P1 P2 G0 G1 G2 Cin S0 S1 S2 VDD VSS
* S0
Xxor0 P0 Cin S0 VDD VSS xor2 m=1
* S1
Xnand1 P0 Cin tmp0 VDD VSS nand2 m=1
Xinv0 G0 G0B VDD VSS inv m=1
Xnand2 G0B tmp0 C0 VDD VSS nand2 m=1
Xxor1 P1 C0 S1 VDD VSS xor2 m=1
* S2
Xnand3 P1 C0 tmp1 VDD VSS nand2 m=1
Xinv1 G1 G1B VDD VSS inv m=1
Xnand4 G1B tmp1 C1 VDD VSS nand2 m=1
Xxor2 P2 C1 S2 VDD VSS xor2 m=1
.ends