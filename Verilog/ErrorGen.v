module ErrorGen (input clear_accumulator,
					  input sym_clk_ena,
					  input [20:0] MSamples,
					  input [7:0] shiftVal,
					  input signed [17:0] error,
					  output reg signed [17:0] accumulated_error,
					  output reg signed [35:0] accumulated_squared_error);

//reg signed [17:0] error;
reg signed [35:0] error_squared;
reg signed [37:0] errorAccumulator  = 0;
reg signed [55:0] errorSquaredAccumulator  = 0;

	
always @ (posedge sym_clk_ena)
	if(clear_accumulator)
		errorAccumulator = 38'b0;
	else
		errorAccumulator = errorAccumulator + error;
		
always @ (posedge clear_accumulator)
		accumulated_error = errorAccumulator>>> shiftVal;

always @ *
	error_squared = error * error;
	

always @ (posedge sym_clk_ena)
	if(clear_accumulator)
		errorSquaredAccumulator = 38'b0;
	else
		errorSquaredAccumulator = errorSquaredAccumulator + error_squared;
		
always @ (posedge clear_accumulator)
		accumulated_squared_error = errorSquaredAccumulator >>> shiftVal;
		//accumulated_squared_error = errorSquaredAccumulator / MSamples;


endmodule
