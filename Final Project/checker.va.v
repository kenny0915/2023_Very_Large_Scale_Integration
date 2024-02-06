//***********EE3230 VLSI Final Project testbench***************
//***Copyright 2023 PHLAB. All right reserved.
//*************************************************************
`include "constants.vams"
`include "disciplines.vams"

// answer checker for final project
module checker(VDD, CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR, MIN0, MIN1, MIN2, MIN3, MIN4, MIN5, MIN6, MIN7, MIN8, MIN9, MIN10, MIN11, MIN12, MIN13, MIN14, MIN15, MAX0, MAX1, MAX2, MAX3, MAX4, MAX5, MAX6, MAX7, MAX8, MAX9, MAX10, MAX11, MAX12, MAX13, MAX14, MAX15, ACC0, ACC1, ACC2, ACC3, ACC4, ACC5, ACC6, ACC7, ACC8, ACC9, ACC10, ACC11, ACC12, ACC13, ACC14, ACC15, ans_ACC, ans_MIN, ans_MAX, ERR_ACC, ERR_MIN, ERR_MAX, dbgo0);

input VDD, CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR;
input MIN0, MIN1, MIN2, MIN3, MIN4, MIN5, MIN6, MIN7, MIN8, MIN9, MIN10, MIN11, MIN12, MIN13, MIN14, MIN15, MAX0, MAX1, MAX2, MAX3, MAX4, MAX5, MAX6, MAX7, MAX8, MAX9, MAX10, MAX11, MAX12, MAX13, MAX14, MAX15, ACC0, ACC1, ACC2, ACC3, ACC4, ACC5, ACC6, ACC7, ACC8, ACC9, ACC10, ACC11, ACC12, ACC13, ACC14, ACC15;
output ans_ACC, ans_MIN, ans_MAX, ERR_ACC, ERR_MIN, ERR_MAX, dbgo0;

electrical VDD, CLK, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, CLEAR, dbgo0;
electrical MIN0, MIN1, MIN2, MIN3, MIN4, MIN5, MIN6, MIN7, MIN8, MIN9, MIN10, MIN11, MIN12, MIN13, MIN14, MIN15, MAX0, MAX1, MAX2, MAX3, MAX4, MAX5, MAX6, MAX7, MAX8, MAX9, MAX10, MAX11, MAX12, MAX13, MAX14, MAX15, ACC0, ACC1, ACC2, ACC3, ACC4, ACC5, ACC6, ACC7, ACC8, ACC9, ACC10, ACC11, ACC12, ACC13, ACC14, ACC15;

electrical ans_ACC, ans_MIN, ans_MAX, ERR_ACC, ERR_MIN, ERR_MAX, dbgo0;

parameter real FREQCK=10G;
parameter real trf=10p;
parameter real vth=0.9;
parameter real td_check=0/FREQCK;			// outputs change values 2 clock cycle after inputs change their value
parameter real t_start_check=2.5/FREQCK;	// checker start time

real value_a, value_MIN, value_MAX, value_ACC, golden_MIN, golden_MAX, golden_ACC;
real value_a0, value_a1, value_a2, value_a3, value_a4, value_a5, value_a6, value_a7, value_a8, value_a9, value_a10, value_a11, value_a12, value_a13, value_a14, value_a15;
real value_MIN0, value_MIN1, value_MIN2, value_MIN3, value_MIN4, value_MIN5, value_MIN6, value_MIN7, value_MIN8, value_MIN9, value_MIN10, value_MIN11, value_MIN12, value_MIN13, value_MIN14, value_MIN15, value_MAX0, value_MAX1, value_MAX2, value_MAX3, value_MAX4,value_MAX5, value_MAX6, value_MAX7, value_MAX8, value_MAX9, value_MAX10, value_MAX11, value_MAX12, value_MAX13, value_MAX14, value_MAX15, value_ACC0, value_ACC1, value_ACC2, value_ACC3, value_ACC4, value_ACC5, value_ACC6, value_ACC7, value_ACC8, value_ACC9, value_ACC10, value_ACC11, value_ACC12, value_ACC13, value_ACC14, value_ACC15;
real CLEAR_BUF0, CLEAR_BUF1, CLEAR_BUF2;
integer err_ACC_val, err_MIN_val, err_MAX_val, err_ACC_val_temp, err_MIN_val_temp, err_MAX_val_temp;
real value_a_temp;

