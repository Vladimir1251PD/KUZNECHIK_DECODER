`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:23:23 12/26/2023
// Design Name:   main
// Module Name:   C:/Users/User/KUZNECHIK_DECODER/test_main.v
// Project Name:  KUZNECHIK_DECODER
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_main;

	// Inputs
	reg clk;
	reg read_key;
	reg read_word;
	reg [255:0] input_key;
	reg [127:0] input_word;

	// Outputs
	wire [127:0] output_word;
	wire write;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.read_key(read_key), 
		.read_word(read_word), 
		.input_key(input_key), 
		.input_word(input_word), 
		.output_word(output_word), 
		.write(write), 
		.ready(ready)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		read_key = 0;
		read_word = 0;
		input_key = 0;
		input_word = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		input_key = 256'h8899aabbccddeeff0011223344556677fedcba98765432100123456789abcdef;
		read_key = 1;
		#10000;
		read_word = 1;
		input_word = 128'h7f679d90bebc24305a468d42b9d4edcd;
		#5000;
		read_word = 0;
		read_key = 0;
		#100;
		
		

	end
      
endmodule

