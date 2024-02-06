.subckt valency2 P0 P1 G0 G1 Cin Cout VDD VSS
Xinv1 G1 G1B VDD VSS inv m=1
XinvP P PB VDD VSS inv m=1
XinvG G GB VDD VSS inv m=1
Xnand P1 P0 P VDD VSS nand2 m=1
Xnand1 P1 G0 tmp1 VDD VSS nand2 m=1
Xnand2 G1B tmp1 G VDD VSS nand2 m=1
XnandPC PB Cin PC VDD VSS nand2 m=1
Xnandout GB PC Cout VDD VSS nand2 m=1
.ends