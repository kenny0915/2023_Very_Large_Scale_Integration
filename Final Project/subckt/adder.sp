.subckt adder a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15
+ b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 Cin
+ s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 VDD VSS
* pg generation
Xpg0 a0 b0 g0 p0 VDD VSS pg m=1
Xpg1 a1 b1 g1 p1 VDD VSS pg m=1
Xpg2 a2 b2 g2 p2 VDD VSS pg m=1
Xpg3 a3 b3 g3 p3 VDD VSS pg m=1
Xpg4 a4 b4 g4 p4 VDD VSS pg m=1
Xpg5 a5 b5 g5 p5 VDD VSS pg m=1
Xpg6 a6 b6 g6 p6 VDD VSS pg m=1
Xpg7 a7 b7 g7 p7 VDD VSS pg m=1
Xpg8 a8 b8 g8 p8 VDD VSS pg m=1
Xpg9 a9 b9 g9 p9 VDD VSS pg m=1
Xpg10 a10 b10 g10 p10 VDD VSS pg m=1
Xpg11 a11 b11 g11 p11 VDD VSS pg m=1
Xpg12 a12 b12 g12 p12 VDD VSS pg m=1
Xpg13 a13 b13 g13 p13 VDD VSS pg m=1
Xpg14 a14 b14 g14 p14 VDD VSS pg m=1
Xpg15 a15 b15 g15 p15 VDD VSS pg m=1
* valency 2 3 4 4 3
Xv1 p0 p1 g0 g1 Cin C1 VDD VSS valency2 m=1
Xv2 p2 p3 p4 g2 g3 g4 C1 C4 VDD VSS valency3 m=1
Xv3 p5 p6 p7 p8 g5 g6 g7 g8 C4 C8 VDD VSS valency4 m=1
Xv4 p9 p10 p11 p12 g9 g10 g11 g12 C8 C12 VDD VSS valency4 m=1
Xv5 p13 p14 p15 g13 g14 g15 C12 Cout VDD VSS valency3 m=1
* sum
Xs1 p0 p1 g0 g1 Cin s0 s1 VDD VSS sum2 m=1
Xs2 p2 p3 p4 g2 g3 g4 C1 s2 s3 s4 VDD VSS sum3 m=1
Xs3 p5 p6 p7 p8 g5 g6 g7 g8 C4 s5 s6 s7 s8 VDD VSS sum4 m=1
Xs4 p9 p10 p11 p12 g9 g10 g11 g12 C8 s9 s10 s11 s12 VDD VSS sum4 m=1
Xs5 p13 p14 p15 g13 g14 g15 C12 s13 s14 s15 VDD VSS sum3 m=1
.ends