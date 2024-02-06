.subckt and_acc r_clearB r_acc0 r_acc1 r_acc2 r_acc3 r_acc4 r_acc5 r_acc6 r_acc7 r_acc8 r_acc9 r_acc10 r_acc11 r_acc12 r_acc13 r_acc14 r_acc15
+ c_acc0 c_acc1 c_acc2 c_acc3 c_acc4 c_acc5 c_acc6 c_acc7 c_acc8 c_acc9 c_acc10 c_acc11 c_acc12 c_acc13 c_acc14 c_acc15 VDD VSS
Xnand0 r_acc0 r_clearB n0 VDD VSS nand2 m=1
Xinv0 n0 c_acc0 VDD VSS inv m=1
Xnand1 r_acc1 r_clearB n1 VDD VSS nand2 m=1
Xinv1 n1 c_acc1 VDD VSS inv m=1
Xnand2 r_acc2 r_clearB n2 VDD VSS nand2 m=1
xinv2 n2 c_acc2 VDD VSS inv m=1
Xnand3 r_acc3 r_clearB n3 VDD VSS nand2 m=1
Xinv3 n3 c_acc3 VDD VSS inv m=1
Xnand4 r_acc4 r_clearB n4 VDD VSS nand2 m=1
Xinv4 n4 c_acc4 VDD VSS inv m=1
Xnand5 r_acc5 r_clearB n5 VDD VSS nand2 m=1
Xinv5 n5 c_acc5 VDD VSS inv m=1
Xnand6 r_acc6 r_clearB n6 VDD VSS nand2 m=1
Xinv6 n6 c_acc6 VDD VSS inv m=1
Xnand7 r_acc7 r_clearB n7 VDD VSS nand2 m=1
Xinv7 n7 c_acc7 VDD VSS inv m=1
Xnand8 r_acc8 r_clearB n8 VDD VSS nand2 m=1
Xinv8 n8 c_acc8 VDD VSS inv m=1
Xnand9 r_acc9 r_clearB n9 VDD VSS nand2 m=1
Xinv9 n9 c_acc9 VDD VSS inv m=1
Xnand10 r_acc10 r_clearB n10 VDD VSS nand2 m=1
Xinv10 n10 c_acc10 VDD VSS inv m=1
Xnand11 r_acc11 r_clearB n11 VDD VSS nand2 m=1
Xinv11 n11 c_acc11 VDD VSS inv m=1
Xnand12 r_acc12 r_clearB n12 VDD VSS nand2 m=1
Xinv12 n12 c_acc12 VDD VSS inv m=1
Xnand13 r_acc13 r_clearB n13 VDD VSS nand2 m=1
Xinv13 n13 c_acc13 VDD VSS inv m=1
Xnand14 r_acc14 r_clearB n14 VDD VSS nand2 m=1
Xinv14 n14 c_acc14 VDD VSS inv m=1
Xnand15 r_acc15 r_clearB n15 VDD VSS nand2 m=1
Xinv15 n15 c_acc15 VDD VSS inv m=1
.ends