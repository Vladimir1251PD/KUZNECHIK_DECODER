`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:19 11/09/2023 
// Design Name: 
// Module Name:    main 
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


//����������� �������: 100��� / 200(175 ��� ����������)������ * 128��� = 64 ����/���


// ������� �������� ��������(20 ���� ����� �������� ����� ���������������.
// � ��� ��� ��� ���������� ����� ������������� ���������� ������ - �������� ����� ������ ����� ��� �� ���������������)
module main(
   input clk, // ������� ������ �� ���� (�� ��� �� �������)
	input read_key, // ������-���������� ��� ������ ������� (���� + �����).  
	input read_word, // ������-���������� ��� �������� �����
   input [255:0] input_key, // ������� ���� �� 32 �����
   input [127:0] input_word, // ������� ����� ��� ���������� 16 ������
   output reg [127:0] output_word, // �������� ����� ��� ����������
	output reg write, //���� ���������� ����� � ��������
	output reg ready // ���� ���������� ���� 1 - ������ �� ���������� 0 - ������ ��������� ����������
   );
	
	wire [127:0] key_1;
	wire [127:0] key_2;
	wire [127:0] key_3;
	wire [127:0] key_4;
	wire [127:0] key_5;
	wire [127:0] key_6;
	wire [127:0] key_7;
	wire [127:0] key_8;
	wire [127:0] key_9;
	wire [127:0] key_10;
	
	wire finish_shiphrator_for_word;
	wire finish_key_calculater;
	
	reg enable_shiphrator_for_word;
	reg enable_key_calculation;
	
	wire [127:0] output_word_shiphrator_for_word;
	
	reg [127:0] key_for_shiphrator_1;
	reg [127:0] key_for_shiphrator_2;
	reg [127:0] key_for_shiphrator_3;
	reg [127:0] key_for_shiphrator_4;
	reg [127:0] key_for_shiphrator_5;
	reg [127:0] key_for_shiphrator_6;
	reg [127:0] key_for_shiphrator_7;
	reg [127:0] key_for_shiphrator_8;
	reg [127:0] key_for_shiphrator_9;
	reg [127:0] key_for_shiphrator_10;
	
	reg [3:0] state;
	
	
	initial
	begin
		output_word = 0;
		write = 0;
		state = 0;
		ready = 0;
		enable_key_calculation = 0;
		enable_shiphrator_for_word = 0;
		key_for_shiphrator_1 = 0;
		key_for_shiphrator_2 = 0;
		key_for_shiphrator_3 = 0;
		key_for_shiphrator_4 = 0;
		key_for_shiphrator_5 = 0;
		key_for_shiphrator_6 = 0;
		key_for_shiphrator_7 = 0;
		key_for_shiphrator_8 = 0;
		key_for_shiphrator_9 = 0;
		key_for_shiphrator_10 = 0;
	end
	
	
	
	
	always @(posedge clk)
	begin
		case(state)
		4'b0:
			if(read_key == 1)
			begin
				ready <= 1;
				enable_key_calculation <= 1;
				state <= 4'b0001;
			end
		4'b0001:
		begin
			if(finish_key_calculater == 1)
			begin
				key_for_shiphrator_1 <= key_1;
				key_for_shiphrator_2 <= key_2;
				key_for_shiphrator_3 <= key_3;
				key_for_shiphrator_4 <= key_4;
				key_for_shiphrator_5 <= key_5;
				key_for_shiphrator_6 <= key_6;
				key_for_shiphrator_7 <= key_7;
				key_for_shiphrator_8 <= key_8;
				key_for_shiphrator_9 <= key_9;
				key_for_shiphrator_10 <= key_10;
				enable_key_calculation <= 0;
				state <= 4'b0010;
				ready <= 0;
			end
		end
		4'b0010:
		begin
			if(read_word == 1)
			begin
				enable_shiphrator_for_word <= 1;
				ready <= 1;
				state <= 4'b0011;
			end
		end
		
		4'b0011:
		begin
			if(finish_shiphrator_for_word == 1)
			begin
				enable_shiphrator_for_word <= 0;
				output_word <= output_word_shiphrator_for_word;
				write <= 1;
				state <= 4'b0100;
				ready <= 0;
			end
		end
		4'b0100:
		begin
			if(read_word == 0)
			begin
				write <= 0;
				if(read_key == 0)
				begin
					state <= 4'b0;
				end
				else
				begin
					state <= 4'b0010;
				end
			end
		end
		endcase
	end
	
	
	Deshiphrator_word deshiphrator_word_1(
	.clk(clk),
	.enable(enable_shiphrator_for_word),
	.input_word(input_word),
	.key_1(key_for_shiphrator_1),
	.key_2(key_for_shiphrator_2),
	.key_3(key_for_shiphrator_3),
	.key_4(key_for_shiphrator_4),
	.key_5(key_for_shiphrator_5),
	.key_6(key_for_shiphrator_6),
	.key_7(key_for_shiphrator_7),
	.key_8(key_for_shiphrator_8),
	.key_9(key_for_shiphrator_9),
	.key_10(key_for_shiphrator_10),
	.output_word(output_word_shiphrator_for_word),
	.finish(finish_shiphrator_for_word)
	);
	
	
	
	Key_calculation key_calculater(
	.clk(clk),
	.enable(enable_key_calculation),//�� ������ �������� ���������� �� ������� ������
	.key(input_key),
	.key_1(key_1),
	.key_2(key_2),
	.key_3(key_3),
	.key_4(key_4),
	.key_5(key_5),
	.key_6(key_6),
	.key_7(key_7),
	.key_8(key_8),
	.key_9(key_9),
	.key_10(key_10),
	.finish(finish_key_calculater)// �� ������ �������� 
	);
	
	
	
	
	
endmodule
