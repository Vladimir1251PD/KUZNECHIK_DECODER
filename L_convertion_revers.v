`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:43 11/22/2023 
// Design Name: 
// Module Name:    L_convertion 
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
module L_convertion_revers(
		input enable, // 1 - начать L_преобразование 
		input clk, // тактовый сигнал
		input [127:0] input_word, // входное слово
		output reg [127:0] output_word, // преобразованное слово
		output reg finish_convertion // 1 - L_преобразование выполнено, можно забирать результат
);

reg [7:0] reg_to_convertion [15:0];
wire [7:0] L_convertion_output [15:0];
reg [3:0] state;
reg [3:0] counter;

initial
begin
	state = 0;
	counter = 0;
	output_word = 0;
	finish_convertion = 0;
end


always @(posedge clk)
begin
	case(state)
		0:
		begin
			finish_convertion <= 0;
			counter <= 0;
			if(enable == 1)
				begin
					state <= 4'b0001;
					reg_to_convertion[15] <= input_word[127:120];
					reg_to_convertion[14] <= input_word[119:112];
					reg_to_convertion[13] <= input_word[111:104];
					reg_to_convertion[12] <= input_word[103:96];
					reg_to_convertion[11] <= input_word[95:88];
					reg_to_convertion[10] <= input_word[87:80];
					reg_to_convertion[9] <= input_word[79:72];
					reg_to_convertion[8] <= input_word[71:64];
					reg_to_convertion[7] <= input_word[63:56];
					reg_to_convertion[6] <= input_word[55:48];
					reg_to_convertion[5] <= input_word[47:40];
					reg_to_convertion[4] <= input_word[39:32];
					reg_to_convertion[3] <= input_word[31:24];
					reg_to_convertion[2] <= input_word[23:16];
					reg_to_convertion[1] <= input_word[15:8];
					reg_to_convertion[0] <= input_word[7:0];
				end
		end
		4'b0001:
		begin
			reg_to_convertion[15] <= reg_to_convertion[14];
			reg_to_convertion[14] <= reg_to_convertion[13];
			reg_to_convertion[13] <= reg_to_convertion[12];
			reg_to_convertion[12] <= reg_to_convertion[11];
			reg_to_convertion[11] <= reg_to_convertion[10];
			reg_to_convertion[10] <= reg_to_convertion[9];
			reg_to_convertion[9] <= reg_to_convertion[8];
			reg_to_convertion[8] <= reg_to_convertion[7];
			reg_to_convertion[7] <= reg_to_convertion[6];
			reg_to_convertion[6] <= reg_to_convertion[5];
			reg_to_convertion[5] <= reg_to_convertion[4];
			reg_to_convertion[4] <= reg_to_convertion[3];
			reg_to_convertion[3] <= reg_to_convertion[2];
			reg_to_convertion[2] <= reg_to_convertion[1];
			reg_to_convertion[1] <= reg_to_convertion[0];
			reg_to_convertion[0] <= reg_to_convertion[15] ^ L_convertion_output[14] ^ L_convertion_output[13]  ^ L_convertion_output[12] ^ L_convertion_output[11] ^ L_convertion_output[10] ^ L_convertion_output[9] ^ reg_to_convertion[8] ^ L_convertion_output[7] ^ reg_to_convertion[6] ^ L_convertion_output[5] ^ L_convertion_output[4] ^ L_convertion_output[3] ^ L_convertion_output[2] ^ L_convertion_output[1] ^ L_convertion_output[0];
			if(counter == 4'b1111)
			begin
				state <= 4'b0010;
			end
			else
			begin
				counter <= counter + 1;
			end
		end
		4'b0010:
		begin
			finish_convertion <= 1;
			output_word <= {reg_to_convertion[15], reg_to_convertion[14], reg_to_convertion[13], reg_to_convertion[12], reg_to_convertion[11], reg_to_convertion[10], reg_to_convertion[9], reg_to_convertion[8], reg_to_convertion[7], reg_to_convertion[6], reg_to_convertion[5], reg_to_convertion[4], reg_to_convertion[3], reg_to_convertion[2], reg_to_convertion[1], reg_to_convertion[0]};
			/*output_word[127:120] <= reg_to_convertion[15];
			output_word[119:112] <= reg_to_convertion[14];
			output_word[111:104] <= reg_to_convertion[13];
			output_word[103:96] <= reg_to_convertion[12];
			output_word[95:88] <= reg_to_convertion[11];
			output_word[87:80] <= reg_to_convertion[10];
			output_word[79:72] <= reg_to_convertion[9];
			output_word[71:64] <= reg_to_convertion[8];
			output_word[63:56] <= reg_to_convertion[7];
			output_word[55:48] <= reg_to_convertion[6];
			output_word[47:40] <= reg_to_convertion[5];
			output_word[39:32] <= reg_to_convertion[4];
			output_word[31:24] <= reg_to_convertion[3];
			output_word[23:16] <= reg_to_convertion[2];
			output_word[15:8] <= reg_to_convertion[1];
			output_word[7:0] <= reg_to_convertion[0];*/
			if(enable == 0)
			begin
				state <= 0;
				finish_convertion <= 0;
			end
		end
	endcase
end

L_convertion_table_148 convertion_148_1(
	.input_bytes(reg_to_convertion[14]),
	.output_bytes(L_convertion_output[14])
);

L_convertion_table_32 convertion_32_1(
	.input_bytes(reg_to_convertion[13]),
	.output_bytes(L_convertion_output[13])
);

L_convertion_table_133 convertion_133_1(
	.input_bytes(reg_to_convertion[12]),
	.output_bytes(L_convertion_output[12])
);

L_convertion_table_16 convertion_16_1(
	.input_bytes(reg_to_convertion[11]),
	.output_bytes(L_convertion_output[11])
);

L_convertion_table_194 convertion_194_1(
	.input_bytes(reg_to_convertion[10]),
	.output_bytes(L_convertion_output[10])
);

L_convertion_table_192 convertion_192_1(
	.input_bytes(reg_to_convertion[9]),
	.output_bytes(L_convertion_output[9])
);



L_convertion_table_251 convertion_251(
	.input_bytes(reg_to_convertion[7]),
	.output_bytes(L_convertion_output[7])
);


L_convertion_table_192 convertion_192_2(
	.input_bytes(reg_to_convertion[5]),
	.output_bytes(L_convertion_output[5])
);


L_convertion_table_194 convertion_194_2(
	.input_bytes(reg_to_convertion[4]),
	.output_bytes(L_convertion_output[4])
);

L_convertion_table_16 convertion_16_2(
	.input_bytes(reg_to_convertion[3]),
	.output_bytes(L_convertion_output[3])
);

L_convertion_table_133 convertion_133_2(
	.input_bytes(reg_to_convertion[2]),
	.output_bytes(L_convertion_output[2])
);

L_convertion_table_32 convertion_32_2(
	.input_bytes(reg_to_convertion[1]),
	.output_bytes(L_convertion_output[1])
);

L_convertion_table_148 convertion_148_2(
	.input_bytes(reg_to_convertion[0]),
	.output_bytes(L_convertion_output[0])
);



endmodule
