.subckt nand2 A B out VDD VSS
MPa out A VDD VDD p_18 w=wp l=len
MPb out B VDD VDD p_18 w=wp l=len
MNa out A tmp VSS n_18 w=2*wn l=len
Mnb tmp B VSS VSS n_18 w=2*wn l=len
.ends