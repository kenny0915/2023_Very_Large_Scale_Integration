.subckt valency4 P0 P1 P2 P3 G0 G1 G2 G3 Cin Cout VDD VSS
Xinv1 G1 G1B VDD VSS inv m=1
Xinv2 G2 G2B VDD VSS inv m=1
Xinv3 G3 G3B VDD VSS inv m=1
XinvP P PB VDD VSS inv m=1
XinvG G GB VDD VSS inv m=1
Xnand P3 P2 P1 P0 P VDD VSS nand4 m=1
Xnand1 P1 G0 tmp1 VDD VSS nand2 m=1
Xnand2 G1B tmp1 n1 VDD VSS nand2 m=1
Xnand3 P2 n1 tmp2 VDD VSS nand2 m=1
Xnand4 G2B tmp2 n2 VDD VSS nand2 m=1
Xnand5 P3 n2 tmp3 VDD VSS nand2 m=1
Xnand6 G3B tmp3 G VDD VSS nand2 m=1
XnandPC PB Cin PC VDD VSS nand2 m=1
Xnandout GB PC Cout VDD VSS nand2 m=1
.ends