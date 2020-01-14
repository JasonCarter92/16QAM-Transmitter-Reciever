`default_nettype none

module GoldStandardMatched (
         input sys_clk,
			input sam_clk_ena,
			input sym_clk_ena,
		   input signed [17:0] x_in,
		   output reg signed [17:0] y   );
			

integer i;	
(*noprune*) reg signed [17:0]	b[64:0];				 
(*noprune*) reg signed [17:0]	xDelay[128:0];	
(*noprune*) reg signed [35:0] mult_out[64:0];
(*noprune*) reg signed [17:0] sum_level_1[64:0];
(*noprune*) reg signed [17:0] sum_level_2[32:0];
(*noprune*) reg signed [17:0] sum_level_3[16:0];
reg signed [17:0] sum_level_4[8:0];
reg signed [17:0] sum_level_5[4:0];
reg signed [17:0] sum_level_6[2:0];
reg signed [17:0] sum_level_7;
//reg signed [17:0] sum_level_8;

always @ (posedge sys_clk)
	if(sam_clk_ena)
	xDelay[0] <= { x_in[17], x_in[17:1]}; // sign extend input

always @ (posedge sys_clk)
	if(sam_clk_ena)
		begin
			for(i=1; i<129;i=i+1)
				xDelay[i] <= xDelay[i-1];
			end


always @ (posedge sys_clk)//*
	if(sam_clk_ena)
		for(i=0;i<=63;i=i+1)
			sum_level_1[i] <= xDelay[i]+xDelay[128-i];

always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_1[64] <= xDelay[64];

//I am here
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0;i<=64; i=i+1)
			mult_out[i] <= sum_level_1[i] * b[i];

//***c
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_2[32] <= mult_out[64][33:16];
always @ (posedge sys_clk)
	if(sam_clk_ena)
		begin
			for(i=0;i<=31;i=i+1)
			sum_level_2[i] <= mult_out[2*i][33:16] + mult_out[2*i+1][33:16];
		end

//***
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0;i<=15;i=i+1)
			sum_level_3[i] <= sum_level_2[2*i] + sum_level_2[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_3[16] <= sum_level_2[32];
//***			
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0;i<=7;i=i+1)
			sum_level_4[i] <= sum_level_3[2*i] + sum_level_3[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_4[8] <= sum_level_3[16];

always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0;i<=3;i=i+1)		
			sum_level_5[i] <= sum_level_4[2*i] + sum_level_4[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_5[4] <= sum_level_4[8];

always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0;i<=1;i=i+1)
			sum_level_6[i] <= sum_level_5[2*i] + sum_level_5[2*i+1];

always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_6[2] <= sum_level_5[4];
		
//always @ *
//	for(i=0;i<=1;i=i+1)
//		sum_level_7[i] = sum_level_6[2*i] + sum_level_6[2*i+1];

	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sum_level_7 <= sum_level_6[0] + sum_level_6[1] + sum_level_6[2];
	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		y <= sum_level_7;

always @ *
	begin
	  b[0] =  -18'sd173;
	  b[1] =  -18'sd66;
	  b[2] = 18'sd101;
	  b[3] = 18'sd209;
	  b[4] = 18'sd175;
	  b[5] = 18'sd11;
	  	b[6] =  -18'sd174;
	  	b[7] =  -18'sd248;
	  	b[8] =  -18'sd150;
	  	b[9] = 18'sd62;
	  	b[10] = 18'sd241;
	  	b[11] = 18'sd257;
	  	b[12] = 18'sd91;
	  	b[13] =  -18'sd146;
	  	b[14] =  -18'sd286;
	  	b[15] =  -18'sd222;
	  	b[16] = 18'sd5;
	  	b[17] = 18'sd234;
	  	b[18] = 18'sd293;
	  	b[19] = 18'sd130;
	  	b[20] =  -18'sd140;
	  	b[21] =  -18'sd312;
	  	b[22] =  -18'sd243;
	  	b[23] = 18'sd33;
	  	b[24] = 18'sd311;
	  	b[25] = 18'sd364; 
	  	b[26] = 18'sd115;
	 	b[27] =  -18'sd279;
	 	b[28] =  -18'sd515;
	 	b[29] =  -18'sd370;
	 	b[30] = 18'sd116;
	 	b[31] = 18'sd621;
	 	b[32] = 18'sd745;
	 	b[33] = 18'sd305;
	 	b[34] =  -18'sd479;
	 	b[35] =  -18'sd1077;
	 	b[36] =  -18'sd990;
	 	b[37] =  -18'sd136;
	 	b[38] = 18'sd1012;
	 	b[39] = 18'sd1666;
	 	b[40] = 18'sd1240;
	 	b[41] =  -18'sd180;
	 	b[42] =  -18'sd1772;
	 	b[43] =  -18'sd2426;
	 	b[44] =  -18'sd1481;
	 	b[45] = 18'sd716;
	 	b[46] = 18'sd2863;
	 	b[47] = 18'sd3434;
	 	b[48] = 18'sd1700;
	 	b[49] =  -18'sd1604;
	 	b[50] =  -18'sd4499;
	 	b[51] =  -18'sd4870;
	 	b[52] =  -18'sd1886;
	 	b[53] = 18'sd3161;
	 	b[54] = 18'sd7249;
	 	b[55] = 18'sd7262;
	 	b[56] = 18'sd2026;
	 	b[57] =  -18'sd6414;
	 	b[58] =  -18'sd13214;
	 	b[59] =  -18'sd12867;
	 	b[60] =  -18'sd2115;
	 	b[61] = 18'sd17886;
	 	b[62] = 18'sd41413;
	 	b[63] = 18'sd60320;
	 	b[64] = 18'sd67549;
		
   end


endmodule	

`default_nettype wire