module TXNoMul_Filter(
         input clk,
		   input signed [1:0] x_in,
		   output reg signed [17:0] y   );
			
reg [17:0] hOut[0:16];
reg [1:0] xDelay [0:16];
integer i;	
	
always @ (posedge clk)
	xDelay[0] = x_in;
		
always @ (posedge clk)
	begin
		for(i=1;i<=16; i=i+1)
			xDelay[i] <= xDelay[i-1];
	end

always @ *
	case(xDelay[0])
	   2'd1: 
	      hOut[0] = -18'sd166;
	   2'd2: 
	      hOut[0] = -18'sd55;
	   2'd3: 
	      hOut[0] = 18'sd55;
	   2'd4: 
	      hOut[0] = 18'sd166;
	endcase

always @ *
	case(xDelay[1])
	   2'd1: 
	      hOut[1] = 18'sd527;
	   2'd2: 
	      hOut[1] = 18'sd176;
	   2'd3: 
	      hOut[1] = -18'sd176;
	   2'd4: 
	      hOut[1] = -18'sd527;
	endcase

always @ *
	case(xDelay[2])
	   2'd1: 
	      hOut[2] = 18'sd1735;
	   2'd2: 
	      hOut[2] = 18'sd578;
	   2'd3: 
	      hOut[2] = -18'sd578;
	   2'd4: 
	      hOut[2] = -18'sd1735;
	endcase

always @ *
	case(xDelay[3])
	   2'd1: 
	      hOut[3] = 18'sd2333;
	   2'd2: 
	      hOut[3] = 18'sd778;
	   2'd3: 
	      hOut[3] = -18'sd778;
	   2'd4: 
	      hOut[3] = -18'sd2333;
	endcase

always @ *
	case(xDelay[4])
	   2'd1: 
	      hOut[4] = 18'sd642;
	   2'd2: 
	      hOut[4] = 18'sd214;
	   2'd3: 
	      hOut[4] = -18'sd214;
	   2'd4: 
	      hOut[4] = -18'sd642;
	endcase

always @ *
	case(xDelay[5])
	   2'd1: 
	      hOut[5] = -18'sd4273;
	   2'd2: 
	      hOut[5] = -18'sd1424;
	   2'd3: 
	      hOut[5] = 18'sd1424;
	   2'd4: 
	      hOut[5] = 18'sd4273;
	endcase

always @ *
	case(xDelay[6])
	   2'd1: 
	      hOut[6] = -18'sd11400;
	   2'd2: 
	      hOut[6] = -18'sd3800;
	   2'd3: 
	      hOut[6] = 18'sd3800;
	   2'd4: 
	      hOut[6] = 18'sd11400;
	endcase

always @ *
	case(xDelay[7])
	   2'd1: 
	      hOut[7] = -18'sd17849;
	   2'd2: 
	      hOut[7] = -18'sd5950;
	   2'd3: 
	      hOut[7] = 18'sd5950;
	   2'd4: 
	      hOut[7] = 18'sd17849;
	endcase

always @ *
	case(xDelay[8])
	   2'd1: 
	      hOut[8] = -18'sd20456;
	   2'd2: 
	      hOut[8] = -18'sd6819;
	   2'd3: 
	      hOut[8] = 18'sd6819;
	   2'd4: 
	      hOut[8] = 18'sd20456;
	endcase

always @ *
	case(xDelay[9])
	   2'd1: 
	      hOut[9] = -18'sd17849;
	   2'd2: 
	      hOut[9] = -18'sd5950;
	   2'd3: 
	      hOut[9] = 18'sd5950;
	   2'd4: 
	      hOut[9] = 18'sd17849;
	endcase

always @ *
	case(xDelay[10])
	   2'd1: 
	      hOut[10] = -18'sd11400;
	   2'd2: 
	      hOut[10] = -18'sd3800;
	   2'd3: 
	      hOut[10] = 18'sd3800;
	   2'd4: 
	      hOut[10] = 18'sd11400;
	endcase

always @ *
	case(xDelay[11])
	   2'd1: 
	      hOut[11] = -18'sd4273;
	   2'd2: 
	      hOut[11] = -18'sd1424;
	   2'd3: 
	      hOut[11] = 18'sd1424;
	   2'd4: 
	      hOut[11] = 18'sd4273;
	endcase

always @ *
	case(xDelay[12])
	   2'd1: 
	      hOut[12] = 18'sd642;
	   2'd2: 
	      hOut[12] = 18'sd214;
	   2'd3: 
	      hOut[12] = -18'sd214;
	   2'd4: 
	      hOut[12] = -18'sd642;
	endcase

always @ *
	case(xDelay[13])
	   2'd1: 
	      hOut[13] = 18'sd2333;
	   2'd2: 
	      hOut[13] = 18'sd778;
	   2'd3: 
	      hOut[13] = -18'sd778;
	   2'd4: 
	      hOut[13] = -18'sd2333;
	endcase

always @ *
	case(xDelay[14])
	   2'd1: 
	      hOut[14] = 18'sd1735;
	   2'd2: 
	      hOut[14] = 18'sd578;
	   2'd3: 
	      hOut[14] = -18'sd578;
	   2'd4: 
	      hOut[14] = -18'sd1735;
	endcase

always @ *
	case(xDelay[15])
	   2'd1: 
	      hOut[15] = 18'sd527;
	   2'd2: 
	      hOut[15] = 18'sd176;
	   2'd3: 
	      hOut[15] = -18'sd176;
	   2'd4: 
	      hOut[15] = -18'sd527;
	endcase

always @ *
	case(xDelay[16])
	   2'd1: 
	      hOut[16] = -18'sd166;
	   2'd2: 
	      hOut[16] = -18'sd55;
	   2'd3: 
	      hOut[16] = 18'sd55;
	   2'd4: 
	      hOut[16] = 18'sd166;
	endcase


always @ *
	y = hOut[0] + hOut[1] + hOut[2] +
		 hOut[3] + hOut[4] + hOut[5] + 
		 hOut[6] + hOut[7] + hOut[8] + 
		 hOut[9] + hOut[10] + hOut[11] + 
		 hOut[12] + hOut[13] + hOut[14] + 
		 hOut[15] + hOut[16];
		 
	
	
endmodule