module GoldStandardPulse(
         input sys_clk,
			input sam_clk_ena,
			input sym_clk_ena,
		   input signed [1:0] x_in,
		   output reg signed [17:0] y   );

integer i;			
reg [17:0] hOut[0:128];
reg [1:0] xDelay [0:128];
reg [17:0] sumLevel1 [0:64];
reg [17:0] sumLevel2 [0:32];
reg [17:0] sumLevel3 [0:16];
reg [17:0] sumLevel4 [0:8];
reg [17:0] sumLevel5 [0:4];
reg [17:0] sumLevel6 [0:2];
reg [17:0] sumLevel7;


reg [1:0] counter;

always @ (posedge sys_clk)
	if(sam_clk_ena)
		counter <= counter + 2'd1;

always @ (posedge sys_clk)
	if(sam_clk_ena)
		xDelay[0] <= x_in;
		
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		begin
			for(i=1;i<=128; i=i+1)
				xDelay[i] <= xDelay[i-1];
		end

always @ * 
	if( counter == 2'd0 )
		case(xDelay[0])
		   2'd0: 
		      hOut[0] = 18'sd129;
		   2'd1: 
		      hOut[0] = 18'sd43;
		   2'd2: 
		      hOut[0] = -18'sd43;
		   2'd3: 
		      hOut[0] = -18'sd129;
		endcase
	else
		hOut[0] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[1])
		   2'd0: 
		      hOut[1] = 18'sd49;
		   2'd1: 
		      hOut[1] = 18'sd16;
		   2'd2: 
		      hOut[1] = -18'sd16;
		   2'd3: 
		      hOut[1] = -18'sd49;
		endcase
	else
		hOut[1] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[2])
		   2'd0: 
		      hOut[2] = -18'sd75;
		   2'd1: 
		      hOut[2] = -18'sd25;
		   2'd2: 
		      hOut[2] = 18'sd25;
		   2'd3: 
		      hOut[2] = 18'sd75;
		endcase
	else
		hOut[2] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[3])
		   2'd0: 
		      hOut[3] = -18'sd157;
		   2'd1: 
		      hOut[3] = -18'sd52;
		   2'd2: 
		      hOut[3] = 18'sd52;
		   2'd3: 
		      hOut[3] = 18'sd157;
		endcase
	else
		hOut[3] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[4])
		   2'd0: 
		      hOut[4] = -18'sd131;
		   2'd1: 
		      hOut[4] = -18'sd44;
		   2'd2: 
		      hOut[4] = 18'sd44;
		   2'd3: 
		      hOut[4] = 18'sd131;
		endcase
	else
		hOut[4] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[5])
		   2'd0: 
		      hOut[5] = -18'sd8;
		   2'd1: 
		      hOut[5] = -18'sd3;
		   2'd2: 
		      hOut[5] = 18'sd3;
		   2'd3: 
		      hOut[5] = 18'sd8;
		endcase
	else
		hOut[5] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[6])
		   2'd0: 
		      hOut[6] = 18'sd131;
		   2'd1: 
		      hOut[6] = 18'sd44;
		   2'd2: 
		      hOut[6] = -18'sd44;
		   2'd3: 
		      hOut[6] = -18'sd131;
		endcase
	else
		hOut[6] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[7])
		   2'd0: 
		      hOut[7] = 18'sd186;
		   2'd1: 
		      hOut[7] = 18'sd62;
		   2'd2: 
		      hOut[7] = -18'sd62;
		   2'd3: 
		      hOut[7] = -18'sd186;
		endcase
	else
		hOut[7] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[8])
		   2'd0: 
		      hOut[8] = 18'sd112;
		   2'd1: 
		      hOut[8] = 18'sd37;
		   2'd2: 
		      hOut[8] = -18'sd37;
		   2'd3: 
		      hOut[8] = -18'sd112;
		endcase
	else
		hOut[8] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[9])
		   2'd0: 
		      hOut[9] = -18'sd46;
		   2'd1: 
		      hOut[9] = -18'sd15;
		   2'd2: 
		      hOut[9] = 18'sd15;
		   2'd3: 
		      hOut[9] = 18'sd46;
		endcase
	else
		hOut[9] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[10])
		   2'd0: 
		      hOut[10] = -18'sd180;
		   2'd1: 
		      hOut[10] = -18'sd60;
		   2'd2: 
		      hOut[10] = 18'sd60;
		   2'd3: 
		      hOut[10] = 18'sd180;
		endcase
	else
		hOut[10] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[11])
		   2'd0: 
		      hOut[11] = -18'sd193;
		   2'd1: 
		      hOut[11] = -18'sd64;
		   2'd2: 
		      hOut[11] = 18'sd64;
		   2'd3: 
		      hOut[11] = 18'sd193;
		endcase
	else
		hOut[11] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[12])
		   2'd0: 
		      hOut[12] = -18'sd68;
		   2'd1: 
		      hOut[12] = -18'sd23;
		   2'd2: 
		      hOut[12] = 18'sd23;
		   2'd3: 
		      hOut[12] = 18'sd68;
		endcase
	else
		hOut[12] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[13])
		   2'd0: 
		      hOut[13] = 18'sd110;
		   2'd1: 
		      hOut[13] = 18'sd37;
		   2'd2: 
		      hOut[13] = -18'sd37;
		   2'd3: 
		      hOut[13] = -18'sd110;
		endcase
	else
		hOut[13] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[14])
		   2'd0: 
		      hOut[14] = 18'sd214;
		   2'd1: 
		      hOut[14] = 18'sd71;
		   2'd2: 
		      hOut[14] = -18'sd71;
		   2'd3: 
		      hOut[14] = -18'sd214;
		endcase
	else
		hOut[14] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[15])
		   2'd0: 
		      hOut[15] = 18'sd166;
		   2'd1: 
		      hOut[15] = 18'sd55;
		   2'd2: 
		      hOut[15] = -18'sd55;
		   2'd3: 
		      hOut[15] = -18'sd166;
		endcase
	else
		hOut[15] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[16])
		   2'd0: 
		      hOut[16] = -18'sd4;
		   2'd1: 
		      hOut[16] = -18'sd1;
		   2'd2: 
		      hOut[16] = 18'sd1;
		   2'd3: 
		      hOut[16] = 18'sd4;
		endcase
	else
		hOut[16] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[17])
		   2'd0: 
		      hOut[17] = -18'sd175;
		   2'd1: 
		      hOut[17] = -18'sd58;
		   2'd2: 
		      hOut[17] = 18'sd58;
		   2'd3: 
		      hOut[17] = 18'sd175;
		endcase
	else
		hOut[17] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[18])
		   2'd0: 
		      hOut[18] = -18'sd219;
		   2'd1: 
		      hOut[18] = -18'sd73;
		   2'd2: 
		      hOut[18] = 18'sd73;
		   2'd3: 
		      hOut[18] = 18'sd219;
		endcase
	else
		hOut[18] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[19])
		   2'd0: 
		      hOut[19] = -18'sd97;
		   2'd1: 
		      hOut[19] = -18'sd32;
		   2'd2: 
		      hOut[19] = 18'sd32;
		   2'd3: 
		      hOut[19] = 18'sd97;
		endcase
	else
		hOut[19] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[20])
		   2'd0: 
		      hOut[20] = 18'sd105;
		   2'd1: 
		      hOut[20] = 18'sd35;
		   2'd2: 
		      hOut[20] = -18'sd35;
		   2'd3: 
		      hOut[20] = -18'sd105;
		endcase
	else
		hOut[20] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[21])
		   2'd0: 
		      hOut[21] = 18'sd234;
		   2'd1: 
		      hOut[21] = 18'sd78;
		   2'd2: 
		      hOut[21] = -18'sd78;
		   2'd3: 
		      hOut[21] = -18'sd234;
		endcase
	else
		hOut[21] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[22])
		   2'd0: 
		      hOut[22] = 18'sd182;
		   2'd1: 
		      hOut[22] = 18'sd61;
		   2'd2: 
		      hOut[22] = -18'sd61;
		   2'd3: 
		      hOut[22] = -18'sd182;
		endcase
	else
		hOut[22] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[23])
		   2'd0: 
		      hOut[23] = -18'sd24;
		   2'd1: 
		      hOut[23] = -18'sd8;
		   2'd2: 
		      hOut[23] = 18'sd8;
		   2'd3: 
		      hOut[23] = 18'sd24;
		endcase
	else
		hOut[23] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[24])
		   2'd0: 
		      hOut[24] = -18'sd233;
		   2'd1: 
		      hOut[24] = -18'sd78;
		   2'd2: 
		      hOut[24] = 18'sd78;
		   2'd3: 
		      hOut[24] = 18'sd233;
		endcase
	else
		hOut[24] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[25])
		   2'd0: 
		      hOut[25] = -18'sd273;
		   2'd1: 
		      hOut[25] = -18'sd91;
		   2'd2: 
		      hOut[25] = 18'sd91;
		   2'd3: 
		      hOut[25] = 18'sd273;
		endcase
	else
		hOut[25] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[26])
		   2'd0: 
		      hOut[26] = -18'sd86;
		   2'd1: 
		      hOut[26] = -18'sd29;
		   2'd2: 
		      hOut[26] = 18'sd29;
		   2'd3: 
		      hOut[26] = 18'sd86;
		endcase
	else
		hOut[26] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[27])
		   2'd0: 
		      hOut[27] = 18'sd209;
		   2'd1: 
		      hOut[27] = 18'sd70;
		   2'd2: 
		      hOut[27] = -18'sd70;
		   2'd3: 
		      hOut[27] = -18'sd209;
		endcase
	else
		hOut[27] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[28])
		   2'd0: 
		      hOut[28] = 18'sd387;
		   2'd1: 
		      hOut[28] = 18'sd129;
		   2'd2: 
		      hOut[28] = -18'sd129;
		   2'd3: 
		      hOut[28] = -18'sd387;
		endcase
	else
		hOut[28] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[29])
		   2'd0: 
		      hOut[29] = 18'sd278;
		   2'd1: 
		      hOut[29] = 18'sd93;
		   2'd2: 
		      hOut[29] = -18'sd93;
		   2'd3: 
		      hOut[29] = -18'sd278;
		endcase
	else
		hOut[29] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[30])
		   2'd0: 
		      hOut[30] = -18'sd87;
		   2'd1: 
		      hOut[30] = -18'sd29;
		   2'd2: 
		      hOut[30] = 18'sd29;
		   2'd3: 
		      hOut[30] = 18'sd87;
		endcase
	else
		hOut[30] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[31])
		   2'd0: 
		      hOut[31] = -18'sd466;
		   2'd1: 
		      hOut[31] = -18'sd155;
		   2'd2: 
		      hOut[31] = 18'sd155;
		   2'd3: 
		      hOut[31] = 18'sd466;
		endcase
	else
		hOut[31] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[32])
		   2'd0: 
		      hOut[32] = -18'sd559;
		   2'd1: 
		      hOut[32] = -18'sd186;
		   2'd2: 
		      hOut[32] = 18'sd186;
		   2'd3: 
		      hOut[32] = 18'sd559;
		endcase
	else
		hOut[32] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[33])
		   2'd0: 
		      hOut[33] = -18'sd229;
		   2'd1: 
		      hOut[33] = -18'sd76;
		   2'd2: 
		      hOut[33] = 18'sd76;
		   2'd3: 
		      hOut[33] = 18'sd229;
		endcase
	else
		hOut[33] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[34])
		   2'd0: 
		      hOut[34] = 18'sd359;
		   2'd1: 
		      hOut[34] = 18'sd120;
		   2'd2: 
		      hOut[34] = -18'sd120;
		   2'd3: 
		      hOut[34] = -18'sd359;
		endcase
	else
		hOut[34] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[35])
		   2'd0: 
		      hOut[35] = 18'sd807;
		   2'd1: 
		      hOut[35] = 18'sd269;
		   2'd2: 
		      hOut[35] = -18'sd269;
		   2'd3: 
		      hOut[35] = -18'sd807;
		endcase
	else
		hOut[35] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[36])
		   2'd0: 
		      hOut[36] = 18'sd743;
		   2'd1: 
		      hOut[36] = 18'sd248;
		   2'd2: 
		      hOut[36] = -18'sd248;
		   2'd3: 
		      hOut[36] = -18'sd743;
		endcase
	else
		hOut[36] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[37])
		   2'd0: 
		      hOut[37] = 18'sd102;
		   2'd1: 
		      hOut[37] = 18'sd34;
		   2'd2: 
		      hOut[37] = -18'sd34;
		   2'd3: 
		      hOut[37] = -18'sd102;
		endcase
	else
		hOut[37] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[38])
		   2'd0: 
		      hOut[38] = -18'sd759;
		   2'd1: 
		      hOut[38] = -18'sd253;
		   2'd2: 
		      hOut[38] = 18'sd253;
		   2'd3: 
		      hOut[38] = 18'sd759;
		endcase
	else
		hOut[38] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[39])
		   2'd0: 
		      hOut[39] = -18'sd1249;
		   2'd1: 
		      hOut[39] = -18'sd416;
		   2'd2: 
		      hOut[39] = 18'sd416;
		   2'd3: 
		      hOut[39] = 18'sd1249;
		endcase
	else
		hOut[39] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[40])
		   2'd0: 
		      hOut[40] = -18'sd930;
		   2'd1: 
		      hOut[40] = -18'sd310;
		   2'd2: 
		      hOut[40] = 18'sd310;
		   2'd3: 
		      hOut[40] = 18'sd930;
		endcase
	else
		hOut[40] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[41])
		   2'd0: 
		      hOut[41] = 18'sd135;
		   2'd1: 
		      hOut[41] = 18'sd45;
		   2'd2: 
		      hOut[41] = -18'sd45;
		   2'd3: 
		      hOut[41] = -18'sd135;
		endcase
	else
		hOut[41] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[42])
		   2'd0: 
		      hOut[42] = 18'sd1329;
		   2'd1: 
		      hOut[42] = 18'sd443;
		   2'd2: 
		      hOut[42] = -18'sd443;
		   2'd3: 
		      hOut[42] = -18'sd1329;
		endcase
	else
		hOut[42] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[43])
		   2'd0: 
		      hOut[43] = 18'sd1819;
		   2'd1: 
		      hOut[43] = 18'sd606;
		   2'd2: 
		      hOut[43] = -18'sd606;
		   2'd3: 
		      hOut[43] = -18'sd1819;
		endcase
	else
		hOut[43] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[44])
		   2'd0: 
		      hOut[44] = 18'sd1111;
		   2'd1: 
		      hOut[44] = 18'sd370;
		   2'd2: 
		      hOut[44] = -18'sd370;
		   2'd3: 
		      hOut[44] = -18'sd1111;
		endcase
	else
		hOut[44] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[45])
		   2'd0: 
		      hOut[45] = -18'sd537;
		   2'd1: 
		      hOut[45] = -18'sd179;
		   2'd2: 
		      hOut[45] = 18'sd179;
		   2'd3: 
		      hOut[45] = 18'sd537;
		endcase
	else
		hOut[45] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[46])
		   2'd0: 
		      hOut[46] = -18'sd2147;
		   2'd1: 
		      hOut[46] = -18'sd716;
		   2'd2: 
		      hOut[46] = 18'sd716;
		   2'd3: 
		      hOut[46] = 18'sd2147;
		endcase
	else
		hOut[46] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[47])
		   2'd0: 
		      hOut[47] = -18'sd2575;
		   2'd1: 
		      hOut[47] = -18'sd858;
		   2'd2: 
		      hOut[47] = 18'sd858;
		   2'd3: 
		      hOut[47] = 18'sd2575;
		endcase
	else
		hOut[47] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[48])
		   2'd0: 
		      hOut[48] = -18'sd1275;
		   2'd1: 
		      hOut[48] = -18'sd425;
		   2'd2: 
		      hOut[48] = 18'sd425;
		   2'd3: 
		      hOut[48] = 18'sd1275;
		endcase
	else
		hOut[48] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[49])
		   2'd0: 
		      hOut[49] = 18'sd1203;
		   2'd1: 
		      hOut[49] = 18'sd401;
		   2'd2: 
		      hOut[49] = -18'sd401;
		   2'd3: 
		      hOut[49] = -18'sd1203;
		endcase
	else
		hOut[49] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[50])
		   2'd0: 
		      hOut[50] = 18'sd3375;
		   2'd1: 
		      hOut[50] = 18'sd1125;
		   2'd2: 
		      hOut[50] = -18'sd1125;
		   2'd3: 
		      hOut[50] = -18'sd3375;
		endcase
	else
		hOut[50] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[51])
		   2'd0: 
		      hOut[51] = 18'sd3653;
		   2'd1: 
		      hOut[51] = 18'sd1218;
		   2'd2: 
		      hOut[51] = -18'sd1218;
		   2'd3: 
		      hOut[51] = -18'sd3653;
		endcase
	else
		hOut[51] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[52])
		   2'd0: 
		      hOut[52] = 18'sd1414;
		   2'd1: 
		      hOut[52] = 18'sd471;
		   2'd2: 
		      hOut[52] = -18'sd471;
		   2'd3: 
		      hOut[52] = -18'sd1414;
		endcase
	else
		hOut[52] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[53])
		   2'd0: 
		      hOut[53] = -18'sd2370;
		   2'd1: 
		      hOut[53] = -18'sd790;
		   2'd2: 
		      hOut[53] = 18'sd790;
		   2'd3: 
		      hOut[53] = 18'sd2370;
		endcase
	else
		hOut[53] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[54])
		   2'd0: 
		      hOut[54] = -18'sd5437;
		   2'd1: 
		      hOut[54] = -18'sd1812;
		   2'd2: 
		      hOut[54] = 18'sd1812;
		   2'd3: 
		      hOut[54] = 18'sd5437;
		endcase
	else
		hOut[54] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[55])
		   2'd0: 
		      hOut[55] = -18'sd5447;
		   2'd1: 
		      hOut[55] = -18'sd1816;
		   2'd2: 
		      hOut[55] = 18'sd1816;
		   2'd3: 
		      hOut[55] = 18'sd5447;
		endcase
	else
		hOut[55] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[56])
		   2'd0: 
		      hOut[56] = -18'sd1520;
		   2'd1: 
		      hOut[56] = -18'sd507;
		   2'd2: 
		      hOut[56] = 18'sd507;
		   2'd3: 
		      hOut[56] = 18'sd1520;
		endcase
	else
		hOut[56] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[57])
		   2'd0: 
		      hOut[57] = 18'sd4811;
		   2'd1: 
		      hOut[57] = 18'sd1604;
		   2'd2: 
		      hOut[57] = -18'sd1604;
		   2'd3: 
		      hOut[57] = -18'sd4811;
		endcase
	else
		hOut[57] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[58])
		   2'd0: 
		      hOut[58] = 18'sd9911;
		   2'd1: 
		      hOut[58] = 18'sd3304;
		   2'd2: 
		      hOut[58] = -18'sd3304;
		   2'd3: 
		      hOut[58] = -18'sd9911;
		endcase
	else
		hOut[58] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[59])
		   2'd0: 
		      hOut[59] = 18'sd9650;
		   2'd1: 
		      hOut[59] = 18'sd3217;
		   2'd2: 
		      hOut[59] = -18'sd3217;
		   2'd3: 
		      hOut[59] = -18'sd9650;
		endcase
	else
		hOut[59] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[60])
		   2'd0: 
		      hOut[60] = 18'sd1586;
		   2'd1: 
		      hOut[60] = 18'sd529;
		   2'd2: 
		      hOut[60] = -18'sd529;
		   2'd3: 
		      hOut[60] = -18'sd1586;
		endcase
	else
		hOut[60] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[61])
		   2'd0: 
		      hOut[61] = -18'sd13414;
		   2'd1: 
		      hOut[61] = -18'sd4471;
		   2'd2: 
		      hOut[61] = 18'sd4471;
		   2'd3: 
		      hOut[61] = 18'sd13414;
		endcase
	else
		hOut[61] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[62])
		   2'd0: 
		      hOut[62] = -18'sd31060;
		   2'd1: 
		      hOut[62] = -18'sd10353;
		   2'd2: 
		      hOut[62] = 18'sd10353;
		   2'd3: 
		      hOut[62] = 18'sd31060;
		endcase
	else
		hOut[62] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[63])
		   2'd0: 
		      hOut[63] = -18'sd45240;
		   2'd1: 
		      hOut[63] = -18'sd15080;
		   2'd2: 
		      hOut[63] = 18'sd15080;
		   2'd3: 
		      hOut[63] = 18'sd45240;
		endcase
	else
		hOut[63] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[64])
		   2'd0: 
		      hOut[64] = -18'sd50662;
		   2'd1: 
		      hOut[64] = -18'sd16887;
		   2'd2: 
		      hOut[64] = 18'sd16887;
		   2'd3: 
		      hOut[64] = 18'sd50662;
		endcase
	else
		hOut[64] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[65])
		   2'd0: 
		      hOut[65] = -18'sd45240;
		   2'd1: 
		      hOut[65] = -18'sd15080;
		   2'd2: 
		      hOut[65] = 18'sd15080;
		   2'd3: 
		      hOut[65] = 18'sd45240;
		endcase
	else
		hOut[65] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[66])
		   2'd0: 
		      hOut[66] = -18'sd31060;
		   2'd1: 
		      hOut[66] = -18'sd10353;
		   2'd2: 
		      hOut[66] = 18'sd10353;
		   2'd3: 
		      hOut[66] = 18'sd31060;
		endcase
	else
		hOut[66] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[67])
		   2'd0: 
		      hOut[67] = -18'sd13414;
		   2'd1: 
		      hOut[67] = -18'sd4471;
		   2'd2: 
		      hOut[67] = 18'sd4471;
		   2'd3: 
		      hOut[67] = 18'sd13414;
		endcase
	else
		hOut[67] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[68])
		   2'd0: 
		      hOut[68] = 18'sd1586;
		   2'd1: 
		      hOut[68] = 18'sd529;
		   2'd2: 
		      hOut[68] = -18'sd529;
		   2'd3: 
		      hOut[68] = -18'sd1586;
		endcase
	else
		hOut[68] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[69])
		   2'd0: 
		      hOut[69] = 18'sd9650;
		   2'd1: 
		      hOut[69] = 18'sd3217;
		   2'd2: 
		      hOut[69] = -18'sd3217;
		   2'd3: 
		      hOut[69] = -18'sd9650;
		endcase
	else
		hOut[69] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[70])
		   2'd0: 
		      hOut[70] = 18'sd9911;
		   2'd1: 
		      hOut[70] = 18'sd3304;
		   2'd2: 
		      hOut[70] = -18'sd3304;
		   2'd3: 
		      hOut[70] = -18'sd9911;
		endcase
	else
		hOut[70] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[71])
		   2'd0: 
		      hOut[71] = 18'sd4811;
		   2'd1: 
		      hOut[71] = 18'sd1604;
		   2'd2: 
		      hOut[71] = -18'sd1604;
		   2'd3: 
		      hOut[71] = -18'sd4811;
		endcase
	else
		hOut[71] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[72])
		   2'd0: 
		      hOut[72] = -18'sd1520;
		   2'd1: 
		      hOut[72] = -18'sd507;
		   2'd2: 
		      hOut[72] = 18'sd507;
		   2'd3: 
		      hOut[72] = 18'sd1520;
		endcase
	else
		hOut[72] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[73])
		   2'd0: 
		      hOut[73] = -18'sd5447;
		   2'd1: 
		      hOut[73] = -18'sd1816;
		   2'd2: 
		      hOut[73] = 18'sd1816;
		   2'd3: 
		      hOut[73] = 18'sd5447;
		endcase
	else
		hOut[73] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[74])
		   2'd0: 
		      hOut[74] = -18'sd5437;
		   2'd1: 
		      hOut[74] = -18'sd1812;
		   2'd2: 
		      hOut[74] = 18'sd1812;
		   2'd3: 
		      hOut[74] = 18'sd5437;
		endcase
	else
		hOut[74] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[75])
		   2'd0: 
		      hOut[75] = -18'sd2370;
		   2'd1: 
		      hOut[75] = -18'sd790;
		   2'd2: 
		      hOut[75] = 18'sd790;
		   2'd3: 
		      hOut[75] = 18'sd2370;
		endcase
	else
		hOut[75] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[76])
		   2'd0: 
		      hOut[76] = 18'sd1414;
		   2'd1: 
		      hOut[76] = 18'sd471;
		   2'd2: 
		      hOut[76] = -18'sd471;
		   2'd3: 
		      hOut[76] = -18'sd1414;
		endcase
	else
		hOut[76] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[77])
		   2'd0: 
		      hOut[77] = 18'sd3653;
		   2'd1: 
		      hOut[77] = 18'sd1218;
		   2'd2: 
		      hOut[77] = -18'sd1218;
		   2'd3: 
		      hOut[77] = -18'sd3653;
		endcase
	else
		hOut[77] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[78])
		   2'd0: 
		      hOut[78] = 18'sd3375;
		   2'd1: 
		      hOut[78] = 18'sd1125;
		   2'd2: 
		      hOut[78] = -18'sd1125;
		   2'd3: 
		      hOut[78] = -18'sd3375;
		endcase
	else
		hOut[78] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[79])
		   2'd0: 
		      hOut[79] = 18'sd1203;
		   2'd1: 
		      hOut[79] = 18'sd401;
		   2'd2: 
		      hOut[79] = -18'sd401;
		   2'd3: 
		      hOut[79] = -18'sd1203;
		endcase
	else
		hOut[79] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[80])
		   2'd0: 
		      hOut[80] = -18'sd1275;
		   2'd1: 
		      hOut[80] = -18'sd425;
		   2'd2: 
		      hOut[80] = 18'sd425;
		   2'd3: 
		      hOut[80] = 18'sd1275;
		endcase
	else
		hOut[80] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[81])
		   2'd0: 
		      hOut[81] = -18'sd2575;
		   2'd1: 
		      hOut[81] = -18'sd858;
		   2'd2: 
		      hOut[81] = 18'sd858;
		   2'd3: 
		      hOut[81] = 18'sd2575;
		endcase
	else
		hOut[81] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[82])
		   2'd0: 
		      hOut[82] = -18'sd2147;
		   2'd1: 
		      hOut[82] = -18'sd716;
		   2'd2: 
		      hOut[82] = 18'sd716;
		   2'd3: 
		      hOut[82] = 18'sd2147;
		endcase
	else
		hOut[82] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[83])
		   2'd0: 
		      hOut[83] = -18'sd537;
		   2'd1: 
		      hOut[83] = -18'sd179;
		   2'd2: 
		      hOut[83] = 18'sd179;
		   2'd3: 
		      hOut[83] = 18'sd537;
		endcase
	else
		hOut[83] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[84])
		   2'd0: 
		      hOut[84] = 18'sd1111;
		   2'd1: 
		      hOut[84] = 18'sd370;
		   2'd2: 
		      hOut[84] = -18'sd370;
		   2'd3: 
		      hOut[84] = -18'sd1111;
		endcase
	else
		hOut[84] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[85])
		   2'd0: 
		      hOut[85] = 18'sd1819;
		   2'd1: 
		      hOut[85] = 18'sd606;
		   2'd2: 
		      hOut[85] = -18'sd606;
		   2'd3: 
		      hOut[85] = -18'sd1819;
		endcase
	else
		hOut[85] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[86])
		   2'd0: 
		      hOut[86] = 18'sd1329;
		   2'd1: 
		      hOut[86] = 18'sd443;
		   2'd2: 
		      hOut[86] = -18'sd443;
		   2'd3: 
		      hOut[86] = -18'sd1329;
		endcase
	else
		hOut[86] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[87])
		   2'd0: 
		      hOut[87] = 18'sd135;
		   2'd1: 
		      hOut[87] = 18'sd45;
		   2'd2: 
		      hOut[87] = -18'sd45;
		   2'd3: 
		      hOut[87] = -18'sd135;
		endcase
	else
		hOut[87] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[88])
		   2'd0: 
		      hOut[88] = -18'sd930;
		   2'd1: 
		      hOut[88] = -18'sd310;
		   2'd2: 
		      hOut[88] = 18'sd310;
		   2'd3: 
		      hOut[88] = 18'sd930;
		endcase
	else
		hOut[88] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[89])
		   2'd0: 
		      hOut[89] = -18'sd1249;
		   2'd1: 
		      hOut[89] = -18'sd416;
		   2'd2: 
		      hOut[89] = 18'sd416;
		   2'd3: 
		      hOut[89] = 18'sd1249;
		endcase
	else
		hOut[89] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[90])
		   2'd0: 
		      hOut[90] = -18'sd759;
		   2'd1: 
		      hOut[90] = -18'sd253;
		   2'd2: 
		      hOut[90] = 18'sd253;
		   2'd3: 
		      hOut[90] = 18'sd759;
		endcase
	else
		hOut[90] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[91])
		   2'd0: 
		      hOut[91] = 18'sd102;
		   2'd1: 
		      hOut[91] = 18'sd34;
		   2'd2: 
		      hOut[91] = -18'sd34;
		   2'd3: 
		      hOut[91] = -18'sd102;
		endcase
	else
		hOut[91] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[92])
		   2'd0: 
		      hOut[92] = 18'sd743;
		   2'd1: 
		      hOut[92] = 18'sd248;
		   2'd2: 
		      hOut[92] = -18'sd248;
		   2'd3: 
		      hOut[92] = -18'sd743;
		endcase
	else
		hOut[92] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[93])
		   2'd0: 
		      hOut[93] = 18'sd807;
		   2'd1: 
		      hOut[93] = 18'sd269;
		   2'd2: 
		      hOut[93] = -18'sd269;
		   2'd3: 
		      hOut[93] = -18'sd807;
		endcase
	else
		hOut[93] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[94])
		   2'd0: 
		      hOut[94] = 18'sd359;
		   2'd1: 
		      hOut[94] = 18'sd120;
		   2'd2: 
		      hOut[94] = -18'sd120;
		   2'd3: 
		      hOut[94] = -18'sd359;
		endcase
	else
		hOut[94] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[95])
		   2'd0: 
		      hOut[95] = -18'sd229;
		   2'd1: 
		      hOut[95] = -18'sd76;
		   2'd2: 
		      hOut[95] = 18'sd76;
		   2'd3: 
		      hOut[95] = 18'sd229;
		endcase
	else
		hOut[95] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[96])
		   2'd0: 
		      hOut[96] = -18'sd559;
		   2'd1: 
		      hOut[96] = -18'sd186;
		   2'd2: 
		      hOut[96] = 18'sd186;
		   2'd3: 
		      hOut[96] = 18'sd559;
		endcase
	else
		hOut[96] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[97])
		   2'd0: 
		      hOut[97] = -18'sd466;
		   2'd1: 
		      hOut[97] = -18'sd155;
		   2'd2: 
		      hOut[97] = 18'sd155;
		   2'd3: 
		      hOut[97] = 18'sd466;
		endcase
	else
		hOut[97] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[98])
		   2'd0: 
		      hOut[98] = -18'sd87;
		   2'd1: 
		      hOut[98] = -18'sd29;
		   2'd2: 
		      hOut[98] = 18'sd29;
		   2'd3: 
		      hOut[98] = 18'sd87;
		endcase
	else
		hOut[98] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[99])
		   2'd0: 
		      hOut[99] = 18'sd278;
		   2'd1: 
		      hOut[99] = 18'sd93;
		   2'd2: 
		      hOut[99] = -18'sd93;
		   2'd3: 
		      hOut[99] = -18'sd278;
		endcase
	else
		hOut[99] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[100])
		   2'd0: 
		      hOut[100] = 18'sd387;
		   2'd1: 
		      hOut[100] = 18'sd129;
		   2'd2: 
		      hOut[100] = -18'sd129;
		   2'd3: 
		      hOut[100] = -18'sd387;
		endcase
	else
		hOut[100] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[101])
		   2'd0: 
		      hOut[101] = 18'sd209;
		   2'd1: 
		      hOut[101] = 18'sd70;
		   2'd2: 
		      hOut[101] = -18'sd70;
		   2'd3: 
		      hOut[101] = -18'sd209;
		endcase
	else
		hOut[101] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[102])
		   2'd0: 
		      hOut[102] = -18'sd86;
		   2'd1: 
		      hOut[102] = -18'sd29;
		   2'd2: 
		      hOut[102] = 18'sd29;
		   2'd3: 
		      hOut[102] = 18'sd86;
		endcase
	else
		hOut[102] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[103])
		   2'd0: 
		      hOut[103] = -18'sd273;
		   2'd1: 
		      hOut[103] = -18'sd91;
		   2'd2: 
		      hOut[103] = 18'sd91;
		   2'd3: 
		      hOut[103] = 18'sd273;
		endcase
	else
		hOut[103] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[104])
		   2'd0: 
		      hOut[104] = -18'sd233;
		   2'd1: 
		      hOut[104] = -18'sd78;
		   2'd2: 
		      hOut[104] = 18'sd78;
		   2'd3: 
		      hOut[104] = 18'sd233;
		endcase
	else
		hOut[104] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[105])
		   2'd0: 
		      hOut[105] = -18'sd24;
		   2'd1: 
		      hOut[105] = -18'sd8;
		   2'd2: 
		      hOut[105] = 18'sd8;
		   2'd3: 
		      hOut[105] = 18'sd24;
		endcase
	else
		hOut[105] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[106])
		   2'd0: 
		      hOut[106] = 18'sd182;
		   2'd1: 
		      hOut[106] = 18'sd61;
		   2'd2: 
		      hOut[106] = -18'sd61;
		   2'd3: 
		      hOut[106] = -18'sd182;
		endcase
	else
		hOut[106] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[107])
		   2'd0: 
		      hOut[107] = 18'sd234;
		   2'd1: 
		      hOut[107] = 18'sd78;
		   2'd2: 
		      hOut[107] = -18'sd78;
		   2'd3: 
		      hOut[107] = -18'sd234;
		endcase
	else
		hOut[107] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[108])
		   2'd0: 
		      hOut[108] = 18'sd105;
		   2'd1: 
		      hOut[108] = 18'sd35;
		   2'd2: 
		      hOut[108] = -18'sd35;
		   2'd3: 
		      hOut[108] = -18'sd105;
		endcase
	else
		hOut[108] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[109])
		   2'd0: 
		      hOut[109] = -18'sd97;
		   2'd1: 
		      hOut[109] = -18'sd32;
		   2'd2: 
		      hOut[109] = 18'sd32;
		   2'd3: 
		      hOut[109] = 18'sd97;
		endcase
	else
		hOut[109] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[110])
		   2'd0: 
		      hOut[110] = -18'sd219;
		   2'd1: 
		      hOut[110] = -18'sd73;
		   2'd2: 
		      hOut[110] = 18'sd73;
		   2'd3: 
		      hOut[110] = 18'sd219;
		endcase
	else
		hOut[110] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[111])
		   2'd0: 
		      hOut[111] = -18'sd175;
		   2'd1: 
		      hOut[111] = -18'sd58;
		   2'd2: 
		      hOut[111] = 18'sd58;
		   2'd3: 
		      hOut[111] = 18'sd175;
		endcase
	else
		hOut[111] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[112])
		   2'd0: 
		      hOut[112] = -18'sd4;
		   2'd1: 
		      hOut[112] = -18'sd1;
		   2'd2: 
		      hOut[112] = 18'sd1;
		   2'd3: 
		      hOut[112] = 18'sd4;
		endcase
	else
		hOut[112] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[113])
		   2'd0: 
		      hOut[113] = 18'sd166;
		   2'd1: 
		      hOut[113] = 18'sd55;
		   2'd2: 
		      hOut[113] = -18'sd55;
		   2'd3: 
		      hOut[113] = -18'sd166;
		endcase
	else
		hOut[113] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[114])
		   2'd0: 
		      hOut[114] = 18'sd214;
		   2'd1: 
		      hOut[114] = 18'sd71;
		   2'd2: 
		      hOut[114] = -18'sd71;
		   2'd3: 
		      hOut[114] = -18'sd214;
		endcase
	else
		hOut[114] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[115])
		   2'd0: 
		      hOut[115] = 18'sd110;
		   2'd1: 
		      hOut[115] = 18'sd37;
		   2'd2: 
		      hOut[115] = -18'sd37;
		   2'd3: 
		      hOut[115] = -18'sd110;
		endcase
	else
		hOut[115] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[116])
		   2'd0: 
		      hOut[116] = -18'sd68;
		   2'd1: 
		      hOut[116] = -18'sd23;
		   2'd2: 
		      hOut[116] = 18'sd23;
		   2'd3: 
		      hOut[116] = 18'sd68;
		endcase
	else
		hOut[116] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[117])
		   2'd0: 
		      hOut[117] = -18'sd193;
		   2'd1: 
		      hOut[117] = -18'sd64;
		   2'd2: 
		      hOut[117] = 18'sd64;
		   2'd3: 
		      hOut[117] = 18'sd193;
		endcase
	else
		hOut[117] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[118])
		   2'd0: 
		      hOut[118] = -18'sd180;
		   2'd1: 
		      hOut[118] = -18'sd60;
		   2'd2: 
		      hOut[118] = 18'sd60;
		   2'd3: 
		      hOut[118] = 18'sd180;
		endcase
	else
		hOut[118] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[119])
		   2'd0: 
		      hOut[119] = -18'sd46;
		   2'd1: 
		      hOut[119] = -18'sd15;
		   2'd2: 
		      hOut[119] = 18'sd15;
		   2'd3: 
		      hOut[119] = 18'sd46;
		endcase
	else
		hOut[119] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[120])
		   2'd0: 
		      hOut[120] = 18'sd112;
		   2'd1: 
		      hOut[120] = 18'sd37;
		   2'd2: 
		      hOut[120] = -18'sd37;
		   2'd3: 
		      hOut[120] = -18'sd112;
		endcase
	else
		hOut[120] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[121])
		   2'd0: 
		      hOut[121] = 18'sd186;
		   2'd1: 
		      hOut[121] = 18'sd62;
		   2'd2: 
		      hOut[121] = -18'sd62;
		   2'd3: 
		      hOut[121] = -18'sd186;
		endcase
	else
		hOut[121] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[122])
		   2'd0: 
		      hOut[122] = 18'sd131;
		   2'd1: 
		      hOut[122] = 18'sd44;
		   2'd2: 
		      hOut[122] = -18'sd44;
		   2'd3: 
		      hOut[122] = -18'sd131;
		endcase
	else
		hOut[122] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[123])
		   2'd0: 
		      hOut[123] = -18'sd8;
		   2'd1: 
		      hOut[123] = -18'sd3;
		   2'd2: 
		      hOut[123] = 18'sd3;
		   2'd3: 
		      hOut[123] = 18'sd8;
		endcase
	else
		hOut[123] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[124])
		   2'd0: 
		      hOut[124] = -18'sd131;
		   2'd1: 
		      hOut[124] = -18'sd44;
		   2'd2: 
		      hOut[124] = 18'sd44;
		   2'd3: 
		      hOut[124] = 18'sd131;
		endcase
	else
		hOut[124] = 18'sd0;

