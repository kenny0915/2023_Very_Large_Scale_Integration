.subckt ff CK in out outB VDD VSS
Xinv1 CK CKB VDD VSS inv m=1
* master
MPlatch1 in CK n1 VDD p_18 w=wp l=len m=1
MNlatch1 in CKB n1 VSS n_18 w=wn l=len m=1
Xinv2 n1 n2 VDD VSS inv m=2
Xinv3 n2 n3 VDD VSS inv m=2
MPlatch2 n3 CKB n1 VDD p_18 w=wp l=len m=1
MNlatch2 n3 CK n1 VSS n_18 w=wn l=len m=1
* slave
MPlatch3 n2 CKB n4 VDD p_18 w=wp l=len m=1
MNlatch3 n2 CK n4 VSS n_18 w=wn l=len m=1
Xinv4 n4 out VDD VSS inv m=2
Xinv5 out outB VDD VSS inv m=2 
MPlatch4 outB CK n4 VDD p_18 w=wp l=len m=1
MNlatch4 outB CKB n4 VSS n_18 w=wn l=len m=1
.ends