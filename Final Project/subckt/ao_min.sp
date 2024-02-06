.subckt ao_min r_clearB min_mux0 min_mux1 min_mux2 min_mux3 min_mux4 min_mux5 min_mux6 min_mux7 min_mux8 min_mux9 min_mux10 min_mux11 min_mux12 min_mux13 min_mux14 min_mux15
+ c_min0 c_min1 c_min2 c_min3 c_min4 c_min5 c_min6 c_min7 c_min8 c_min9 c_min10 c_min11 c_min12 c_min13 c_min14 c_min15 VDD VSS
Xinv0 min_mux0 n0 VDD VSS inv m=1
Xnand0 n0 r_clearB c_min0 VDD VSS nand2 m=1
Xinv1 min_mux1 n1 VDD VSS inv m=1
Xnand1 n1 r_clearB c_min1 VDD VSS nand2 m=1
Xinv2 min_mux2 n2 VDD VSS inv m=1
Xnand2 n2 r_clearB c_min2 VDD VSS nand2 m=1
Xinv3 min_mux3 n3 VDD VSS inv m=1
Xnand3 n3 r_clearB c_min3 VDD VSS nand2 m=1
Xinv4 min_mux4 n4 VDD VSS inv m=1
Xnand4 n4 r_clearB c_min4 VDD VSS nand2 m=1
Xinv5 min_mux5 n5 VDD VSS inv m=1
Xnand5 n5 r_clearB c_min5 VDD VSS nand2 m=1
Xinv6 min_mux6 n6 VDD VSS inv m=1
Xnand6 n6 r_clearB c_min6 VDD VSS nand2 m=1
Xinv7 min_mux7 n7 VDD VSS inv m=1
Xnand7 n7 r_clearB c_min7 VDD VSS nand2 m=1
Xinv8 min_mux8 n8 VDD VSS inv m=1
Xnand8 n8 r_clearB c_min8 VDD VSS nand2 m=1
Xinv9 min_mux9 n9 VDD VSS inv m=1
Xnand9 n9 r_clearB c_min9 VDD VSS nand2 m=1
Xinv10 min_mux10 n10 VDD VSS inv m=1
Xnand10 n10 r_clearB c_min10 VDD VSS nand2 m=1
Xinv11 min_mux11 n11 VDD VSS inv m=1
Xnand11 n11 r_clearB c_min11 VDD VSS nand2 m=1
Xinv12 min_mux12 n12 VDD VSS inv m=1
Xnand12 n12 r_clearB c_min12 VDD VSS nand2 m=1
Xinv13 min_mux13 n13 VDD VSS inv m=1
Xnand13 n13 r_clearB c_min13 VDD VSS nand2 m=1
Xinv14 min_mux14 n14 VDD VSS inv m=1
Xnand14 n14 r_clearB c_min14 VDD VSS nand2 m=1
Xnand15 min_mux15 r_clearB n15 VDD VSS nand2 m=1
Xinv15 n15 c_min15 VDD VSS inv m=1
.ends