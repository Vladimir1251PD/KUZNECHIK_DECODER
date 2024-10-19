`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:42 12/21/2023
// Design Name:   S_convertion_revers
// Module Name:   C:/Users/User/KUZNECHIK_DECODER/S_convertion_revers_test.v
// Project Name:  KUZNECHIK_DECODER
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: S_convertion_revers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module S_convertion_revers_test;

	// Inputs
	reg [127:0] input_bytes;

	// Outputs
	wire [127:0] output_bytes;

	// Instantiate the Unit Under Test (UUT)
	S_convertion_revers uut0 (
		.input_bytes(input_bytes[7:0]), 
		.output_bytes(output_bytes[7:0])
	);
	S_convertion_revers uut1 (
		.input_bytes(input_bytes[15:8]), 
		.output_bytes(output_bytes[15:8])
	);
	S_convertion_revers uut2 (
		.input_bytes(input_bytes[23:16]), 
		.output_bytes(output_bytes[23:16])
	);
	S_convertion_revers uut3 (
		.input_bytes(input_bytes[31:24]), 
		.output_bytes(output_bytes[31:24])
	);
	S_convertion_revers uut4 (
		.input_bytes(input_bytes[39:32]), 
		.output_bytes(output_bytes[39:32])
	);
	S_convertion_revers uut5 (
		.input_bytes(input_bytes[47:40]), 
		.output_bytes(output_bytes[47:40])
	);
	S_convertion_revers uut6 (
		.input_bytes(input_bytes[55:48]), 
		.output_bytes(output_bytes[55:48])
	);
	S_convertion_revers uut7 (
		.input_bytes(input_bytes[63:56]), 
		.output_bytes(output_bytes[63:56])
	);
	S_convertion_revers uut8 (
		.input_bytes(input_bytes[71:64]), 
		.output_bytes(output_bytes[71:64])
	);
	S_convertion_revers uut9 (
		.input_bytes(input_bytes[79:72]), 
		.output_bytes(output_bytes[79:72])
	);
	S_convertion_revers uut10 (
		.input_bytes(input_bytes[87:80]), 
		.output_bytes(output_bytes[87:80])
	);
	S_convertion_revers uut11 (
		.input_bytes(input_bytes[95:88]), 
		.output_bytes(output_bytes[95:88])
	);
	S_convertion_revers uut12 (
		.input_bytes(input_bytes[103:96]), 
		.output_bytes(output_bytes[103:96])
	);
	S_convertion_revers uut13 (
		.input_bytes(input_bytes[111:104]), 
		.output_bytes(output_bytes[111:104])
	);
	S_convertion_revers uut14 (
		.input_bytes(input_bytes[119:112]), 
		.output_bytes(output_bytes[119:112])
	);
	S_convertion_revers uut15 (
		.input_bytes(input_bytes[127:120]), 
		.output_bytes(output_bytes[127:120])
	);

	initial begin
		// Initialize Inputs
		input_bytes = 0;

		// Wait 100 ns for global reset to finish
		#100;
      input_bytes = 128'h8a6b930a52211b45c5baa43ff8b91319;  
		// Add stimulus here

	end
      
endmodule

