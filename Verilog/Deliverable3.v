module Deliverable3( input clock_50,
							input [17:0]SW,
							input [3:0] KEY,
							output reg sym_clk_ena,
							output reg clear_accumulator
						 );
						 

					
//Clocks						 					 
(* noprune *) reg sam_clk_ena;
//(* noprune *) reg sym_clk_ena;
(* noprune *) reg sys_clk;
(* noprune *) reg [3:0] clk_phase;
(* keep *)wire signed [17:0] decision_variable;	

wire [3:0] LFSR_Out;	
//wire MSamples = 18'd50;
localparam MSamples = 21'd1048576;
localparam shiftVal = 20;
//localparam MSamples = 21'd1024;
//localparam shiftVal = 10;
//Generate the clock enables based on CLOCK50
always @ (posedge CLOCK_50)
	sys_clk = ~sys_clk;
	
always @ (posedge sys_clk)
	clk_phase = clk_phase + 1'b1;
		
always @ *
	if(clk_phase == 4'd3 || clk_phase == 4'd7 || clk_phase == 4'd11 || clk_phase == 4'd15)
		sam_clk_ena = 1'b1;
	else
		sam_clk_ena = 1'b0;

always @ *
	if(clk_phase == 4'd15)
		sym_clk_ena = 1'b1;
	else
		sym_clk_ena = 1'b0;
	
//Manage the clear_accumulator flag
 // This will be the number of samples averaged.	
(* noprune *) reg [21:0] clearCount;	
//reg clear_accumulator;		 
						 
						 
always @ (posedge sym_clk_ena)
		if(clearCount == MSamples)
			clearCount = 1'b0;
		else
			clearCount = clearCount + 1'b1;
		
always @ *
	if(clearCount == MSamples)
		clear_accumulator = 1'b1;
	else
		clear_accumulator = 1'b0;
	
	
//**THIS SECTION OF CODE INSTACIATES AND CALCULATES ALL I-PHASE VALUES***//

	
//I-Phase variables and wires	
wire signed [17:0] ILFSR_Out;
reg signed [1:0] LFSR_Out_Delay;
wire [1:0] ISlicerOut;
wire signed [17:0] IoldMapperOut;
wire signed [17:0] IMapperOut;
(* noprune *) reg signed [17:0] Ierror;
wire signed [17:0] Ireference_level;
wire signed [17:0] Idecision_variable;
wire signed [35:0] Imappoer_out_power;
reg comparator;
reg sym_correct;
reg sym_error;

always @ (posedge sym_clk_ena)
	Ierror = Idecision_variable - IMapperOut;
	
always @ (posedge sym_clk_ena)
	LFSR_Out_Delay = ILFSR_Out[1:0];
	
always @ *
	if(LFSR_Out_Delay == ISlicerOut)
		comparator = 1'b1;
	else
		comparator = 1'b0;
		
always @ (posedge sym_clk_ena)
	sym_correct = comparator;
	
	
wire signed [17:0] ISIPOWER;


//Inphase Component Instanciation

SUT testSUT (.sys_clk(sys_clk), .sym_clk_ena(sym_clk_ena), .sam_clk_ena(sam_clk_ena), .SW(SW[9]), .mapperIn(IoldMapperOut), .decisionVariable(Idecision_variable));

LFSR_22Bit I_LFSR (.sys_clk(sys_clk), .sam_clk_ena(sam_clk_ena), .loadData(22'd4194303), .LFSR_Out(ILFSR_Out)); //I Phase LFSR

slicer ISlicer(.reference_level(Ireference_level), .decision_variable(Idecision_variable), .symbol(ISlicerOut)); //I Phase Slicer

mapper IMap (.symbol(ISlicerOut), .reference_level(Ireference_level), .value(IMapperOut)); //I Phase Mapper with Reference_level input

ReferenceLevelGen IRefGen (.clear_accumulator(clear_accumulator), .sym_clk_ena(sym_clk_ena), .decision_variable(Idecision_variable),
									.MSamples(MSamples), .shiftVal(shiftVal), .reference_level(Ireference_level), .mapper_out_power(Imappoer_out_power));

ErrorGen IErrorGen (.clear_accumulator(clear_accumulator), .sym_clk_ena(sym_clk_ena), .MSamples(MSamples), .shiftVal(shiftVal), //I Phase error calculations
                   .error(Ierror), .accumulated_error(Iaccumulated_error), .accumulated_squared_error(Iaccumulated_squared_error));

oldMapper IOldMapper(.clk(sym_clk_ena), .symbol(ILFSR_Out), .value(IoldMapperOut));

		
endmodule 