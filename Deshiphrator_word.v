`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:07 11/13/2023 
// Design Name: 
// Module Name:    shiphrator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Deshiphrator_word(
	input clk,
	input enable,
	input [127:0] input_word,
	input [127:0] key_1,
	input [127:0] key_2,
	input [127:0] key_3,
	input [127:0] key_4,
	input [127:0] key_5,
	input [127:0] key_6,
	input [127:0] key_7,
	input [127:0] key_8,
	input [127:0] key_9,
	input [127:0] key_10,
	output reg [127:0] output_word,
	output reg finish
);
	
wire [127:0] S_converter_out;
wire [127:0] L_converter_out;
wire L_convertion_finish;


reg L_convertion_enable;
reg [3:0] counter;
reg [3:0] state;
reg [127:0] current_word;
reg [127:0] keys [9:0];
integer i;

initial
begin
	counter = 0;
	state = 0;
	output_word = 0;
	finish = 0;
	current_word = 0;
	for(i = 0; i < 10; i = i + 1)
		keys[i] = 128'b0;
end
	
	
	

always @(posedge clk)
begin
	case(state)
	4'b0:
	begin
		counter <= 0;
		finish <= 0;
		if(enable == 1)
		begin
			state <= 4'b0001;
			current_word <= input_word;
			keys[0] <= key_1;
			keys[1] <= key_2;
			keys[2] <= key_3;
			keys[3] <= key_4;
			keys[4] <= key_5;
			keys[5] <= key_6;
			keys[6] <= key_7;
			keys[7] <= key_8;
			keys[8] <= key_9;
			keys[9] <= key_10;
		end
	end
	4'b0001:
	begin
		current_word <= current_word ^ keys[4'b1001 - counter];
		state <= 4'b0010;
		L_convertion_enable <= 1;
	end
	4'b0010:
	begin
		if(L_convertion_finish == 1)
		begin
			current_word <= L_converter_out;
			L_convertion_enable <= 0;
			state <= 4'b0011;	
		end
	end
	4'b0011:
	begin
		current_word <= S_converter_out;
		state <= 4'b0100;
		counter <= counter + 1;
	end
	4'b0100:
		if(counter == 4'b1001)
		begin
			output_word <= current_word ^ keys[0];
			state <= 4'b0101;
			finish <= 1;
			
		end
		else
		begin
			state <= 4'b0001;
		end
	4'b0101:
	begin
		if(enable == 0)
		begin
			state <= 0;
		end
	end
	endcase
end
	
	
	
	
	
	
	L_convertion_revers L_deshiphrator(
	.enable(L_convertion_enable),
	.clk(clk),
	.input_word(current_word),
	.output_word(L_converter_out),
	.finish_convertion(L_convertion_finish)
	);
	
	S_convertion_revers S_deshiphrator0(
	.input_bytes(current_word[127:120]),
	.output_bytes(S_converter_out[127:120])
	);
	
	S_convertion_revers S_deshiphrator1(
	.input_bytes(current_word[119:112]),
	.output_bytes(S_converter_out[119:112])
	);
	
	S_convertion_revers S_deshiphrator2(
	.input_bytes(current_word[111:104]),
	.output_bytes(S_converter_out[111:104])
	);
	
	S_convertion_revers S_deshiphrator3(
	.input_bytes(current_word[103:96]),
	.output_bytes(S_converter_out[103:96])
	);
	
	S_convertion_revers S_deshiphrator4(
	.input_bytes(current_word[95:88]),
	.output_bytes(S_converter_out[95:88])
	);
	
	S_convertion_revers S_deshiphrator5(
	.input_bytes(current_word[87:80]),
	.output_bytes(S_converter_out[87:80])
	);
	
	S_convertion_revers S_deshiphrator6(
	.input_bytes(current_word[79:72]),
	.output_bytes(S_converter_out[79:72])
	);
	
	S_convertion_revers S_deshiphrator7(
	.input_bytes(current_word[71:64]),
	.output_bytes(S_converter_out[71:64])
	);
	
	S_convertion_revers S_deshiphrator8(
	.input_bytes(current_word[63:56]),
	.output_bytes(S_converter_out[63:56])
	);
	
	S_convertion_revers S_deshiphrator9(
	.input_bytes(current_word[55:48]),
	.output_bytes(S_converter_out[55:48])
	);
	
	S_convertion_revers S_deshiphrator10(
	.input_bytes(current_word[47:40]),
	.output_bytes(S_converter_out[47:40])
	);
	
	S_convertion_revers S_deshiphrator11(
	.input_bytes(current_word[39:32]),
	.output_bytes(S_converter_out[39:32])
	);
	
	S_convertion_revers S_deshiphrator12(
	.input_bytes(current_word[31:24]),
	.output_bytes(S_converter_out[31:24])
	);
	
	S_convertion_revers S_deshiphrator13(
	.input_bytes(current_word[23:16]),
	.output_bytes(S_converter_out[23:16])
	);
	
	S_convertion_revers S_deshiphrator14(
	.input_bytes(current_word[15:8]),
	.output_bytes(S_converter_out[15:8])
	);
	
	S_convertion_revers S_deshiphrator15(
	.input_bytes(current_word[7:0]),
	.output_bytes(S_converter_out[7:0])
	);

endmodule
