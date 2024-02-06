.subckt ao_max r_clearB max_mux0 max_mux1 max_mux2 max_mux3 max_mux4 max_mux5 max_mux6 max_mux7 max_mux8 max_mux9 max_mux10 max_mux11 max_mux12 max_mux13 max_mux14 max_mux15
+ c_max0 c_max1 c_max2 c_max3 c_max4 c_max5 c_max6 c_max7 c_max8 c_max9 c_max10 c_max11 c_max12 c_max13 c_max14 c_max15 VDD VSS
Xnand0 max_mux0 r_clearB n0 VDD VSS nand2 m=1
Xinv0 n0 c_max0 VDD VSS inv m=1
Xnand1 max_mux1 r_clearB n1 VDD VSS nand2 m=1
Xinv1 n1 c_max1 VDD VSS inv m=1
Xnand2 max_mux2 r_clearB n2 VDD VSS nand2 m=1
xinv2 n2 c_max2 VDD VSS inv m=1
Xnand3 max_mux3 r_clearB n3 VDD VSS nand2 m=1
Xinv3 n3 c_max3 VDD VSS inv m=1
Xnand4 max_mux4 r_clearB n4 VDD VSS nand2 m=1
Xinv4 n4 c_max4 VDD VSS inv m=1
Xnand5 max_mux5 r_clearB n5 VDD VSS nand2 m=1
Xinv5 n5 c_max5 VDD VSS inv m=1
Xnand6 max_mux6 r_clearB n6 VDD VSS nand2 m=1
Xinv6 n6 c_max6 VDD VSS inv m=1
Xnand7 max_mux7 r_clearB n7 VDD VSS nand2 m=1
Xinv7 n7 c_max7 VDD VSS inv m=1
Xnand8 max_mux8 r_clearB n8 VDD VSS nand2 m=1
Xinv8 n8 c_max8 VDD VSS inv m=1
Xnand9 max_mux9 r_clearB n9 VDD VSS nand2 m=1
Xinv9 n9 c_max9 VDD VSS inv m=1
Xnand10 max_mux10 r_clearB n10 VDD VSS nand2 m=1
Xinv10 n10 c_max10 VDD VSS inv m=1
Xnand11 max_mux11 r_clearB n11 VDD VSS nand2 m=1
Xinv11 n11 c_max11 VDD VSS inv m=1
Xnand12 max_mux12 r_clearB n12 VDD VSS nand2 m=1
Xinv12 n12 c_max12 VDD VSS inv m=1
Xnand13 max_mux13 r_clearB n13 VDD VSS nand2 m=1
Xinv13 n13 c_max13 VDD VSS inv m=1
Xnand14 max_mux14 r_clearB n14 VDD VSS nand2 m=1
Xinv14 n14 c_max14 VDD VSS inv m=1
Xinv15 max_mux15 n15 VDD VSS inv m=1
Xnand15 n15 r_clearB c_max15 VDD VSS nand2 m=1
.ends