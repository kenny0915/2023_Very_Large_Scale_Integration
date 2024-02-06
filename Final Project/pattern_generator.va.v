//***********EE3230 VLSI Final Project testbench***************
//***Copyright 2023 PHLAB. All right reserved.
//*************************************************************
`include "constants.vams"
`include "disciplines.vams"

// generate source and data pattern for Final Project
module pattern_generator_16b(VDD, CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR, dbgo0);

input VDD;
output CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR, dbgo0;

electrical VDD, CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR, dbgo0;

parameter real FREQCK=10G;
parameter real trf=10p;
parameter real td_clk=0.5/FREQCK;
parameter real td_data=2/FREQCK;
parameter real t_clr=100/FREQCK;
parameter real t_clr_start=1/FREQCK;
parameter real vth=0.9;
parameter real MODE=1;

real d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;
real x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;
real x0_temp, x1_temp, x2_temp, x3_temp, x4_temp, x5_temp, x6_temp, x7_temp, x8_temp, x9_temp, x10_temp, x11_temp, x12_temp, x13_temp, x14_temp, x15_temp;
real clr;
integer data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10;

//------ pattern generator ------//
// MODE 0: up-counter
// MODE 1: PRBS-15
// MODE 2(other): given 10-data via ADC
//-------------------------------//

analog begin
	@(initial_step) begin

// ------change 10 data value here!------//
		data0 = 0;
		data1 = 15;
		data2 = 32;
		data3 = 514;
		data4 = -2048;
		data5 = 1111;
		data6 = 1112;
		data7 = -1;
		data8 = -1;
		data9 = -1;
		data10 = -1;