analog begin
	@(initial_step) begin
		golden_MIN = 32767;
		golden_MAX = -32768;
		golden_ACC = 0;
		CLEAR_BUF1 = 1.8;
		CLEAR_BUF2 = 1.8;
		CLEAR_BUF0 = 0;
	end

	// ADC part input a
	value_a0 = (V(a0) > vth) ? 1*1 : 0;
	value_a1 = (V(a1) > vth) ? 1*2 : 0;
	value_a2 = (V(a2) > vth) ? 1*4 : 0;
	value_a3 = (V(a3) > vth) ? 1*8 : 0;
	value_a4 = (V(a4) > vth) ? 1*16 : 0;
	value_a5 = (V(a5) > vth) ? 1*32 : 0;
	value_a6 = (V(a6) > vth) ? 1*64 : 0;
	value_a7 = (V(a7) > vth) ? 1*128 : 0;
	value_a8 = (V(a8) > vth) ? 1*256 : 0;
	value_a9 = (V(a9) > vth) ? 1*512 : 0;
	value_a10 = (V(a10) > vth) ? 1*1024 : 0;
	value_a11 = (V(a11) > vth) ? 1*2048 : 0;
	value_a12 = (V(a12) > vth) ? 1*4096 : 0;
	value_a13 = (V(a13) > vth) ? 1*8192 : 0;
	value_a14 = (V(a14) > vth) ? 1*16384 : 0;
	value_a15 = (V(a15) > vth) ? 1*-32768 : 0;

	value_a_temp = value_a0 + value_a1 + value_a2 + value_a3 + value_a4 + value_a5 + value_a6 + value_a7 + value_a8 + value_a9 + value_a10 + value_a11 + value_a12 + value_a13 + value_a14 + value_a15;

	// ADC part input MIN
	value_MIN0 = (V(MIN0) > vth) ? 1*1 : 0;
	value_MIN1 = (V(MIN1) > vth) ? 1*2 : 0;
	value_MIN2 = (V(MIN2) > vth) ? 1*4 : 0;
	value_MIN3 = (V(MIN3) > vth) ? 1*8 : 0;
	value_MIN4 = (V(MIN4) > vth) ? 1*16 : 0;
	value_MIN5 = (V(MIN5) > vth) ? 1*32 : 0;
	value_MIN6 = (V(MIN6) > vth) ? 1*64 : 0;
	value_MIN7 = (V(MIN7) > vth) ? 1*128 : 0;
	value_MIN8 = (V(MIN8) > vth) ? 1*256 : 0;
	value_MIN9 = (V(MIN9) > vth) ? 1*512 : 0;
	value_MIN10 = (V(MIN10) > vth) ? 1*1024 : 0;
	value_MIN11 = (V(MIN11) > vth) ? 1*2048 : 0;
	value_MIN12 = (V(MIN12) > vth) ? 1*4096 : 0;
	value_MIN13 = (V(MIN13) > vth) ? 1*8192 : 0;
	value_MIN14 = (V(MIN14) > vth) ? 1*16384 : 0;
	value_MIN15 = (V(MIN15) > vth) ? 1*-32768 : 0;

	value_MIN = value_MIN0 + value_MIN1 + value_MIN2 + value_MIN3 + value_MIN4 + value_MIN5 + value_MIN6 + value_MIN7 + value_MIN8 + value_MIN9 + value_MIN10 + value_MIN11 + value_MIN12 + value_MIN13 + value_MIN14 + value_MIN15;

	// ADC part input MAX
	value_MAX0 = (V(MAX0) > vth) ? 1*1 : 0;
	value_MAX1 = (V(MAX1) > vth) ? 1*2 : 0;
	value_MAX2 = (V(MAX2) > vth) ? 1*4 : 0;
	value_MAX3 = (V(MAX3) > vth) ? 1*8 : 0;
	value_MAX4 = (V(MAX4) > vth) ? 1*16 : 0;
	value_MAX5 = (V(MAX5) > vth) ? 1*32 : 0;
	value_MAX6 = (V(MAX6) > vth) ? 1*64 : 0;
	value_MAX7 = (V(MAX7) > vth) ? 1*128 : 0;
	value_MAX8 = (V(MAX8) > vth) ? 1*256 : 0;
	value_MAX9 = (V(MAX9) > vth) ? 1*512 : 0;
	value_MAX10 = (V(MAX10) > vth) ? 1*1024 : 0;
	value_MAX11 = (V(MAX11) > vth) ? 1*2048 : 0;
	value_MAX12 = (V(MAX12) > vth) ? 1*4096 : 0;
	value_MAX13 = (V(MAX13) > vth) ? 1*8192 : 0;
	value_MAX14 = (V(MAX14) > vth) ? 1*16384 : 0;
	value_MAX15 = (V(MAX15) > vth) ? 1*-32768 : 0;

	value_MAX = value_MAX0 + value_MAX1 + value_MAX2 + value_MAX3 + value_MAX4 + value_MAX5 + value_MAX6 + value_MAX7 + value_MAX8 + value_MAX9 + value_MAX10 + value_MAX11 + value_MAX12 + value_MAX13 + value_MAX14 + value_MAX15;
	// ADC part input ACC
	value_ACC0 = (V(ACC0) > vth) ? 1*1 : 0;
	value_ACC1 = (V(ACC1) > vth) ? 1*2 : 0;
	value_ACC2 = (V(ACC2) > vth) ? 1*4 : 0;
	value_ACC3 = (V(ACC3) > vth) ? 1*8 : 0;
	value_ACC4 = (V(ACC4) > vth) ? 1*16 : 0;
	value_ACC5 = (V(ACC5) > vth) ? 1*32 : 0;
	value_ACC6 = (V(ACC6) > vth) ? 1*64 : 0;
	value_ACC7 = (V(ACC7) > vth) ? 1*128 : 0;
	value_ACC8 = (V(ACC8) > vth) ? 1*256 : 0;
	value_ACC9 = (V(ACC9) > vth) ? 1*512 : 0;
	value_ACC10 = (V(ACC10) > vth) ? 1*1024 : 0;
	value_ACC11 = (V(ACC11) > vth) ? 1*2048 : 0;
	value_ACC12 = (V(ACC12) > vth) ? 1*4096 : 0;
	value_ACC13 = (V(ACC13) > vth) ? 1*8192 : 0;
	value_ACC14 = (V(ACC14) > vth) ? 1*16384 : 0;
	value_ACC15 = (V(ACC15) > vth) ? 1*-32768 : 0;

	value_ACC = value_ACC0 + value_ACC1 + value_ACC2 + value_ACC3 + value_ACC4 + value_ACC5 + value_ACC6 + value_ACC7 + value_ACC8 + value_ACC9 + value_ACC10 + value_ACC11 + value_ACC12 + value_ACC13 + value_ACC14 + value_ACC15;

		// check answer
		if ($abstime < t_start_check) begin
			err_MIN_val_temp = 0;
		end else if (V(ans_MIN) == value_MIN) begin
			err_MIN_val_temp = err_MIN_val;
		end else begin
			err_MIN_val_temp = err_MIN_val + 1;
		end
		if ($abstime < t_start_check) begin
			err_MAX_val_temp = 0;
		end else if (V(ans_MAX) == value_MAX) begin
			err_MAX_val_temp = err_MAX_val;
		end else begin
			err_MAX_val_temp = err_MAX_val + 1;
		end
		if ($abstime < t_start_check) begin
			err_ACC_val_temp = 0;
		end else if (V(ans_ACC) == value_ACC) begin
			err_ACC_val_temp = err_ACC_val;
		end else begin
			err_ACC_val_temp = err_ACC_val + 1;
		end


	@(cross(V(CLK) - vth, 1)) begin


		// generate golden answer
		if (CLEAR_BUF0 > vth) begin 
			golden_ACC = 0;
		end else if (golden_ACC + value_a > 32767) begin
			golden_ACC = golden_ACC + value_a - 65536;
		end else if (golden_ACC + value_a < -32768) begin
			golden_ACC = golden_ACC + value_a + 65536;
		end else begin
			golden_ACC = golden_ACC + value_a;
		end

		if (CLEAR_BUF0 > vth) begin 
			golden_MIN = 32767;
		end else if (golden_MIN > value_a) begin
			golden_MIN = value_a;
		end else begin
			golden_MIN = golden_MIN;
		end

		if (CLEAR_BUF0 > vth) begin 
			golden_MAX = -32768;
		end else if (golden_MAX < value_a) begin
			golden_MAX = value_a;
		end else begin
			golden_MAX = golden_MAX;
		end
		// clear signal delay 2 cycle
		CLEAR_BUF0 = V(CLEAR);
		value_a = value_a_temp;
	end

	@(cross(V(CLK) - vth, -1)) begin

		err_ACC_val = err_ACC_val_temp;
		err_MIN_val = err_MIN_val_temp;
		err_MAX_val = err_MAX_val_temp;
	end

	V(ans_MIN) <+ transition(golden_MIN, td_check, trf, trf);
	V(ans_MAX) <+ transition(golden_MAX, td_check, trf, trf);
	V(ans_ACC) <+ transition(golden_ACC, td_check, trf, trf);
	V(ERR_MIN) <+ transition(err_MIN_val, 0, trf, trf);
	V(ERR_MAX) <+ transition(err_MAX_val, 0, trf, trf);
	V(ERR_ACC) <+ transition(err_ACC_val, 0, trf, trf);

	V(dbgo0) <+ value_a_temp;
end 

endmodule