always @ * 
	if( counter == 2'd1 )
		case(xDelay[125])
		   2'd0: 
		      hOut[125] = -18'sd157;
		   2'd1: 
		      hOut[125] = -18'sd52;
		   2'd2: 
		      hOut[125] = 18'sd52;
		   2'd3: 
		      hOut[125] = 18'sd157;
		endcase
	else
		hOut[125] = 18'sd0;

always @ * 
	if( counter == 2'd2 )
		case(xDelay[126])
		   2'd0: 
		      hOut[126] = -18'sd75;
		   2'd1: 
		      hOut[126] = -18'sd25;
		   2'd2: 
		      hOut[126] = 18'sd25;
		   2'd3: 
		      hOut[126] = 18'sd75;
		endcase
	else
		hOut[126] = 18'sd0;

always @ * 
	if( counter == 2'd3 )
		case(xDelay[127])
		   2'd0: 
		      hOut[127] = 18'sd49;
		   2'd1: 
		      hOut[127] = 18'sd16;
		   2'd2: 
		      hOut[127] = -18'sd16;
		   2'd3: 
		      hOut[127] = -18'sd49;
		endcase
	else
		hOut[127] = 18'sd0;

always @ * 
	if( counter == 2'd0 )
		case(xDelay[128])
		   2'd0: 
		      hOut[128] = 18'sd129;
		   2'd1: 
		      hOut[128] = 18'sd43;
		   2'd2: 
		      hOut[128] = -18'sd43;
		   2'd3: 
		      hOut[128] = -18'sd129;
		endcase
	else
		hOut[128] = 18'sd0;






//**********************************

		 
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=63; i=i+1)
			sumLevel1[i] = hOut[i] + hOut[128-i];
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel1[64] = hOut[64];
//**********************************
	
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=31; i=i+1)
			sumLevel2[i] = sumLevel1[2*i] + sumLevel1[2*i+1];
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel2[32] = sumLevel1[64];
	
//**********************************		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=15; i=i+1)
			sumLevel3[i] = sumLevel2[2*i] + sumLevel2[2*i+1];
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel3[16] = sumLevel2[32];
	
//**********************************		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=7; i=i+1)
			sumLevel4[i] = sumLevel3[2*i] + sumLevel3[2*i+1];
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel4[8] = sumLevel3[16];
	
//**********************************			
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=3; i=i+1)
			sumLevel5[i] = sumLevel4[2*i] + sumLevel4[2*i+1];
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel5[4] = sumLevel4[8];
	
//**********************************	
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		for(i=0; i<=1; i=i+1)
			sumLevel6[i] = sumLevel5[2*i] + sumLevel5[2*i+1];	
		
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel6[2] = sumLevel5[4];
	
//**********************************	

	
always @ * //always @ (posedge sys_clk)
	//if(sam_clk_ena)
		sumLevel7 = sumLevel6[0] + sumLevel6[1] + sumLevel6[2];
//**********************************	

	
always @ (posedge sys_clk)
	if(sam_clk_ena)
		y <= sumLevel7;
endmodule