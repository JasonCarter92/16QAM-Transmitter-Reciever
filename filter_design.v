`default_nettype none

module filter_design(
						   input clock_50,
							input [17:0]SW,
							input [3:0] KEY,
							input [13:0]ADC_DA,
						   input [13:0]ADC_DB,
							output reg [3:0] LEDG,
							output reg [17:0] LEDR,
							output reg[13:0]DAC_DA,
							output reg [13:0]DAC_DB,
							output	ADC_CLK_A,
							output	ADC_CLK_B,
							output	ADC_OEB_A,
							output	ADC_OEB_B,
							output	DAC_CLK_A,
							output	DAC_CLK_B,
							output	DAC_MODE,
							output	DAC_WRT_A,
							output	DAC_WRT_B
							);
			  


//**************************************************				
//					DECLARATIONS					
					
		(* keep *) wire signed [13:0]	sin_out;

					
		reg [4:0] NCO_freq;	// unsigned fraction with units cycles/sample	
					
										
	   (* noprune *)reg [13:0] registered_ADC_A;
		(* noprune *)reg [13:0] registered_ADC_B;
					

									
	//*****************************
	//			Set up switches and LEDs
	
					always @ *
					LEDR = SW;
					always @ *
					LEDG = KEY;
					
	// end setting up switches and LEDs
	// ***************************
							
	//************************
	//				  Set up DACs
					
					assign DAC_CLK_A = sys_clk;
					assign DAC_CLK_B = sys_clk;
					
					
					assign DAC_MODE = 1'b1; //treat DACs seperately
					
					assign DAC_WRT_A = ~sys_clk;
					assign DAC_WRT_B = ~sys_clk;
					
					always@ (posedge sys_clk)// make DAC A echo ADC A
					DAC_DA = registered_ADC_A[13:0];
						
						
		always@ (posedge sys_clk) 
		 /* connect the output multiplexer,  which is called
		    output_mux, to the regisgter (i.e. D-flip flops)
			 that drive the pins for DAC B. 
		    In the process convert the signed output of
			 the NCO to an unsigned number, which is required
			 by DAC B, by inverting the sign bit. */
							
			DAC_DB = DAC_out;
//  End DAC setup
//************************	
					
// ************************
//		 Setup ADCs
					
					assign ADC_CLK_A = sys_clk;
					assign ADC_CLK_B = sys_clk;
					
					assign ADC_OEB_A = 1'b1;
					assign ADC_OEB_B = 1'b1;

					
					always@ (posedge sys_clk)
						registered_ADC_A <= ADC_DA;
						
					always@ (posedge sys_clk)
						registered_ADC_B <= ADC_DB;
						

wire sys_clk, sam_clk, sam_clk_ena, sym_clk_ena, sym_clk, q1;
					

wire signed [17:0] srrc_out, srrc_input;
//reg signed [17:0]srrc_out;
wire [13:0] DAC_out;

reg [1:0] LFSROut, LFSRDelay;

reg signed [17:0] FilterChoice;

always @ (posedge sys_clk)
	if(sym_clk_ena)
		LFSRDelay = LFSROut;


 EE465_filter_test SRRC_test(
						   .clock_50(clock_50),
							.reset(~KEY[3]),
							.output_from_filter_1s17(srrc_out),
							.filter_input_scale(SW[2:0]),
							.input_to_filter_1s17(srrc_input),
							.lfsr_value(LFSROut),
							.symbol_clk_ena(sym_clk_ena),
							.sample_clk_ena(sam_clk_ena),
							.system_clk(sys_clk),
							.output_to_DAC(DAC_out)
							);
			  
/*ee465_gold_standard_srrc filly(
			.sys_clk(sys_clk), //system clock, your design may not use this
			.sam_clk(sam_clk_ena), //sampling clock
			.sig_in(srrc_input), //4-ASK input value 1s17
			.sig_out(srrc_out) //output of SRRC filter 1s17
			);*/
	
/*always @ *
	if(SW[3] == 1'b1)
		FilterChoice = GoldPulseOut;
	else
		FilterChoice = PracticalPulseOut;*/
		
(*keep*) wire signed [17:0] GoldPulseOut, PracticalPulseOut, GoldMatchedOut;
		
/*always @ *
	if(SW[4:3] == 2'b00)
		srrc_out = GoldPulseOut;
	else if (SW[4:3] == 2'b01)
		srrc_out = PracticalPulseOut;
	else
		srrc_out = GoldMatchedOut;*/
		
reg signed [17:0] toGoldRx;		

always @ *
	if(SW[10] == 1'b0)
		toGoldRx = GoldPulseOut;
	else
		toGoldRx = srrc_out;
		


			
PracticalPulse PPulse (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(LFSROut),
			.y(srrc_out)
			);
			



//******************************************
			
GoldStandardPulse GoldPulse (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(LFSROut),
			.y(GoldPulseOut)
			);
			
GoldStandardMatched GoldMatched (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(toGoldRx),
			.y(GoldMatchedOut)
			);
//***************************************		
//****************************************MER SECTION************************		
		
(*keep*) wire signed [17:0] GoldTxOut, PracticalTxOut, GoldRxOut, MEROut;
reg signed [17:0] toRx, toMER;	
reg [3:0] numDelays;
(*noprune*) reg signed [17:0] RxOutputDelay [0:7];
integer i;
		
GoldStandardPulse MER_GoldTX (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(LFSROut),
			.y(GoldTxOut)
			);
		
PracticalPulse MER_PracticalTX (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(LFSROut),
			.y(PracticalTxOut)
			);
			
GoldStandardMatched MER_GoldRX (
			.sys_clk(sys_clk),
			.sam_clk_ena(sam_clk_ena),
			.sym_clk_ena(sym_clk_ena),
			.x_in(toRx),
			.y(GoldRxOut)
			);
			
always @ *
	if( SW[9] == 1'b0 )
		toRx = GoldTxOut;
	else
		toRx = PracticalTxOut;
		
/*always @ (posedge sym_clk)
	if(sam_clk_ena)
		toMER <= GoldRxOut;*/

/*always @ *
	if(SW[17:14] == 4'd0)
		numDelays = 4'd1;
	else
		numDelays = SW[17:14];
*/		
/*always @ (posedge sys_clk)
	if(sam_clk_ena)
		begin
			for(i=1; i<=7;i=i+1)
				RxOutputDelay[i] <= RxOutputDelay[i-1];
			end*/
/*	
always @ (posedge sys_clk)
	if(sym_clk_ena)
		toMER <= RxOutputDelay[numDelays];
*/
/*always @ (posedge sys_clk)
	if(sam_clk_ena)
	RxOutputDelay[0] <= GoldRxOut;*/

always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[0] <= GoldRxOut;
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[1] <= RxOutputDelay[0];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[2] <= RxOutputDelay[1];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[3] <= RxOutputDelay[2];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[4] <= RxOutputDelay[3];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[5] <= RxOutputDelay[4];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[6] <= RxOutputDelay[5];
		
always @ (posedge sys_clk)
	if(sam_clk_ena)
		RxOutputDelay[7] <= RxOutputDelay[6];

always @ (posedge sys_clk)
	if(sym_clk_ena)
		case(SW[17:15])
		   3'd0: 
		      toMER <= RxOutputDelay[0];
		   3'd1: 
		      toMER <= RxOutputDelay[1];
		   3'd2: 
		      toMER <= RxOutputDelay[2];
		   3'd3: 
		      toMER <= RxOutputDelay[3];
			3'd4: 
		      toMER <= RxOutputDelay[4];
			3'd5: 
		      toMER <= RxOutputDelay[5];
			3'd6: 
		      toMER <= RxOutputDelay[6];
			3'd7: 
		      toMER <= RxOutputDelay[7];
		endcase



EE465_MER_module MERMeasurement (.sys_clk(sys_clk), .sym_clk_ena(sym_clk_ena), .reset(SW[3]), .decision_I(toMER), .decision_Q(), .MER_I(MEROut), .MER_Q(), .MER_IQ());

endmodule
`default_nettype wire