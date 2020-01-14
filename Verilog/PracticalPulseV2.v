module PracticalPulseV2(
         input sys_clk,
			input sam_clk_ena,
			input sym_clk_ena,
		   input signed [1:0] x_in,
		   output reg signed [17:0] y   );

integer i;			
reg [17:0] hOut[0:160];
reg [1:0] xDelay [0:160];
reg [17:0] sumLevel1 [0:80];
reg [17:0] sumLevel2 [0:40];
reg [17:0] sumLevel3 [0:20];
reg [17:0] sumLevel4 [0:10];
reg [17:0] sumLevel5 [0:5];
reg [17:0] sumLevel6 [0:2];
reg [17:0] sumLevel7 [0:1];
reg [17:0] sumLevel8;


reg [1:0] counter;

always @ (posedge sys_clk)
	if(sam_clk_ena)
		counter = counter + 2'd1;

always @ (posedge sys_clk)
	if(sam_clk_ena)
		xDelay[0] = x_in;
		
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		begin
			for(i=1;i<=160; i=i+1)
				xDelay[i] <= xDelay[i-1];
		end

always @ *
	if( counter == 2'd0 )
		case(xDelay[0])
		   2'd0: 
		      hOut[0] = 18'sd35;
		   2'd1: 
		      hOut[0] = 18'sd12;
		   2'd2: 
		      hOut[0] = -18'sd12;
		   2'd3: 
		      hOut[0] = -18'sd35;
		endcase
	else
		hOut[0] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[1])
		   2'd0: 
		      hOut[1] = 18'sd3;
		   2'd1: 
		      hOut[1] = 18'sd1;
		   2'd2: 
		      hOut[1] = -18'sd1;
		   2'd3: 
		      hOut[1] = -18'sd3;
		endcase
	else
		hOut[1] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[2])
		   2'd0: 
		      hOut[2] = -18'sd35;
		   2'd1: 
		      hOut[2] = -18'sd12;
		   2'd2: 
		      hOut[2] = 18'sd12;
		   2'd3: 
		      hOut[2] = 18'sd35;
		endcase
	else
		hOut[2] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[3])
		   2'd0: 
		      hOut[3] = -18'sd53;
		   2'd1: 
		      hOut[3] = -18'sd18;
		   2'd2: 
		      hOut[3] = 18'sd18;
		   2'd3: 
		      hOut[3] = 18'sd53;
		endcase
	else
		hOut[3] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[4])
		   2'd0: 
		      hOut[4] = -18'sd36;
		   2'd1: 
		      hOut[4] = -18'sd12;
		   2'd2: 
		      hOut[4] = 18'sd12;
		   2'd3: 
		      hOut[4] = 18'sd36;
		endcase
	else
		hOut[4] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[5])
		   2'd0: 
		      hOut[5] = 18'sd9;
		   2'd1: 
		      hOut[5] = 18'sd3;
		   2'd2: 
		      hOut[5] = -18'sd3;
		   2'd3: 
		      hOut[5] = -18'sd9;
		endcase
	else
		hOut[5] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[6])
		   2'd0: 
		      hOut[6] = 18'sd52;
		   2'd1: 
		      hOut[6] = 18'sd17;
		   2'd2: 
		      hOut[6] = -18'sd17;
		   2'd3: 
		      hOut[6] = -18'sd52;
		endcase
	else
		hOut[6] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[7])
		   2'd0: 
		      hOut[7] = 18'sd63;
		   2'd1: 
		      hOut[7] = 18'sd21;
		   2'd2: 
		      hOut[7] = -18'sd21;
		   2'd3: 
		      hOut[7] = -18'sd63;
		endcase
	else
		hOut[7] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[8])
		   2'd0: 
		      hOut[8] = 18'sd31;
		   2'd1: 
		      hOut[8] = 18'sd10;
		   2'd2: 
		      hOut[8] = -18'sd10;
		   2'd3: 
		      hOut[8] = -18'sd31;
		endcase
	else
		hOut[8] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[9])
		   2'd0: 
		      hOut[9] = -18'sd25;
		   2'd1: 
		      hOut[9] = -18'sd8;
		   2'd2: 
		      hOut[9] = 18'sd8;
		   2'd3: 
		      hOut[9] = 18'sd25;
		endcase
	else
		hOut[9] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[10])
		   2'd0: 
		      hOut[10] = -18'sd69;
		   2'd1: 
		      hOut[10] = -18'sd23;
		   2'd2: 
		      hOut[10] = 18'sd23;
		   2'd3: 
		      hOut[10] = 18'sd69;
		endcase
	else
		hOut[10] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[11])
		   2'd0: 
		      hOut[11] = -18'sd68;
		   2'd1: 
		      hOut[11] = -18'sd23;
		   2'd2: 
		      hOut[11] = 18'sd23;
		   2'd3: 
		      hOut[11] = 18'sd68;
		endcase
	else
		hOut[11] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[12])
		   2'd0: 
		      hOut[12] = -18'sd20;
		   2'd1: 
		      hOut[12] = -18'sd7;
		   2'd2: 
		      hOut[12] = 18'sd7;
		   2'd3: 
		      hOut[12] = 18'sd20;
		endcase
	else
		hOut[12] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[13])
		   2'd0: 
		      hOut[13] = 18'sd46;
		   2'd1: 
		      hOut[13] = 18'sd15;
		   2'd2: 
		      hOut[13] = -18'sd15;
		   2'd3: 
		      hOut[13] = -18'sd46;
		endcase
	else
		hOut[13] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[14])
		   2'd0: 
		      hOut[14] = 18'sd84;
		   2'd1: 
		      hOut[14] = 18'sd28;
		   2'd2: 
		      hOut[14] = -18'sd28;
		   2'd3: 
		      hOut[14] = -18'sd84;
		endcase
	else
		hOut[14] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[15])
		   2'd0: 
		      hOut[15] = 18'sd65;
		   2'd1: 
		      hOut[15] = 18'sd22;
		   2'd2: 
		      hOut[15] = -18'sd22;
		   2'd3: 
		      hOut[15] = -18'sd65;
		endcase
	else
		hOut[15] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[16])
		   2'd0: 
		      hOut[16] = -18'sd2;
		   2'd1: 
		      hOut[16] = -18'sd1;
		   2'd2: 
		      hOut[16] = 18'sd1;
		   2'd3: 
		      hOut[16] = 18'sd2;
		endcase
	else
		hOut[16] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[17])
		   2'd0: 
		      hOut[17] = -18'sd71;
		   2'd1: 
		      hOut[17] = -18'sd24;
		   2'd2: 
		      hOut[17] = 18'sd24;
		   2'd3: 
		      hOut[17] = 18'sd71;
		endcase
	else
		hOut[17] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[18])
		   2'd0: 
		      hOut[18] = -18'sd94;
		   2'd1: 
		      hOut[18] = -18'sd31;
		   2'd2: 
		      hOut[18] = 18'sd31;
		   2'd3: 
		      hOut[18] = 18'sd94;
		endcase
	else
		hOut[18] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[19])
		   2'd0: 
		      hOut[19] = -18'sd49;
		   2'd1: 
		      hOut[19] = -18'sd16;
		   2'd2: 
		      hOut[19] = 18'sd16;
		   2'd3: 
		      hOut[19] = 18'sd49;
		endcase
	else
		hOut[19] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[20])
		   2'd0: 
		      hOut[20] = 18'sd34;
		   2'd1: 
		      hOut[20] = 18'sd11;
		   2'd2: 
		      hOut[20] = -18'sd11;
		   2'd3: 
		      hOut[20] = -18'sd34;
		endcase
	else
		hOut[20] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[21])
		   2'd0: 
		      hOut[21] = 18'sd98;
		   2'd1: 
		      hOut[21] = 18'sd33;
		   2'd2: 
		      hOut[21] = -18'sd33;
		   2'd3: 
		      hOut[21] = -18'sd98;
		endcase
	else
		hOut[21] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[22])
		   2'd0: 
		      hOut[22] = 18'sd93;
		   2'd1: 
		      hOut[22] = 18'sd31;
		   2'd2: 
		      hOut[22] = -18'sd31;
		   2'd3: 
		      hOut[22] = -18'sd93;
		endcase
	else
		hOut[22] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[23])
		   2'd0: 
		      hOut[23] = 18'sd17;
		   2'd1: 
		      hOut[23] = 18'sd6;
		   2'd2: 
		      hOut[23] = -18'sd6;
		   2'd3: 
		      hOut[23] = -18'sd17;
		endcase
	else
		hOut[23] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[24])
		   2'd0: 
		      hOut[24] = -18'sd79;
		   2'd1: 
		      hOut[24] = -18'sd26;
		   2'd2: 
		      hOut[24] = 18'sd26;
		   2'd3: 
		      hOut[24] = 18'sd79;
		endcase
	else
		hOut[24] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[25])
		   2'd0: 
		      hOut[25] = -18'sd123;
		   2'd1: 
		      hOut[25] = -18'sd41;
		   2'd2: 
		      hOut[25] = 18'sd41;
		   2'd3: 
		      hOut[25] = 18'sd123;
		endcase
	else
		hOut[25] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[26])
		   2'd0: 
		      hOut[26] = -18'sd76;
		   2'd1: 
		      hOut[26] = -18'sd25;
		   2'd2: 
		      hOut[26] = 18'sd25;
		   2'd3: 
		      hOut[26] = 18'sd76;
		endcase
	else
		hOut[26] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[27])
		   2'd0: 
		      hOut[27] = 18'sd37;
		   2'd1: 
		      hOut[27] = 18'sd12;
		   2'd2: 
		      hOut[27] = -18'sd12;
		   2'd3: 
		      hOut[27] = -18'sd37;
		endcase
	else
		hOut[27] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[28])
		   2'd0: 
		      hOut[28] = 18'sd137;
		   2'd1: 
		      hOut[28] = 18'sd46;
		   2'd2: 
		      hOut[28] = -18'sd46;
		   2'd3: 
		      hOut[28] = -18'sd137;
		endcase
	else
		hOut[28] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[29])
		   2'd0: 
		      hOut[29] = 18'sd143;
		   2'd1: 
		      hOut[29] = 18'sd48;
		   2'd2: 
		      hOut[29] = -18'sd48;
		   2'd3: 
		      hOut[29] = -18'sd143;
		endcase
	else
		hOut[29] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[30])
		   2'd0: 
		      hOut[30] = 18'sd36;
		   2'd1: 
		      hOut[30] = 18'sd12;
		   2'd2: 
		      hOut[30] = -18'sd12;
		   2'd3: 
		      hOut[30] = -18'sd36;
		endcase
	else
		hOut[30] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[31])
		   2'd0: 
		      hOut[31] = -18'sd119;
		   2'd1: 
		      hOut[31] = -18'sd40;
		   2'd2: 
		      hOut[31] = 18'sd40;
		   2'd3: 
		      hOut[31] = 18'sd119;
		endcase
	else
		hOut[31] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[32])
		   2'd0: 
		      hOut[32] = -18'sd209;
		   2'd1: 
		      hOut[32] = -18'sd70;
		   2'd2: 
		      hOut[32] = 18'sd70;
		   2'd3: 
		      hOut[32] = 18'sd209;
		endcase
	else
		hOut[32] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[33])
		   2'd0: 
		      hOut[33] = -18'sd153;
		   2'd1: 
		      hOut[33] = -18'sd51;
		   2'd2: 
		      hOut[33] = 18'sd51;
		   2'd3: 
		      hOut[33] = 18'sd153;
		endcase
	else
		hOut[33] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[34])
		   2'd0: 
		      hOut[34] = 18'sd34;
		   2'd1: 
		      hOut[34] = 18'sd11;
		   2'd2: 
		      hOut[34] = -18'sd11;
		   2'd3: 
		      hOut[34] = -18'sd34;
		endcase
	else
		hOut[34] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[35])
		   2'd0: 
		      hOut[35] = 18'sd232;
		   2'd1: 
		      hOut[35] = 18'sd77;
		   2'd2: 
		      hOut[35] = -18'sd77;
		   2'd3: 
		      hOut[35] = -18'sd232;
		endcase
	else
		hOut[35] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[36])
		   2'd0: 
		      hOut[36] = 18'sd294;
		   2'd1: 
		      hOut[36] = 18'sd98;
		   2'd2: 
		      hOut[36] = -18'sd98;
		   2'd3: 
		      hOut[36] = -18'sd294;
		endcase
	else
		hOut[36] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[37])
		   2'd0: 
		      hOut[37] = 18'sd145;
		   2'd1: 
		      hOut[37] = 18'sd48;
		   2'd2: 
		      hOut[37] = -18'sd48;
		   2'd3: 
		      hOut[37] = -18'sd145;
		endcase
	else
		hOut[37] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[38])
		   2'd0: 
		      hOut[38] = -18'sd143;
		   2'd1: 
		      hOut[38] = -18'sd48;
		   2'd2: 
		      hOut[38] = 18'sd48;
		   2'd3: 
		      hOut[38] = 18'sd143;
		endcase
	else
		hOut[38] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[39])
		   2'd0: 
		      hOut[39] = -18'sd383;
		   2'd1: 
		      hOut[39] = -18'sd128;
		   2'd2: 
		      hOut[39] = 18'sd128;
		   2'd3: 
		      hOut[39] = 18'sd383;
		endcase
	else
		hOut[39] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[40])
		   2'd0: 
		      hOut[40] = -18'sd389;
		   2'd1: 
		      hOut[40] = -18'sd130;
		   2'd2: 
		      hOut[40] = 18'sd130;
		   2'd3: 
		      hOut[40] = 18'sd389;
		endcase
	else
		hOut[40] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[41])
		   2'd0: 
		      hOut[41] = -18'sd112;
		   2'd1: 
		      hOut[41] = -18'sd37;
		   2'd2: 
		      hOut[41] = 18'sd37;
		   2'd3: 
		      hOut[41] = 18'sd112;
		endcase
	else
		hOut[41] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[42])
		   2'd0: 
		      hOut[42] = 18'sd302;
		   2'd1: 
		      hOut[42] = 18'sd101;
		   2'd2: 
		      hOut[42] = -18'sd101;
		   2'd3: 
		      hOut[42] = -18'sd302;
		endcase
	else
		hOut[42] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[43])
		   2'd0: 
		      hOut[43] = 18'sd579;
		   2'd1: 
		      hOut[43] = 18'sd193;
		   2'd2: 
		      hOut[43] = -18'sd193;
		   2'd3: 
		      hOut[43] = -18'sd579;
		endcase
	else
		hOut[43] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[44])
		   2'd0: 
		      hOut[44] = 18'sd494;
		   2'd1: 
		      hOut[44] = 18'sd165;
		   2'd2: 
		      hOut[44] = -18'sd165;
		   2'd3: 
		      hOut[44] = -18'sd494;
		endcase
	else
		hOut[44] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[45])
		   2'd0: 
		      hOut[45] = 18'sd43;
		   2'd1: 
		      hOut[45] = 18'sd14;
		   2'd2: 
		      hOut[45] = -18'sd14;
		   2'd3: 
		      hOut[45] = -18'sd43;
		endcase
	else
		hOut[45] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[46])
		   2'd0: 
		      hOut[46] = -18'sd523;
		   2'd1: 
		      hOut[46] = -18'sd174;
		   2'd2: 
		      hOut[46] = 18'sd174;
		   2'd3: 
		      hOut[46] = 18'sd523;
		endcase
	else
		hOut[46] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[47])
		   2'd0: 
		      hOut[47] = -18'sd826;
		   2'd1: 
		      hOut[47] = -18'sd275;
		   2'd2: 
		      hOut[47] = 18'sd275;
		   2'd3: 
		      hOut[47] = 18'sd826;
		endcase
	else
		hOut[47] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[48])
		   2'd0: 
		      hOut[48] = -18'sd605;
		   2'd1: 
		      hOut[48] = -18'sd202;
		   2'd2: 
		      hOut[48] = 18'sd202;
		   2'd3: 
		      hOut[48] = 18'sd605;
		endcase
	else
		hOut[48] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[49])
		   2'd0: 
		      hOut[49] = 18'sd76;
		   2'd1: 
		      hOut[49] = 18'sd25;
		   2'd2: 
		      hOut[49] = -18'sd25;
		   2'd3: 
		      hOut[49] = -18'sd76;
		endcase
	else
		hOut[49] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[50])
		   2'd0: 
		      hOut[50] = 18'sd825;
		   2'd1: 
		      hOut[50] = 18'sd275;
		   2'd2: 
		      hOut[50] = -18'sd275;
		   2'd3: 
		      hOut[50] = -18'sd825;
		endcase
	else
		hOut[50] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[51])
		   2'd0: 
		      hOut[51] = 18'sd1135;
		   2'd1: 
		      hOut[51] = 18'sd378;
		   2'd2: 
		      hOut[51] = -18'sd378;
		   2'd3: 
		      hOut[51] = -18'sd1135;
		endcase
	else
		hOut[51] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[52])
		   2'd0: 
		      hOut[52] = 18'sd717;
		   2'd1: 
		      hOut[52] = 18'sd239;
		   2'd2: 
		      hOut[52] = -18'sd239;
		   2'd3: 
		      hOut[52] = -18'sd717;
		endcase
	else
		hOut[52] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[53])
		   2'd0: 
		      hOut[53] = -18'sd264;
		   2'd1: 
		      hOut[53] = -18'sd88;
		   2'd2: 
		      hOut[53] = 18'sd88;
		   2'd3: 
		      hOut[53] = 18'sd264;
		endcase
	else
		hOut[53] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[54])
		   2'd0: 
		      hOut[54] = -18'sd1232;
		   2'd1: 
		      hOut[54] = -18'sd411;
		   2'd2: 
		      hOut[54] = 18'sd411;
		   2'd3: 
		      hOut[54] = 18'sd1232;
		endcase
	else
		hOut[54] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[55])
		   2'd0: 
		      hOut[55] = -18'sd1523;
		   2'd1: 
		      hOut[55] = -18'sd508;
		   2'd2: 
		      hOut[55] = 18'sd508;
		   2'd3: 
		      hOut[55] = 18'sd1523;
		endcase
	else
		hOut[55] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[56])
		   2'd0: 
		      hOut[56] = -18'sd827;
		   2'd1: 
		      hOut[56] = -18'sd276;
		   2'd2: 
		      hOut[56] = 18'sd276;
		   2'd3: 
		      hOut[56] = 18'sd827;
		endcase
	else
		hOut[56] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[57])
		   2'd0: 
		      hOut[57] = 18'sd548;
		   2'd1: 
		      hOut[57] = 18'sd183;
		   2'd2: 
		      hOut[57] = -18'sd183;
		   2'd3: 
		      hOut[57] = -18'sd548;
		endcase
	else
		hOut[57] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[58])
		   2'd0: 
		      hOut[58] = 18'sd1784;
		   2'd1: 
		      hOut[58] = 18'sd595;
		   2'd2: 
		      hOut[58] = -18'sd595;
		   2'd3: 
		      hOut[58] = -18'sd1784;
		endcase
	else
		hOut[58] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[59])
		   2'd0: 
		      hOut[59] = 18'sd2022;
		   2'd1: 
		      hOut[59] = 18'sd674;
		   2'd2: 
		      hOut[59] = -18'sd674;
		   2'd3: 
		      hOut[59] = -18'sd2022;
		endcase
	else
		hOut[59] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[60])
		   2'd0: 
		      hOut[60] = 18'sd931;
		   2'd1: 
		      hOut[60] = 18'sd310;
		   2'd2: 
		      hOut[60] = -18'sd310;
		   2'd3: 
		      hOut[60] = -18'sd931;
		endcase
	else
		hOut[60] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[61])
		   2'd0: 
		      hOut[61] = -18'sd978;
		   2'd1: 
		      hOut[61] = -18'sd326;
		   2'd2: 
		      hOut[61] = 18'sd326;
		   2'd3: 
		      hOut[61] = 18'sd978;
		endcase
	else
		hOut[61] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[62])
		   2'd0: 
		      hOut[62] = -18'sd2559;
		   2'd1: 
		      hOut[62] = -18'sd853;
		   2'd2: 
		      hOut[62] = 18'sd853;
		   2'd3: 
		      hOut[62] = 18'sd2559;
		endcase
	else
		hOut[62] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[63])
		   2'd0: 
		      hOut[63] = -18'sd2690;
		   2'd1: 
		      hOut[63] = -18'sd897;
		   2'd2: 
		      hOut[63] = 18'sd897;
		   2'd3: 
		      hOut[63] = 18'sd2690;
		endcase
	else
		hOut[63] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[64])
		   2'd0: 
		      hOut[64] = -18'sd1022;
		   2'd1: 
		      hOut[64] = -18'sd341;
		   2'd2: 
		      hOut[64] = 18'sd341;
		   2'd3: 
		      hOut[64] = 18'sd1022;
		endcase
	else
		hOut[64] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[65])
		   2'd0: 
		      hOut[65] = 18'sd1651;
		   2'd1: 
		      hOut[65] = 18'sd550;
		   2'd2: 
		      hOut[65] = -18'sd550;
		   2'd3: 
		      hOut[65] = -18'sd1651;
		endcase
	else
		hOut[65] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[66])
		   2'd0: 
		      hOut[66] = 18'sd3719;
		   2'd1: 
		      hOut[66] = 18'sd1240;
		   2'd2: 
		      hOut[66] = -18'sd1240;
		   2'd3: 
		      hOut[66] = -18'sd3719;
		endcase
	else
		hOut[66] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[67])
		   2'd0: 
		      hOut[67] = 18'sd3669;
		   2'd1: 
		      hOut[67] = 18'sd1223;
		   2'd2: 
		      hOut[67] = -18'sd1223;
		   2'd3: 
		      hOut[67] = -18'sd3669;
		endcase
	else
		hOut[67] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[68])
		   2'd0: 
		      hOut[68] = 18'sd1099;
		   2'd1: 
		      hOut[68] = 18'sd366;
		   2'd2: 
		      hOut[68] = -18'sd366;
		   2'd3: 
		      hOut[68] = -18'sd1099;
		endcase
	else
		hOut[68] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[69])
		   2'd0: 
		      hOut[69] = -18'sd2801;
		   2'd1: 
		      hOut[69] = -18'sd934;
		   2'd2: 
		      hOut[69] = 18'sd934;
		   2'd3: 
		      hOut[69] = 18'sd2801;
		endcase
	else
		hOut[69] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[70])
		   2'd0: 
		      hOut[70] = -18'sd5692;
		   2'd1: 
		      hOut[70] = -18'sd1897;
		   2'd2: 
		      hOut[70] = 18'sd1897;
		   2'd3: 
		      hOut[70] = 18'sd5692;
		endcase
	else
		hOut[70] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[71])
		   2'd0: 
		      hOut[71] = -18'sd5359;
		   2'd1: 
		      hOut[71] = -18'sd1786;
		   2'd2: 
		      hOut[71] = 18'sd1786;
		   2'd3: 
		      hOut[71] = 18'sd5359;
		endcase
	else
		hOut[71] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[72])
		   2'd0: 
		      hOut[72] = -18'sd1156;
		   2'd1: 
		      hOut[72] = -18'sd385;
		   2'd2: 
		      hOut[72] = 18'sd385;
		   2'd3: 
		      hOut[72] = 18'sd1156;
		endcase
	else
		hOut[72] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[73])
		   2'd0: 
		      hOut[73] = 18'sd5198;
		   2'd1: 
		      hOut[73] = 18'sd1733;
		   2'd2: 
		      hOut[73] = -18'sd1733;
		   2'd3: 
		      hOut[73] = -18'sd5198;
		endcase
	else
		hOut[73] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[74])
		   2'd0: 
		      hOut[74] = 18'sd10055;
		   2'd1: 
		      hOut[74] = 18'sd3352;
		   2'd2: 
		      hOut[74] = -18'sd3352;
		   2'd3: 
		      hOut[74] = -18'sd10055;
		endcase
	else
		hOut[74] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[75])
		   2'd0: 
		      hOut[75] = 18'sd9454;
		   2'd1: 
		      hOut[75] = 18'sd3151;
		   2'd2: 
		      hOut[75] = -18'sd3151;
		   2'd3: 
		      hOut[75] = -18'sd9454;
		endcase
	else
		hOut[75] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[76])
		   2'd0: 
		      hOut[76] = 18'sd1191;
		   2'd1: 
		      hOut[76] = 18'sd397;
		   2'd2: 
		      hOut[76] = -18'sd397;
		   2'd3: 
		      hOut[76] = -18'sd1191;
		endcase
	else
		hOut[76] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[77])
		   2'd0: 
		      hOut[77] = -18'sd13722;
		   2'd1: 
		      hOut[77] = -18'sd4574;
		   2'd2: 
		      hOut[77] = 18'sd4574;
		   2'd3: 
		      hOut[77] = 18'sd13722;
		endcase
	else
		hOut[77] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[78])
		   2'd0: 
		      hOut[78] = -18'sd31043;
		   2'd1: 
		      hOut[78] = -18'sd10348;
		   2'd2: 
		      hOut[78] = 18'sd10348;
		   2'd3: 
		      hOut[78] = 18'sd31043;
		endcase
	else
		hOut[78] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[79])
		   2'd0: 
		      hOut[79] = -18'sd44870;
		   2'd1: 
		      hOut[79] = -18'sd14957;
		   2'd2: 
		      hOut[79] = 18'sd14957;
		   2'd3: 
		      hOut[79] = 18'sd44870;
		endcase
	else
		hOut[79] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[80])
		   2'd0: 
		      hOut[80] = -18'sd50141;
		   2'd1: 
		      hOut[80] = -18'sd16714;
		   2'd2: 
		      hOut[80] = 18'sd16714;
		   2'd3: 
		      hOut[80] = 18'sd50141;
		endcase
	else
		hOut[80] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[81])
		   2'd0: 
		      hOut[81] = -18'sd44870;
		   2'd1: 
		      hOut[81] = -18'sd14957;
		   2'd2: 
		      hOut[81] = 18'sd14957;
		   2'd3: 
		      hOut[81] = 18'sd44870;
		endcase
	else
		hOut[81] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[82])
		   2'd0: 
		      hOut[82] = -18'sd31043;
		   2'd1: 
		      hOut[82] = -18'sd10348;
		   2'd2: 
		      hOut[82] = 18'sd10348;
		   2'd3: 
		      hOut[82] = 18'sd31043;
		endcase
	else
		hOut[82] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[83])
		   2'd0: 
		      hOut[83] = -18'sd13722;
		   2'd1: 
		      hOut[83] = -18'sd4574;
		   2'd2: 
		      hOut[83] = 18'sd4574;
		   2'd3: 
		      hOut[83] = 18'sd13722;
		endcase
	else
		hOut[83] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[84])
		   2'd0: 
		      hOut[84] = 18'sd1191;
		   2'd1: 
		      hOut[84] = 18'sd397;
		   2'd2: 
		      hOut[84] = -18'sd397;
		   2'd3: 
		      hOut[84] = -18'sd1191;
		endcase
	else
		hOut[84] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[85])
		   2'd0: 
		      hOut[85] = 18'sd9454;
		   2'd1: 
		      hOut[85] = 18'sd3151;
		   2'd2: 
		      hOut[85] = -18'sd3151;
		   2'd3: 
		      hOut[85] = -18'sd9454;
		endcase
	else
		hOut[85] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[86])
		   2'd0: 
		      hOut[86] = 18'sd10055;
		   2'd1: 
		      hOut[86] = 18'sd3352;
		   2'd2: 
		      hOut[86] = -18'sd3352;
		   2'd3: 
		      hOut[86] = -18'sd10055;
		endcase
	else
		hOut[86] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[87])
		   2'd0: 
		      hOut[87] = 18'sd5198;
		   2'd1: 
		      hOut[87] = 18'sd1733;
		   2'd2: 
		      hOut[87] = -18'sd1733;
		   2'd3: 
		      hOut[87] = -18'sd5198;
		endcase
	else
		hOut[87] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[88])
		   2'd0: 
		      hOut[88] = -18'sd1156;
		   2'd1: 
		      hOut[88] = -18'sd385;
		   2'd2: 
		      hOut[88] = 18'sd385;
		   2'd3: 
		      hOut[88] = 18'sd1156;
		endcase
	else
		hOut[88] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[89])
		   2'd0: 
		      hOut[89] = -18'sd5359;
		   2'd1: 
		      hOut[89] = -18'sd1786;
		   2'd2: 
		      hOut[89] = 18'sd1786;
		   2'd3: 
		      hOut[89] = 18'sd5359;
		endcase
	else
		hOut[89] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[90])
		   2'd0: 
		      hOut[90] = -18'sd5692;
		   2'd1: 
		      hOut[90] = -18'sd1897;
		   2'd2: 
		      hOut[90] = 18'sd1897;
		   2'd3: 
		      hOut[90] = 18'sd5692;
		endcase
	else
		hOut[90] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[91])
		   2'd0: 
		      hOut[91] = -18'sd2801;
		   2'd1: 
		      hOut[91] = -18'sd934;
		   2'd2: 
		      hOut[91] = 18'sd934;
		   2'd3: 
		      hOut[91] = 18'sd2801;
		endcase
	else
		hOut[91] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[92])
		   2'd0: 
		      hOut[92] = 18'sd1099;
		   2'd1: 
		      hOut[92] = 18'sd366;
		   2'd2: 
		      hOut[92] = -18'sd366;
		   2'd3: 
		      hOut[92] = -18'sd1099;
		endcase
	else
		hOut[92] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[93])
		   2'd0: 
		      hOut[93] = 18'sd3669;
		   2'd1: 
		      hOut[93] = 18'sd1223;
		   2'd2: 
		      hOut[93] = -18'sd1223;
		   2'd3: 
		      hOut[93] = -18'sd3669;
		endcase
	else
		hOut[93] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[94])
		   2'd0: 
		      hOut[94] = 18'sd3719;
		   2'd1: 
		      hOut[94] = 18'sd1240;
		   2'd2: 
		      hOut[94] = -18'sd1240;
		   2'd3: 
		      hOut[94] = -18'sd3719;
		endcase
	else
		hOut[94] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[95])
		   2'd0: 
		      hOut[95] = 18'sd1651;
		   2'd1: 
		      hOut[95] = 18'sd550;
		   2'd2: 
		      hOut[95] = -18'sd550;
		   2'd3: 
		      hOut[95] = -18'sd1651;
		endcase
	else
		hOut[95] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[96])
		   2'd0: 
		      hOut[96] = -18'sd1022;
		   2'd1: 
		      hOut[96] = -18'sd341;
		   2'd2: 
		      hOut[96] = 18'sd341;
		   2'd3: 
		      hOut[96] = 18'sd1022;
		endcase
	else
		hOut[96] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[97])
		   2'd0: 
		      hOut[97] = -18'sd2690;
		   2'd1: 
		      hOut[97] = -18'sd897;
		   2'd2: 
		      hOut[97] = 18'sd897;
		   2'd3: 
		      hOut[97] = 18'sd2690;
		endcase
	else
		hOut[97] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[98])
		   2'd0: 
		      hOut[98] = -18'sd2559;
		   2'd1: 
		      hOut[98] = -18'sd853;
		   2'd2: 
		      hOut[98] = 18'sd853;
		   2'd3: 
		      hOut[98] = 18'sd2559;
		endcase
	else
		hOut[98] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[99])
		   2'd0: 
		      hOut[99] = -18'sd978;
		   2'd1: 
		      hOut[99] = -18'sd326;
		   2'd2: 
		      hOut[99] = 18'sd326;
		   2'd3: 
		      hOut[99] = 18'sd978;
		endcase
	else
		hOut[99] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[100])
		   2'd0: 
		      hOut[100] = 18'sd931;
		   2'd1: 
		      hOut[100] = 18'sd310;
		   2'd2: 
		      hOut[100] = -18'sd310;
		   2'd3: 
		      hOut[100] = -18'sd931;
		endcase
	else
		hOut[100] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[101])
		   2'd0: 
		      hOut[101] = 18'sd2022;
		   2'd1: 
		      hOut[101] = 18'sd674;
		   2'd2: 
		      hOut[101] = -18'sd674;
		   2'd3: 
		      hOut[101] = -18'sd2022;
		endcase
	else
		hOut[101] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[102])
		   2'd0: 
		      hOut[102] = 18'sd1784;
		   2'd1: 
		      hOut[102] = 18'sd595;
		   2'd2: 
		      hOut[102] = -18'sd595;
		   2'd3: 
		      hOut[102] = -18'sd1784;
		endcase
	else
		hOut[102] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[103])
		   2'd0: 
		      hOut[103] = 18'sd548;
		   2'd1: 
		      hOut[103] = 18'sd183;
		   2'd2: 
		      hOut[103] = -18'sd183;
		   2'd3: 
		      hOut[103] = -18'sd548;
		endcase
	else
		hOut[103] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[104])
		   2'd0: 
		      hOut[104] = -18'sd827;
		   2'd1: 
		      hOut[104] = -18'sd276;
		   2'd2: 
		      hOut[104] = 18'sd276;
		   2'd3: 
		      hOut[104] = 18'sd827;
		endcase
	else
		hOut[104] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[105])
		   2'd0: 
		      hOut[105] = -18'sd1523;
		   2'd1: 
		      hOut[105] = -18'sd508;
		   2'd2: 
		      hOut[105] = 18'sd508;
		   2'd3: 
		      hOut[105] = 18'sd1523;
		endcase
	else
		hOut[105] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[106])
		   2'd0: 
		      hOut[106] = -18'sd1232;
		   2'd1: 
		      hOut[106] = -18'sd411;
		   2'd2: 
		      hOut[106] = 18'sd411;
		   2'd3: 
		      hOut[106] = 18'sd1232;
		endcase
	else
		hOut[106] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[107])
		   2'd0: 
		      hOut[107] = -18'sd264;
		   2'd1: 
		      hOut[107] = -18'sd88;
		   2'd2: 
		      hOut[107] = 18'sd88;
		   2'd3: 
		      hOut[107] = 18'sd264;
		endcase
	else
		hOut[107] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[108])
		   2'd0: 
		      hOut[108] = 18'sd717;
		   2'd1: 
		      hOut[108] = 18'sd239;
		   2'd2: 
		      hOut[108] = -18'sd239;
		   2'd3: 
		      hOut[108] = -18'sd717;
		endcase
	else
		hOut[108] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[109])
		   2'd0: 
		      hOut[109] = 18'sd1135;
		   2'd1: 
		      hOut[109] = 18'sd378;
		   2'd2: 
		      hOut[109] = -18'sd378;
		   2'd3: 
		      hOut[109] = -18'sd1135;
		endcase
	else
		hOut[109] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[110])
		   2'd0: 
		      hOut[110] = 18'sd825;
		   2'd1: 
		      hOut[110] = 18'sd275;
		   2'd2: 
		      hOut[110] = -18'sd275;
		   2'd3: 
		      hOut[110] = -18'sd825;
		endcase
	else
		hOut[110] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[111])
		   2'd0: 
		      hOut[111] = 18'sd76;
		   2'd1: 
		      hOut[111] = 18'sd25;
		   2'd2: 
		      hOut[111] = -18'sd25;
		   2'd3: 
		      hOut[111] = -18'sd76;
		endcase
	else
		hOut[111] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[112])
		   2'd0: 
		      hOut[112] = -18'sd605;
		   2'd1: 
		      hOut[112] = -18'sd202;
		   2'd2: 
		      hOut[112] = 18'sd202;
		   2'd3: 
		      hOut[112] = 18'sd605;
		endcase
	else
		hOut[112] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[113])
		   2'd0: 
		      hOut[113] = -18'sd826;
		   2'd1: 
		      hOut[113] = -18'sd275;
		   2'd2: 
		      hOut[113] = 18'sd275;
		   2'd3: 
		      hOut[113] = 18'sd826;
		endcase
	else
		hOut[113] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[114])
		   2'd0: 
		      hOut[114] = -18'sd523;
		   2'd1: 
		      hOut[114] = -18'sd174;
		   2'd2: 
		      hOut[114] = 18'sd174;
		   2'd3: 
		      hOut[114] = 18'sd523;
		endcase
	else
		hOut[114] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[115])
		   2'd0: 
		      hOut[115] = 18'sd43;
		   2'd1: 
		      hOut[115] = 18'sd14;
		   2'd2: 
		      hOut[115] = -18'sd14;
		   2'd3: 
		      hOut[115] = -18'sd43;
		endcase
	else
		hOut[115] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[116])
		   2'd0: 
		      hOut[116] = 18'sd494;
		   2'd1: 
		      hOut[116] = 18'sd165;
		   2'd2: 
		      hOut[116] = -18'sd165;
		   2'd3: 
		      hOut[116] = -18'sd494;
		endcase
	else
		hOut[116] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[117])
		   2'd0: 
		      hOut[117] = 18'sd579;
		   2'd1: 
		      hOut[117] = 18'sd193;
		   2'd2: 
		      hOut[117] = -18'sd193;
		   2'd3: 
		      hOut[117] = -18'sd579;
		endcase
	else
		hOut[117] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[118])
		   2'd0: 
		      hOut[118] = 18'sd302;
		   2'd1: 
		      hOut[118] = 18'sd101;
		   2'd2: 
		      hOut[118] = -18'sd101;
		   2'd3: 
		      hOut[118] = -18'sd302;
		endcase
	else
		hOut[118] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[119])
		   2'd0: 
		      hOut[119] = -18'sd112;
		   2'd1: 
		      hOut[119] = -18'sd37;
		   2'd2: 
		      hOut[119] = 18'sd37;
		   2'd3: 
		      hOut[119] = 18'sd112;
		endcase
	else
		hOut[119] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[120])
		   2'd0: 
		      hOut[120] = -18'sd389;
		   2'd1: 
		      hOut[120] = -18'sd130;
		   2'd2: 
		      hOut[120] = 18'sd130;
		   2'd3: 
		      hOut[120] = 18'sd389;
		endcase
	else
		hOut[120] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[121])
		   2'd0: 
		      hOut[121] = -18'sd383;
		   2'd1: 
		      hOut[121] = -18'sd128;
		   2'd2: 
		      hOut[121] = 18'sd128;
		   2'd3: 
		      hOut[121] = 18'sd383;
		endcase
	else
		hOut[121] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[122])
		   2'd0: 
		      hOut[122] = -18'sd143;
		   2'd1: 
		      hOut[122] = -18'sd48;
		   2'd2: 
		      hOut[122] = 18'sd48;
		   2'd3: 
		      hOut[122] = 18'sd143;
		endcase
	else
		hOut[122] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[123])
		   2'd0: 
		      hOut[123] = 18'sd145;
		   2'd1: 
		      hOut[123] = 18'sd48;
		   2'd2: 
		      hOut[123] = -18'sd48;
		   2'd3: 
		      hOut[123] = -18'sd145;
		endcase
	else
		hOut[123] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[124])
		   2'd0: 
		      hOut[124] = 18'sd294;
		   2'd1: 
		      hOut[124] = 18'sd98;
		   2'd2: 
		      hOut[124] = -18'sd98;
		   2'd3: 
		      hOut[124] = -18'sd294;
		endcase
	else
		hOut[124] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[125])
		   2'd0: 
		      hOut[125] = 18'sd232;
		   2'd1: 
		      hOut[125] = 18'sd77;
		   2'd2: 
		      hOut[125] = -18'sd77;
		   2'd3: 
		      hOut[125] = -18'sd232;
		endcase
	else
		hOut[125] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[126])
		   2'd0: 
		      hOut[126] = 18'sd34;
		   2'd1: 
		      hOut[126] = 18'sd11;
		   2'd2: 
		      hOut[126] = -18'sd11;
		   2'd3: 
		      hOut[126] = -18'sd34;
		endcase
	else
		hOut[126] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[127])
		   2'd0: 
		      hOut[127] = -18'sd153;
		   2'd1: 
		      hOut[127] = -18'sd51;
		   2'd2: 
		      hOut[127] = 18'sd51;
		   2'd3: 
		      hOut[127] = 18'sd153;
		endcase
	else
		hOut[127] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[128])
		   2'd0: 
		      hOut[128] = -18'sd209;
		   2'd1: 
		      hOut[128] = -18'sd70;
		   2'd2: 
		      hOut[128] = 18'sd70;
		   2'd3: 
		      hOut[128] = 18'sd209;
		endcase
	else
		hOut[128] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[129])
		   2'd0: 
		      hOut[129] = -18'sd119;
		   2'd1: 
		      hOut[129] = -18'sd40;
		   2'd2: 
		      hOut[129] = 18'sd40;
		   2'd3: 
		      hOut[129] = 18'sd119;
		endcase
	else
		hOut[129] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[130])
		   2'd0: 
		      hOut[130] = 18'sd36;
		   2'd1: 
		      hOut[130] = 18'sd12;
		   2'd2: 
		      hOut[130] = -18'sd12;
		   2'd3: 
		      hOut[130] = -18'sd36;
		endcase
	else
		hOut[130] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[131])
		   2'd0: 
		      hOut[131] = 18'sd143;
		   2'd1: 
		      hOut[131] = 18'sd48;
		   2'd2: 
		      hOut[131] = -18'sd48;
		   2'd3: 
		      hOut[131] = -18'sd143;
		endcase
	else
		hOut[131] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[132])
		   2'd0: 
		      hOut[132] = 18'sd137;
		   2'd1: 
		      hOut[132] = 18'sd46;
		   2'd2: 
		      hOut[132] = -18'sd46;
		   2'd3: 
		      hOut[132] = -18'sd137;
		endcase
	else
		hOut[132] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[133])
		   2'd0: 
		      hOut[133] = 18'sd37;
		   2'd1: 
		      hOut[133] = 18'sd12;
		   2'd2: 
		      hOut[133] = -18'sd12;
		   2'd3: 
		      hOut[133] = -18'sd37;
		endcase
	else
		hOut[133] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[134])
		   2'd0: 
		      hOut[134] = -18'sd76;
		   2'd1: 
		      hOut[134] = -18'sd25;
		   2'd2: 
		      hOut[134] = 18'sd25;
		   2'd3: 
		      hOut[134] = 18'sd76;
		endcase
	else
		hOut[134] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[135])
		   2'd0: 
		      hOut[135] = -18'sd123;
		   2'd1: 
		      hOut[135] = -18'sd41;
		   2'd2: 
		      hOut[135] = 18'sd41;
		   2'd3: 
		      hOut[135] = 18'sd123;
		endcase
	else
		hOut[135] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[136])
		   2'd0: 
		      hOut[136] = -18'sd79;
		   2'd1: 
		      hOut[136] = -18'sd26;
		   2'd2: 
		      hOut[136] = 18'sd26;
		   2'd3: 
		      hOut[136] = 18'sd79;
		endcase
	else
		hOut[136] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[137])
		   2'd0: 
		      hOut[137] = 18'sd17;
		   2'd1: 
		      hOut[137] = 18'sd6;
		   2'd2: 
		      hOut[137] = -18'sd6;
		   2'd3: 
		      hOut[137] = -18'sd17;
		endcase
	else
		hOut[137] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[138])
		   2'd0: 
		      hOut[138] = 18'sd93;
		   2'd1: 
		      hOut[138] = 18'sd31;
		   2'd2: 
		      hOut[138] = -18'sd31;
		   2'd3: 
		      hOut[138] = -18'sd93;
		endcase
	else
		hOut[138] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[139])
		   2'd0: 
		      hOut[139] = 18'sd98;
		   2'd1: 
		      hOut[139] = 18'sd33;
		   2'd2: 
		      hOut[139] = -18'sd33;
		   2'd3: 
		      hOut[139] = -18'sd98;
		endcase
	else
		hOut[139] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[140])
		   2'd0: 
		      hOut[140] = 18'sd34;
		   2'd1: 
		      hOut[140] = 18'sd11;
		   2'd2: 
		      hOut[140] = -18'sd11;
		   2'd3: 
		      hOut[140] = -18'sd34;
		endcase
	else
		hOut[140] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[141])
		   2'd0: 
		      hOut[141] = -18'sd49;
		   2'd1: 
		      hOut[141] = -18'sd16;
		   2'd2: 
		      hOut[141] = 18'sd16;
		   2'd3: 
		      hOut[141] = 18'sd49;
		endcase
	else
		hOut[141] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[142])
		   2'd0: 
		      hOut[142] = -18'sd94;
		   2'd1: 
		      hOut[142] = -18'sd31;
		   2'd2: 
		      hOut[142] = 18'sd31;
		   2'd3: 
		      hOut[142] = 18'sd94;
		endcase
	else
		hOut[142] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[143])
		   2'd0: 
		      hOut[143] = -18'sd71;
		   2'd1: 
		      hOut[143] = -18'sd24;
		   2'd2: 
		      hOut[143] = 18'sd24;
		   2'd3: 
		      hOut[143] = 18'sd71;
		endcase
	else
		hOut[143] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[144])
		   2'd0: 
		      hOut[144] = -18'sd2;
		   2'd1: 
		      hOut[144] = -18'sd1;
		   2'd2: 
		      hOut[144] = 18'sd1;
		   2'd3: 
		      hOut[144] = 18'sd2;
		endcase
	else
		hOut[144] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[145])
		   2'd0: 
		      hOut[145] = 18'sd65;
		   2'd1: 
		      hOut[145] = 18'sd22;
		   2'd2: 
		      hOut[145] = -18'sd22;
		   2'd3: 
		      hOut[145] = -18'sd65;
		endcase
	else
		hOut[145] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[146])
		   2'd0: 
		      hOut[146] = 18'sd84;
		   2'd1: 
		      hOut[146] = 18'sd28;
		   2'd2: 
		      hOut[146] = -18'sd28;
		   2'd3: 
		      hOut[146] = -18'sd84;
		endcase
	else
		hOut[146] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[147])
		   2'd0: 
		      hOut[147] = 18'sd46;
		   2'd1: 
		      hOut[147] = 18'sd15;
		   2'd2: 
		      hOut[147] = -18'sd15;
		   2'd3: 
		      hOut[147] = -18'sd46;
		endcase
	else
		hOut[147] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[148])
		   2'd0: 
		      hOut[148] = -18'sd20;
		   2'd1: 
		      hOut[148] = -18'sd7;
		   2'd2: 
		      hOut[148] = 18'sd7;
		   2'd3: 
		      hOut[148] = 18'sd20;
		endcase
	else
		hOut[148] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[149])
		   2'd0: 
		      hOut[149] = -18'sd68;
		   2'd1: 
		      hOut[149] = -18'sd23;
		   2'd2: 
		      hOut[149] = 18'sd23;
		   2'd3: 
		      hOut[149] = 18'sd68;
		endcase
	else
		hOut[149] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[150])
		   2'd0: 
		      hOut[150] = -18'sd69;
		   2'd1: 
		      hOut[150] = -18'sd23;
		   2'd2: 
		      hOut[150] = 18'sd23;
		   2'd3: 
		      hOut[150] = 18'sd69;
		endcase
	else
		hOut[150] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[151])
		   2'd0: 
		      hOut[151] = -18'sd25;
		   2'd1: 
		      hOut[151] = -18'sd8;
		   2'd2: 
		      hOut[151] = 18'sd8;
		   2'd3: 
		      hOut[151] = 18'sd25;
		endcase
	else
		hOut[151] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[152])
		   2'd0: 
		      hOut[152] = 18'sd31;
		   2'd1: 
		      hOut[152] = 18'sd10;
		   2'd2: 
		      hOut[152] = -18'sd10;
		   2'd3: 
		      hOut[152] = -18'sd31;
		endcase
	else
		hOut[152] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[153])
		   2'd0: 
		      hOut[153] = 18'sd63;
		   2'd1: 
		      hOut[153] = 18'sd21;
		   2'd2: 
		      hOut[153] = -18'sd21;
		   2'd3: 
		      hOut[153] = -18'sd63;
		endcase
	else
		hOut[153] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[154])
		   2'd0: 
		      hOut[154] = 18'sd52;
		   2'd1: 
		      hOut[154] = 18'sd17;
		   2'd2: 
		      hOut[154] = -18'sd17;
		   2'd3: 
		      hOut[154] = -18'sd52;
		endcase
	else
		hOut[154] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[155])
		   2'd0: 
		      hOut[155] = 18'sd9;
		   2'd1: 
		      hOut[155] = 18'sd3;
		   2'd2: 
		      hOut[155] = -18'sd3;
		   2'd3: 
		      hOut[155] = -18'sd9;
		endcase
	else
		hOut[155] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[156])
		   2'd0: 
		      hOut[156] = -18'sd36;
		   2'd1: 
		      hOut[156] = -18'sd12;
		   2'd2: 
		      hOut[156] = 18'sd12;
		   2'd3: 
		      hOut[156] = 18'sd36;
		endcase
	else
		hOut[156] = 18'sd0;

