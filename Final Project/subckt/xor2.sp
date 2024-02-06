.subckt xor2 A B out VDD VSS
XinvA A AB VDD VSS inv m=1
XinvB B BB VDD VSS inv m=1
Mp1 n1 A VDD VDD p_18 w=2*wp l=len m=1
Mp2 out BB n1 VDD p_18 w=2*wp l=len m=1
Mp3 n2 AB VDD VDD p_18 w=2*wp l=len m=1
Mp4 out B n2 VDD p_18 w=2*wp l=len m=1
Mn1 out A n3 VSS n_18 w=2*wn l=len m=1
Mn2 n3 B VSS VSS n_18 w=2*wn l=len m=1
Mn3 out AB n4 VSS n_18 w=2*wn l=len m=1
Mn4 n4 BB VSS VSS n_18 w=2*wn l=len m=1
.ends