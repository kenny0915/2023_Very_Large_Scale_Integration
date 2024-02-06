.subckt pg A B G P VDD VSS
Xnand A B out VDD VSS nand2 m=1
Xxor A B P VDD VSS xor2 m=1
Xinv out G VDD VSS inv m=1
.ends