always @ *
	if( counter == 2'd1 )
		case(xDelay[157])
		   2'd0: 
		      hOut[157] = -18'sd53;
		   2'd1: 
		      hOut[157] = -18'sd18;
		   2'd2: 
		      hOut[157] = 18'sd18;
		   2'd3: 
		      hOut[157] = 18'sd53;
		endcase
	else
		hOut[157] = 18'sd0;

always @ *
	if( counter == 2'd2 )
		case(xDelay[158])
		   2'd0: 
		      hOut[158] = -18'sd35;
		   2'd1: 
		      hOut[158] = -18'sd12;
		   2'd2: 
		      hOut[158] = 18'sd12;
		   2'd3: 
		      hOut[158] = 18'sd35;
		endcase
	else
		hOut[158] = 18'sd0;

always @ *
	if( counter == 2'd3 )
		case(xDelay[159])
		   2'd0: 
		      hOut[159] = 18'sd3;
		   2'd1: 
		      hOut[159] = 18'sd1;
		   2'd2: 
		      hOut[159] = -18'sd1;
		   2'd3: 
		      hOut[159] = -18'sd3;
		endcase
	else
		hOut[159] = 18'sd0;

always @ *
	if( counter == 2'd0 )
		case(xDelay[160])
		   2'd0: 
		      hOut[160] = 18'sd35;
		   2'd1: 
		      hOut[160] = 18'sd12;
		   2'd2: 
		      hOut[160] = -18'sd12;
		   2'd3: 
		      hOut[160] = -18'sd35;
		endcase
	else
		hOut[160] = 18'sd0;







//**********************************		 
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0; i<=79; i=i+1)
			sumLevel1[i] = hOut[i] + hOut[160-i];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel1[80] = hOut[80];
//**********************************
	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0; i<=39; i=i+1)
			sumLevel2[i] = sumLevel1[2*i] + sumLevel1[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel2[40] = sumLevel1[80];
	
//**********************************		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0; i<=19; i=i+1)
			sumLevel3[i] = sumLevel2[2*i] + sumLevel2[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel3[20] = sumLevel2[40];
	
//**********************************		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0; i<=9; i=i+1)
			sumLevel4[i] = sumLevel3[2*i] + sumLevel3[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel4[10] = sumLevel3[20];
	
//**********************************			
always @ (posedge sys_clk)
	if(sam_clk_ena) 
		for(i=0; i<=4; i=i+1)
			sumLevel5[i] = sumLevel4[2*i] + sumLevel4[2*i+1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel5[5] = sumLevel4[10];
	
//**********************************	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		for(i=0; i<=1; i=i+1)
			sumLevel6[i] = sumLevel5[2*i] + sumLevel5[2*i+1];	
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel6[2] = sumLevel5[5];
	
	
//**********************************	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel7[0] = sumLevel6[0] + sumLevel6[2];
	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel7[1] = sumLevel6[1];
//**********************************	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		sumLevel8 = sumLevel7[0] + sumLevel7[1];
	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		y = sumLevel8;
	
endmodule