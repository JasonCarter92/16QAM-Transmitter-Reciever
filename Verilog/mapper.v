module mapper (input wire [1:0] symbol,
					input signed [17:0] reference_level,
					output reg signed [17:0]value);
					
always @ *
	case(symbol)
	2'b00:
		value = -( reference_level + (reference_level >>> 1) );
	2'b01:
		value = -(reference_level >>> 1);
	2'b11:
		value = (reference_level >>> 1);
	2'b10:
		value = ( reference_level + (reference_level >>> 1) );
	endcase
					

	
	/*always @ *
		case(symbol)
			2'b00: begin
				value = -18'sd98304;
			end
			2'b01: begin
				value = -18'sd32768;
			end
			2'b10: begin
				value = 18'sd98304;
			end
			2'b11: begin
				value = 18'sd32768;
			end
		endcase*/

endmodule
