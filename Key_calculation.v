`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:17 11/13/2023 
// Design Name: 
// Module Name:    key_calculation 
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



module Key_calculation(
	input enable,
	input clk,
	input [255:0] key,
	output reg [127:0] key_1,
	output reg [127:0] key_2,
	output reg [127:0] key_3,
	output reg [127:0] key_4,
	output reg [127:0] key_5,
	output reg [127:0] key_6,
	output reg [127:0] key_7,
	output reg [127:0] key_8,
	output reg [127:0] key_9,
	output reg [127:0] key_10,
	output reg finish,
	output reg [127:0] reg_transform,
	output reg [127:0] reg_right,
	output reg [127:0] reg_left
);

	reg [4:0] state; // состояния автомата
	reg [4:0] counter; // счетчик итераций фейстеля 
	//константы для вычисления ключей
	reg [127:0] constants [31:0];

	
	wire [127:0] S_converter_out;
	wire [127:0] L_converter_out;

	wire L_convertion_finish;
	reg L_convertion_enable;
	

	
	reg [127:0] keys_calculate [9:0];
	integer i;
	initial
	begin
		for(i = 0; i < 10; i = i + 1)
			keys_calculate[i] = 128'b0;
		reg_left = 0;
		reg_right = 0;
		reg_transform = 0;
		key_1 = 0;
		key_2 = 0;
		key_3 = 0;
		key_4 = 0;
		key_5 = 0;
		key_6 = 0;
		key_7 = 0;
		key_8 = 0;
		key_9 = 0;
		key_10 = 0;
		state = 0;
		counter = 0;
		L_convertion_enable = 0;
		finish = 0;
		
		//константы из сайта
		constants[0] = 128'h6ea276726c487ab85d27bd10dd849401;
		constants[1] = 128'hdc87ece4d890f4b3ba4eb92079cbeb02;
		constants[2] = 128'hb2259a96b4d88e0be7690430a44f7f03;
		constants[3] = 128'h7bcd1b0b73e32ba5b79cb140f2551504;
		constants[4] = 128'h156f6d791fab511deabb0c502fd18105;
		constants[5] = 128'ha74af7efab73df160dd208608b9efe06;
		constants[6] = 128'hc9e8819dc73ba5ae50f5b570561a6a07;
		constants[7] = 128'hf6593616e6055689adfba18027aa2a08;
		
		constants[8] = 128'h98FB40648A4D2C31F0DC1C90FA2EBE09;
		constants[9] = 128'h2ADEDAF23E95A23A17B518A05E61C10A;
		constants[10] = 128'h447CAC8052DDD8824A92A5B083E5550B;
		constants[11] = 128'h8D942D1D95E67D2C1A6710C0D5FF3F0C;
		constants[12] = 128'hE3365B6FF9AE07944740ADD0087BAB0D;
		constants[13] = 128'h5113C1F94D76899FA029A9E0AC34D40E;
		constants[14] = 128'h3FB1B78B213EF327FD0E14F071B0400F;
		constants[15] = 128'h2FB26C2C0F0AACD1993581C34E975410;
		
		constants[16] = 128'h41101A5E6342D669C4123CD39313C011;
		constants[17] = 128'hF33580C8D79A5862237B38E3375CBF12;
		constants[18] = 128'h9D97F6BABBD222DA7E5C85F3EAD82B13;
		constants[19] = 128'h547F77277CE987742EA93083BCC24114;
		constants[20] = 128'h3ADD015510A1FDCC738E8D936146D515;
		constants[21] = 128'h88F89BC3A47973C794E789A3C509AA16;
		constants[22] = 128'hE65AEDB1C831097FC9C034B3188D3E17;
		constants[23] = 128'hD9EB5A3AE90FFA5834CE2043693D7E18;
		
		constants[24] = 128'hB7492C48854780E069E99D53B4B9EA19;
		constants[25] = 128'h056CB6DE319F0EEB8E80996310F6951A;
		constants[26] = 128'h6BCEC0AC5DD77453D3A72473CD72011B;
		constants[27] = 128'hA22641319AECD1FD835291039B686B1C;
		constants[28] = 128'hCC843743F6A4AB45DE752C1346ECFF1D;
		constants[29] = 128'h7EA1ADD5427C254E391C2823E2A3801E;
		constants[30] = 128'h1003DBA72E345FF6643B95333F27141F;
		constants[31] = 128'h5EA7D8581E149B61F16AC1459CEDA820;
		
		/*
		//константы из реализации питона
		constants[0] = 128'h019484DD10BD275DB87A486C7276A26E;
		constants[1] = 128'h02EBCB7920B94EBAB3F490D8E4EC87DC;
		constants[2] = 128'h037F4FA4300469E70B8ED8B4969A25B2;
		constants[3] = 128'h041555F240B19CB7A52BE3730B1BCD7B;
		constants[4] = 128'h0581D12F500CBBEA1D51AB1F796D6F15;
		constants[5] = 128'h06FE9E8B6008D20D16DF73ABEFF74AA7;
		constants[6] = 128'h076A1A5670B5F550AEA53BC79D81E8C9;
		constants[7] = 128'h082AAA2780A1FBAD895605E6163659F6;
		constants[8] = 128'h09BE2EFA901CDCF0312C4D8A6440FB98;
		constants[9] = 128'h0AC1615EA018B5173AA2953EF2DADE2A;
		constants[10] = 128'h0B55E583B0A5924A82D8DD5280AC7C44;
		constants[11] = 128'h0C3FFFD5C010671A2C7DE6951D2D948D;
		constants[12] = 128'h0DAB7B08D0AD40479407AEF96F5B36E3;
		constants[13] = 128'h0ED434ACE0A929A09F89764DF9C11351;
		constants[14] = 128'h0F40B071F0140EFD27F33E218BB7B13F;
		constants[15] = 128'h1054974EC3813599D1AC0A0F2C6CB22F;
		constants[16] = 128'h11C01393D33C12C469D642635E1A1041;
		constants[17] = 128'h12BF5C37E3387B2362589AD7C88035F3;
		constants[18] = 128'h132BD8EAF3855C7EDA22D2BBBAF6979D;
		constants[19] = 128'h1441C2BC8330A92E7487E97C27777F54;
		constants[20] = 128'h15D54661938D8E73CCFDA1105501DD3A;
		constants[21] = 128'h16AA09C5A389E794C77379A4C39BF888;
		constants[22] = 128'h173E8D18B334C0C97F0931C8B1ED5AE6;
		constants[23] = 128'h187E3D694320CE3458FA0FE93A5AEBD9;
		constants[24] = 128'h19EAB9B4539DE969E0804785482C49B7;
		constants[25] = 128'h1A95F6106399808EEB0E9F31DEB66C05;
		constants[26] = 128'h1B0172CD7324A7D35374D75DACC0CE6B;
		constants[27] = 128'h1C6B689B03915283FDD1EC9A314126A2;
		constants[28] = 128'h1DFFEC46132C75DE45ABA4F6433784CC;
		constants[29] = 128'h1E80A3E223281C394E257C42D5ADA17E;
		constants[30] = 128'h1F14273F33953B64F65F342EA7DB0310;
		constants[31] = 128'h20A8ED9C45C16AF1619B141E58D8A75E;
	*/

	end
//константы из реализации питона

	// вычисление ключей
	always @(posedge clk)
	begin
		case(state)
		5'b0:
		begin
			counter <= 0;
			finish <= 0;
			if(enable == 1)
			begin
				state <= 5'b00001;
				reg_left <= key[255:128];
				reg_right <= key[127:0];
				keys_calculate[0] <= key[255:128];
				keys_calculate[1] <= key[127:0];
			end
		end
		5'b00001:
		begin
			reg_left <= reg_left ^ constants[counter];
			reg_transform <= reg_left;
			state <= 5'b00010;
		end
		5'b00010:
		begin
			reg_left <= S_converter_out;
			state <= 5'b00011;
			L_convertion_enable <= 1;
		end
		5'b00011:
		begin
			if(L_convertion_finish == 1)
			begin
				reg_left <= L_converter_out;
				L_convertion_enable <= 0;
				state <= 5'b00100;
			end
		end
		5'b00100:
		begin
			reg_left <= reg_left ^ reg_right;
			state <= 5'b00101;
		end
		5'b00101:
		begin
			reg_right <= reg_transform;
			state <= 5'b00110;
		end
		5'b00110:
		begin
			if((counter + 1) % 8 == 0)
			begin
				if(counter == 31)
				begin
					keys_calculate[8] <= reg_left;
					keys_calculate[9] <= reg_right;
					state <= 5'b00111;
				end
				else
				begin
					keys_calculate[((counter + 1) / 4)] <= reg_left;
					keys_calculate[((counter + 1) / 4) + 1] <= reg_right;
					counter <= counter + 1;
					state <= 5'b00001;
				end
			end
			else
			begin
				counter <= counter + 1;
				state <= 5'b00001;
			end
		end
		5'b00111:
		begin
			key_1 <= keys_calculate[0];
			key_2 <= keys_calculate[1];
			key_3 <= keys_calculate[2];
			key_4 <= keys_calculate[3];
			key_5 <= keys_calculate[4];
			key_6 <= keys_calculate[5];
			key_7 <= keys_calculate[6];
			key_8 <= keys_calculate[7];
			key_9 <= keys_calculate[8];
			key_10 <= keys_calculate[9];
			finish <= 1;
			state <= 5'b01000;
		end
		5'b01000:
		begin
			if(enable == 0)
			begin
				state <= 0;
			end
		end
		endcase
	end
	
	
	L_convertion L_converter(
	.enable(L_convertion_enable),
	.clk(clk),
	.input_word(reg_left),
	.output_word(L_converter_out),
	.finish_convertion(L_convertion_finish)
	);
	
	S_convertion S_shiphrator0(
	.input_bytes(reg_left[127:120]),
	.output_bytes(S_converter_out[127:120])
	);
	
	S_convertion S_shiphrator1(
	.input_bytes(reg_left[119:112]),
	.output_bytes(S_converter_out[119:112])
	);
	
	S_convertion S_shiphrator2(
	.input_bytes(reg_left[111:104]),
	.output_bytes(S_converter_out[111:104])
	);
	
	S_convertion S_shiphrator3(
	.input_bytes(reg_left[103:96]),
	.output_bytes(S_converter_out[103:96])
	);
	
	S_convertion S_shiphrator4(
	.input_bytes(reg_left[95:88]),
	.output_bytes(S_converter_out[95:88])
	);
	
	S_convertion S_shiphrator5(
	.input_bytes(reg_left[87:80]),
	.output_bytes(S_converter_out[87:80])
	);
	
	S_convertion S_shiphrator6(
	.input_bytes(reg_left[79:72]),
	.output_bytes(S_converter_out[79:72])
	);
	
	S_convertion S_shiphrator7(
	.input_bytes(reg_left[71:64]),
	.output_bytes(S_converter_out[71:64])
	);
	
	S_convertion S_shiphrator8(
	.input_bytes(reg_left[63:56]),
	.output_bytes(S_converter_out[63:56])
	);
	
	S_convertion S_shiphrator9(
	.input_bytes(reg_left[55:48]),
	.output_bytes(S_converter_out[55:48])
	);
	
	S_convertion S_shiphrator10(
	.input_bytes(reg_left[47:40]),
	.output_bytes(S_converter_out[47:40])
	);
	
	S_convertion S_shiphrator11(
	.input_bytes(reg_left[39:32]),
	.output_bytes(S_converter_out[39:32])
	);
	
	S_convertion S_shiphrator12(
	.input_bytes(reg_left[31:24]),
	.output_bytes(S_converter_out[31:24])
	);
	
	S_convertion S_shiphrator13(
	.input_bytes(reg_left[23:16]),
	.output_bytes(S_converter_out[23:16])
	);
	
	S_convertion S_shiphrator14(
	.input_bytes(reg_left[15:8]),
	.output_bytes(S_converter_out[15:8])
	);
	
	S_convertion S_shiphrator15(
	.input_bytes(reg_left[7:0]),
	.output_bytes(S_converter_out[7:0])
	);
	
endmodule
