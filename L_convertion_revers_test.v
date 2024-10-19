`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:13 12/21/2023
// Design Name:   L_convertion_revers
// Module Name:   C:/Users/User/KUZNECHIK_DECODER/L_convertion_revers_test.v
// Project Name:  KUZNECHIK_DECODER
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: L_convertion_revers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module L_convertion_revers_test;

	// Inputs
	reg enable;
	reg clk;
	reg [127:0] input_word;

	// Outputs
	wire [127:0] output_word;
	wire finish_convertion;

	// Instantiate the Unit Under Test (UUT)
	L_convertion_revers uut (
		.enable(enable), 
		.clk(clk), 
		.input_word(input_word), 
		.output_word(output_word), 
		.finish_convertion(finish_convertion)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		enable = 0;
		clk = 0;
		input_word = 0;

		// Wait 100 ns for global reset to finish
		#100;
		enable = 1;
		input_word = 128'h0d8e40e4a800d06b2f1b37ea379ead8e;
		#2000;
		enable = 0;
        
		// Add stimulus here

	end
      
endmodule

