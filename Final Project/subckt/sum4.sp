.subckt sum4 P0 P1 P2 P3 G0 G1 G2 G3 Cin S0 S1 S2 S3 VDD VSS
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
* S3
Xnand5 P2 C1 tmp2 VDD VSS nand2 m=1
Xinv2 G2 G2B VDD VSS inv m=1
Xnand6 G2B tmp2 C2 VDD VSS nand2 m=1
Xxor3 P3 C2 S3 VDD VSS xor2 m=1
.ends