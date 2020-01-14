module slicer (input wire signed [17:0] reference_level,
					input wire signed [17:0] decision_variable,
					output reg [1:0] symbol
					);
				
always @ *
	if( decision_variable > reference_level )
		symbol = 2'b10;
	else if ( decision_variable > 0 )
		symbol = 2'b11;
	else if ( decision_variable >  -reference_level )
		symbol = 2'b01;
	else
		symbol = 2'b00;
		
			

					
endmodule
