.subckt nand4 A B C D out VDD VSS
Mpa out A VDD VDD p_18 w=wp l=len m=1
Mpb out B VDD VDD p_18 w=wp l=len m=1
Mpc out C VDD VDD p_18 w=wp l=len m=1
Mpd out D VDD VDD p_18 w=wp l=len m=1
Mna out A n1 VSS n_18 w=wn l=len m=1
Mnb n1 B n2 VSS n_18 w=wn l=len m=1
Mnc n2 C n3 VSS n_18 w=wn l=len m=1
Mnd n3 D VSS VSS n_18 w=wn l=len m=1
.ends