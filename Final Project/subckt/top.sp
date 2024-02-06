.subckt TOP VDD VSS clear clk in0 in1 in2 in3 in4 in5 in6 in7 in8 in9 in10 in11 in12 in13 in14 in15
+ acc0 acc1 acc2 acc3 acc4 acc5 acc6 acc7 acc8 acc9 acc10 acc11 acc12 acc13 acc14 acc15
+ max0 max1 max2 max3 max4 max5 max6 max7 max8 max9 max10 max11 max12 max13 max14 max15
+ min0 min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15
Xinvclk1 clk clkB VDD VSS inv m=1
Xinvclk2 clkB clk1 VDD VSS inv m=3
Xinvclk3 clk1 clk2 VDD VSS inv m=9
Xinvclk4 clk2 clkS VDD VSS inv m=18

Xinv_clear1 clear clearB VDD VSS inv m=1
Xinv_clear2 clearB clearS VDD VSS inv m=1
Xff_clear clkS clearS r_clear r_clearB VDD VSS ff m=1

Xinv_in1 in0 in1 in2 in3 in4 in5 in6 in7 in8 in9 in10 in11 in12 in13 in14 in15
+ inb0 inb1 inb2 inb3 inb4 inb5 inb6 inb7 inb8 inb9 inb10 inb11 inb12 inb13 inb14 inb15 VDD VSS inv_arr m=1
Xinv_in2 inb0 inb1 inb2 inb3 inb4 inb5 inb6 inb7 inb8 inb9 inb10 inb11 inb12 inb13 inb14 inb15
+ ins0 ins1 ins2 ins3 ins4 ins5 ins6 ins7 ins8 ins9 ins10 ins11 ins12 ins13 ins14 ins15 VDD VSS inv_arr m=1
Xff_arr_in clkS ins0 ins1 ins2 ins3 ins4 ins5 ins6 ins7 ins8 ins9 ins10 ins11 ins12 ins13 ins14 ins15
+ r_in0 r_in1 r_in2 r_in3 r_in4 r_in5 r_in6 r_in7 r_in8 r_in9 r_in10 r_in11 r_in12 r_in13 r_in14 r_in15
+ r_inb0 r_inb1 r_inb2 r_inb3 r_inb4 r_inb5 r_inb6 r_inb7 r_inb8 r_inb9 r_inb10 r_inb11 r_inb12 r_inb13 r_inb14 r_inb15 VDD VSS ff_arr m=1

Xadder_acc r_in0 r_in1 r_in2 r_in3 r_in4 r_in5 r_in6 r_in7 r_in8 r_in9 r_in10 r_in11 r_in12 r_in13 r_in14 r_in15
+ acc0 acc1 acc2 acc3 acc4 acc5 acc6 acc7 acc8 acc9 acc10 acc11 acc12 acc13 acc14 acc15 VSS
+ r_acc0 r_acc1 r_acc2 r_acc3 r_acc4 r_acc5 r_acc6 r_acc7 r_acc8 r_acc9 r_acc10 r_acc11 r_acc12 r_acc13 r_acc14 r_acc15 VDD VSS adder m=1
Xadder_min r_inb0 r_inb1 r_inb2 r_inb3 r_inb4 r_inb5 r_inb6 r_inb7 r_inb8 r_inb9 r_inb10 r_inb11 r_inb12 r_inb13 r_inb14 r_inb15
+ min0 min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15 VDD
+ r_min0 r_min1 r_min2 r_min3 r_min4 r_min5 r_min6 r_min7 r_min8 r_min9 r_min10 r_min11 r_min12 r_min13 r_min14 r_min15 VDD VSS adder m=1
Xadder_max r_inb0 r_inb1 r_inb2 r_inb3 r_inb4 r_inb5 r_inb6 r_inb7 r_inb8 r_inb9 r_inb10 r_inb11 r_inb12 r_inb13 r_inb14 r_inb15
+ max0 max1 max2 max3 max4 max5 max6 max7 max8 max9 max10 max11 max12 max13 max14 max15 VDD
+ r_max0 r_max1 r_max2 r_max3 r_max4 r_max5 r_max6 r_max7 r_max8 r_max9 r_max10 r_max11 r_max12 r_max13 r_max14 r_max15 VDD VSS adder m=1

Xinvmin1 r_min15 r_tmp1 VDD VSS inv m=4
Xinvmin2 r_tmp1 n_min15 VDD VSS inv m=10
Xinvmax1 r_max15 r_tmp2 VDD VSS inv m=4
Xinvmax2 r_tmp2 n_max15 VDD VSS inv m=10

