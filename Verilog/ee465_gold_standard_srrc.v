module ee465_gold_standard_srrc(
			input sys_clk, //system clock
			input sam_clk, //sampling clock
			input signed [17:0]sig_in, //upsampled input value 1s17
			output reg signed [17:0]sig_out //output of filter 1s17
			);


	always@ (posedge sys_clk)
		if (sam_clk == 1'b1)
			sig_out <= sig_in;

endmodule
