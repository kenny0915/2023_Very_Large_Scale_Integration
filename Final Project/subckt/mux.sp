.subckt mux D0 D1 S out VDD VSS
Xinv S SB VDD VSS inv m=1
Xnand0 D0 SB out0 VDD VSS nand2 m=1 
Xnand1 D1 S out1 VDD VSS nand2 m=1
Xnand2 out0 out1 out VDD VSS nand2 m=1
.ends