Xmin_mux r_in0 r_in1 r_in2 r_in3 r_in4 r_in5 r_in6 r_in7 r_in8 r_in9 r_in10 r_in11 r_in12 r_in13 r_in14 r_in15
+ min0 min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15 
+ n_min15 min_mux0 min_mux1 min_mux2 min_mux3 min_mux4 min_mux5 min_mux6 min_mux7 min_mux8 min_mux9 min_mux10 min_mux11 min_mux12 min_mux13 min_mux14 min_mux15 VDD VSS mux_arr m=1
Xmax_mux max0 max1 max2 max3 max4 max5 max6 max7 max8 max9 max10 max11 max12 max13 max14 max15
+ r_in0 r_in1 r_in2 r_in3 r_in4 r_in5 r_in6 r_in7 r_in8 r_in9 r_in10 r_in11 r_in12 r_in13 r_in14 r_in15
+ n_max15 max_mux0 max_mux1 max_mux2 max_mux3 max_mux4 max_mux5 max_mux6 max_mux7 max_mux8 max_mux9 max_mux10 max_mux11 max_mux12 max_mux13 max_mux14 max_mux15 VDD VSS mux_arr m=1

* and or for acc min max
Xand_acc r_clearB r_acc0 r_acc1 r_acc2 r_acc3 r_acc4 r_acc5 r_acc6 r_acc7 r_acc8 r_acc9 r_acc10 r_acc11 r_acc12 r_acc13 r_acc14 r_acc15
+ c_acc0 c_acc1 c_acc2 c_acc3 c_acc4 c_acc5 c_acc6 c_acc7 c_acc8 c_acc9 c_acc10 c_acc11 c_acc12 c_acc13 c_acc14 c_acc15 VDD VSS and_acc m=1
Xao_min r_clearB min_mux0 min_mux1 min_mux2 min_mux3 min_mux4 min_mux5 min_mux6 min_mux7 min_mux8 min_mux9 min_mux10 min_mux11 min_mux12 min_mux13 min_mux14 min_mux15
+ c_min0 c_min1 c_min2 c_min3 c_min4 c_min5 c_min6 c_min7 c_min8 c_min9 c_min10 c_min11 c_min12 c_min13 c_min14 c_min15 VDD VSS ao_min m=1
Xao_max r_clearB max_mux0 max_mux1 max_mux2 max_mux3 max_mux4 max_mux5 max_mux6 max_mux7 max_mux8 max_mux9 max_mux10 max_mux11 max_mux12 max_mux13 max_mux14 max_mux15
+ c_max0 c_max1 c_max2 c_max3 c_max4 c_max5 c_max6 c_max7 c_max8 c_max9 c_max10 c_max11 c_max12 c_max13 c_max14 c_max15 VDD VSS ao_max m=1

Xff_arr_c_acc clkS c_acc0 c_acc1 c_acc2 c_acc3 c_acc4 c_acc5 c_acc6 c_acc7 c_acc8 c_acc9 c_acc10 c_acc11 c_acc12 c_acc13 c_acc14 c_acc15
+ acc0 acc1 acc2 acc3 acc4 acc5 acc6 acc7 acc8 acc9 acc10 acc11 acc12 acc13 acc14 acc15
+ accb0 accb1 accb2 accb3 accb4 accb5 accb6 accb7 accb8 accb9 accb10 accb11 accb12 accb13 accb14 accb15 VDD VSS ff_arr m=1
Xff_arr_c_min clkS c_min0 c_min1 c_min2 c_min3 c_min4 c_min5 c_min6 c_min7 c_min8 c_min9 c_min10 c_min11 c_min12 c_min13 c_min14 c_min15
+ min0 min1 min2 min3 min4 min5 min6 min7 min8 min9 min10 min11 min12 min13 min14 min15
+ minb0 minb1 minb2 minb3 minb4 minb5 minb6 minb7 minb8 minb9 minb10 minb11 minb12 minb13 minb14 minb15 VDD VSS ff_arr m=1
Xff_arr_c_max clkS c_max0 c_max1 c_max2 c_max3 c_max4 c_max5 c_max6 c_max7 c_max8 c_max9 c_max10 c_max11 c_max12 c_max13 c_max14 c_max15
+ max0 max1 max2 max3 max4 max5 max6 max7 max8 max9 max10 max11 max12 max13 max14 max15
+ maxb0 maxb1 maxb2 maxb3 maxb4 maxb5 maxb6 maxb7 maxb8 maxb9 maxb10 maxb11 maxb12 maxb13 maxb14 maxb15 VDD VSS ff_arr m=1
.ends