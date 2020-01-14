module ReferenceLevelGen (input clear_accumulator,
								  input sym_clk_ena,
								  input signed [17:0] decision_variable,
								  input [20:0] MSamples,
								  input [7:0] shiftVal,
								  output reg signed [17:0] reference_level,
								  output reg signed [38:0] mapper_out_power);
								  
								  
(* noprune *) reg signed [17:0] absVal;
(* noprune *) reg signed [37:0] absAccumulator;
//(* noprune *) reg signed [17:0] reference_level;
(* noprune *) reg signed [35:0] reference_squared;
//reg signed [36:0] mapper_out_power;

always @ *
	if(decision_variable < 0)
		absVal = -decision_variable;
	else
		absVal = decision_variable;
		
		
always @ (posedge sym_clk_ena)
	if(clear_accumulator)
		absAccumulator = 38'b0;
	else
		absAccumulator = absAccumulator + absVal;
	
always @ (posedge clear_accumulator)	
		reference_level = absAccumulator >>> shiftVal;
		
		
always @ *
	reference_squared = reference_level * reference_level;

//mapper_out_power calculation	
always @ *
	//mapper_out_power = (reference_squared * 4'b0101); //Multiply by 2s2 number 1.25 decimal. The multiplied number becomes 4s36
	mapper_out_power = reference_squared + (reference_squared >>> 2);							  

endmodule

