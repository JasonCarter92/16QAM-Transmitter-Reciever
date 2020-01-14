module SUT(	
				input sys_clk,
				input sym_clk_ena,
				input sam_clk_ena,
				input SW,
				input [1:0] mapperIn,
				output reg [17:0] decisionVariable);
				
				
				
reg signed [17:0]  filterOut, delay1;
wire signed [17:0] GoldPulseOut, PracticalPulseOu, matchedOutput;

reg [1:0] dataIn;
reg [3:0] counter;

always @ (posedge sam_clk_ena)
	counter = counter + 1;
	
always @ *
	if(counter == 4'd0)
		dataIn = mapperIn;
	else
		dataIn = 4'd0;

always @ *
	if(SW)
		filterOut = GoldPulseOut;
	else
		filterOut = PracticalPulseOut;
				
always @ (posedge sam_clk_ena)
	delay1 = matchedOutput;
				
always @ (posedge sym_clk_ena)
	decisionVariable = delay1;
	
GoldStandardPulse GoldPulse (.sys_clk(sys_clk), .sym_clk_ena(sym_clk_ena), .sam_clk_ena(sam_clk_ena), .x_in(dataIn), .y(GoldPulseOut));
PracticalPulse PracticalPulse (.sys_clk(sys_clk), .sym_clk_ena(sym_clk_ena), .sam_clk_ena(sam_clk_ena), .x_in(dataIn),.y(PracticalPulseOut));
GoldStandardMatched GoldMatched (.sys_clk(sys_clk), .sym_clk_ena(sym_clk_ena), .sam_clk_ena(sam_clk_ena), .x_in(filterOut), .y(matchedOutput));

			
endmodule	

				