// --------------------------------------//
		x0 = 1;
		x1 = 0;
		x2 = 0;
		x3 = 0;
		x4 = 0;
		x5 = 0;
		x6 = 0;
		x7 = 0;
		x8 = 0;
		x9 = 0;
		x10 = 0;
		x11 = 0;
		x12 = 0;
		x13 = 0;
		x14 = 0;
		x15 = 0;
	end

		x14_temp = x13;
		x13_temp = x12;
		x12_temp = x11;
		x11_temp = x10;
		x10_temp = x9;
		x9_temp = x8;
		x8_temp = x7;
		x7_temp = x6;
		x6_temp = x5;
		x5_temp = x4;
		x4_temp = x3;
		x3_temp = x2;
		x2_temp = x1;
		x1_temp = x0;
		x0_temp = x13 ^ x14;

	@(cross(V(CLK) - vth, -1)) begin
		// PRBS register
		x14 = x14_temp;
		x13 = x13_temp;
		x12 = x12_temp;
		x11 = x11_temp;
		x10 = x10_temp;
		x9 = x9_temp;
		x8 = x8_temp;
		x7 = x7_temp;
		x6 = x6_temp;
		x5 = x5_temp;
		x4 = x4_temp;
		x3 = x3_temp;
		x2 = x2_temp;
		x1 = x1_temp;
		x0 = x0_temp;
		// data shift regester
		data0 = data1;
		data1 = data2;
		data2 = data3;
		data3 = data4;
		data4 = data5;
		data5 = data6;
		data6 = data7;
		data7 = data8;
		data8 = data9;
		data9 = data10;
		data10 = 0;
	end


	if (MODE == 0) begin
		d0 = (sin(2*`M_PI*FREQCK*$abstime/2.0) < 0) ? 1 : 0;
		d1 = (sin(2*`M_PI*FREQCK*$abstime/4.0) < 0) ? 1 : 0;
		d2 = (sin(2*`M_PI*FREQCK*$abstime/8.0) < 0) ? 1 : 0;
		d3 = (sin(2*`M_PI*FREQCK*$abstime/16.0) < 0) ? 1 : 0;
		d4 = (sin(2*`M_PI*FREQCK*$abstime/32.0) < 0) ? 1 : 0;
		d5 = (sin(2*`M_PI*FREQCK*$abstime/64.0) < 0) ? 1 : 0;
		d6 = (sin(2*`M_PI*FREQCK*$abstime/128.0) < 0) ? 1 : 0;
		d7 = (sin(2*`M_PI*FREQCK*$abstime/256.0) < 0) ? 1 : 0;
		d8 = (sin(2*`M_PI*FREQCK*$abstime/512.0) < 0) ? 1 : 0;
		d9 = (sin(2*`M_PI*FREQCK*$abstime/1024.0) < 0) ? 1 : 0;
		d10 = (sin(2*`M_PI*FREQCK*$abstime/2048.0) < 0) ? 1 : 0;
		d11 = (sin(2*`M_PI*FREQCK*$abstime/4096.0) < 0) ? 1 : 0;
		d12 = (sin(2*`M_PI*FREQCK*$abstime/8192.0) < 0) ? 1 : 0;
		d13 = (sin(2*`M_PI*FREQCK*$abstime/16384.0) < 0) ? 1 : 0;
		d14 = (sin(2*`M_PI*FREQCK*$abstime/32768.0) < 0) ? 1 : 0;
		d15 = (sin(2*`M_PI*FREQCK*$abstime/65536.0) < 0) ? 1 : 0;
	end else if (MODE == 1)begin
		d0 = x0;
		d1 = x1;
		d2 = x2;
		d3 = x3;
		d4 = x4;
		d5 = x5;
		d6 = x6;
		d7 = x7;
		d8 = x8;
		d9 = x9;
		d10 = x10;
		d11 = x11;
		d12 = x12;
		d13 = x13;
		d14 = x14;
		d15 = x15;
	end else begin 
		d0 = data0 >= 0 ? (data0 % 2 < 1 ?0:1) : (-1*(data0+1) % 2 < 1 ? 1 : 0);
		d1 = data0 >= 0 ? (data0 % 4 < 2 ?0:1) : (-1*(data0+1) % 4 < 2 ? 1 : 0);
		d2 = data0 >= 0 ? (data0 % 8 < 4 ?0:1) : (-1*(data0+1) % 8 < 4 ? 1 : 0);
		d3 = data0 >= 0 ? (data0 % 16 < 8 ?0:1) : (-1*(data0+1) % 16 < 8 ? 1 : 0);
		d4 = data0 >= 0 ? (data0 % 32 < 16 ?0:1) : (-1*(data0+1) % 32 < 16 ? 1 : 0);
		d5 = data0 >= 0 ? (data0 % 64 < 32 ?0:1) : (-1*(data0+1) % 64 < 32 ? 1 : 0);
		d6 = data0 >= 0 ? (data0 % 128 < 64 ?0:1) : (-1*(data0+1) % 128 < 64 ? 1 : 0);
		d7 = data0 >= 0 ? (data0 % 256 < 128 ?0:1) : (-1*(data0+1) % 256 < 128 ? 1 : 0);
		d8 = data0 >= 0 ? (data0 % 512 < 256 ?0:1) : (-1*(data0+1) % 512 < 256 ? 1 : 0);
		d9 = data0 >= 0 ? (data0 % 1024 < 512 ?0:1) : (-1*(data0+1) % 1024 < 512 ? 1 : 0);
		d10 = data0 >= 0 ? (data0 % 2048 < 1024 ?0:1) : (-1*(data0+1) % 2048 < 1024 ? 1 : 0);
		d11 = data0 >= 0 ? (data0 % 4096 < 2048 ?0:1) : (-1*(data0+1) % 4096 < 2048 ? 1 : 0);
		d12 = data0 >= 0 ? (data0 % 8192 < 4096 ?0:1) : (-1*(data0+1) % 8192 < 4096 ? 1 : 0);
		d13 = data0 >= 0 ? (data0 % 16384 < 8192 ?0:1) : (-1*(data0+1) % 16384 < 8192 ? 1 : 0);
		d14 = data0 >= 0 ? (data0 % 32768 < 16384 ?0:1) : (-1*(data0+1) % 32768 < 16384 ? 1 : 0);
		d15 = data0 >= 0 ? 0 : 1;
	end

	// CLEAR signal generator
	if ($abstime > t_clr && $abstime < t_clr+1/FREQCK || $abstime < t_clr_start) begin
		clr = 1;
	end else begin
		clr = 0;
	end

	V(a0) <+ transition(d0*V(VDD), td_data, trf, trf);
	V(a1) <+ transition(d1*V(VDD), td_data, trf, trf);
	V(a2) <+ transition(d2*V(VDD), td_data, trf, trf);
	V(a3) <+ transition(d3*V(VDD), td_data, trf, trf);
	V(a4) <+ transition(d4*V(VDD), td_data, trf, trf);
	V(a5) <+ transition(d5*V(VDD), td_data, trf, trf);
	V(a6) <+ transition(d6*V(VDD), td_data, trf, trf);
	V(a7) <+ transition(d7*V(VDD), td_data, trf, trf);
	V(a8) <+ transition(d8*V(VDD), td_data, trf, trf);
	V(a9) <+ transition(d9*V(VDD), td_data, trf, trf);
	V(a10) <+ transition(d10*V(VDD), td_data, trf, trf);
	V(a11) <+ transition(d11*V(VDD), td_data, trf, trf);
	V(a12) <+ transition(d12*V(VDD), td_data, trf, trf);
	V(a13) <+ transition(d13*V(VDD), td_data, trf, trf);
	V(a14) <+ transition(d14*V(VDD), td_data, trf, trf);
	V(a15) <+ transition(d15*V(VDD), td_data, trf, trf);
	V(CLK) <+ transition((sin(2*`M_PI*FREQCK*$abstime) > 0) ? V(VDD) : 0, td_clk, trf, trf);
	V(CLEAR) <+ transition(clr*V(VDD), 0, trf, trf);
	V(dbgo0) <+ sin(2*`M_PI*FREQCK*$abstime);
end 
endmodule
