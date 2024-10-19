`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:30 11/22/2023 
// Design Name: 
// Module Name:    L_convertion_table_148 
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
module S_convertion(
	input [7:0] input_bytes,
	output [7:0] output_bytes

);

	reg [7:0] array [0:255];
	
	
	initial
	begin
		array[ 0 ] = 8'h FC ;
		array[ 1 ] = 8'h  EE ;
		array[ 2 ] = 8'h  DD ;
		array[ 3 ] = 8'h  11 ;
		array[ 4 ] = 8'h  CF ;
		array[ 5 ] = 8'h  6E ;
		array[ 6 ] = 8'h  31 ;
		array[ 7 ] = 8'h  16 ;
		array[ 8 ] = 8'h  FB ;
		array[ 9 ] = 8'h  C4 ;
		array[ 10 ] = 8'h  FA ;
		array[ 11 ] = 8'h  DA ;
		array[ 12 ] = 8'h  23 ;
		array[ 13 ] = 8'h  C5 ;
		array[ 14 ] = 8'h  04 ;
		array[ 15 ] = 8'h  4D ;
		array[ 16 ] = 8'h E9 ;
		array[ 17 ] = 8'h  77 ;
		array[ 18 ] = 8'h  F0 ;
		array[ 19 ] = 8'h  DB ;
		array[ 20 ] = 8'h  93 ;
		array[ 21 ] = 8'h  2E ;
		array[ 22 ] = 8'h  99 ;
		array[ 23 ] = 8'h  BA ;
		array[ 24 ] = 8'h  17 ;
		array[ 25 ] = 8'h  36 ;
		array[ 26 ] = 8'h  F1 ;
		array[ 27 ] = 8'h  BB ;
		array[ 28 ] = 8'h  14 ;
		array[ 29 ] = 8'h  CD ;
		array[ 30 ] = 8'h  5F ;
		array[ 31 ] = 8'h  C1 ;
		array[ 32 ] = 8'h F9 ;
		array[ 33 ] = 8'h  18 ;
		array[ 34 ] = 8'h  65 ;
		array[ 35 ] = 8'h  5A ;
		array[ 36 ] = 8'h  E2 ;
		array[ 37 ] = 8'h  5C ;
		array[ 38 ] = 8'h  EF ;
		array[ 39 ] = 8'h  21 ;
		array[ 40 ] = 8'h  81 ;
		array[ 41 ] = 8'h  1C ;
		array[ 42 ] = 8'h  3C ;
		array[ 43 ] = 8'h  42 ;
		array[ 44 ] = 8'h  8B ;
		array[ 45 ] = 8'h  01 ;
		array[ 46 ] = 8'h  8E ;
		array[ 47 ] = 8'h  4F ;
		array[ 48 ] = 8'h 05 ;
		array[ 49 ] = 8'h  84 ;
		array[ 50 ] = 8'h  02 ;
		array[ 51 ] = 8'h  AE ;
		array[ 52 ] = 8'h  E3 ;
		array[ 53 ] = 8'h  6A ;
		array[ 54 ] = 8'h  8F ;
		array[ 55 ] = 8'h  A0 ;
		array[ 56 ] = 8'h  06 ;
		array[ 57 ] = 8'h  0B ;
		array[ 58 ] = 8'h  ED ;
		array[ 59 ] = 8'h  98 ;
		array[ 60 ] = 8'h  7F ;
		array[ 61 ] = 8'h  D4 ;
		array[ 62 ] = 8'h  D3 ;
		array[ 63 ] = 8'h  1F ;
		array[ 64 ] = 8'h EB ;
		array[ 65 ] = 8'h  34 ;
		array[ 66 ] = 8'h  2C ;
		array[ 67 ] = 8'h  51 ;
		array[ 68 ] = 8'h  EA ;
		array[ 69 ] = 8'h  C8 ;
		array[ 70 ] = 8'h  48 ;
		array[ 71 ] = 8'h  AB ;
		array[ 72 ] = 8'h  F2 ;
		array[ 73 ] = 8'h  2A ;
		array[ 74 ] = 8'h  68 ;
		array[ 75 ] = 8'h  A2 ;
		array[ 76 ] = 8'h  FD ;
		array[ 77 ] = 8'h  3A ;
		array[ 78 ] = 8'h  CE ;
		array[ 79 ] = 8'h  CC ;
		array[ 80 ] = 8'h B5 ;
		array[ 81 ] = 8'h  70 ;
		array[ 82 ] = 8'h  0E ;
		array[ 83 ] = 8'h  56 ;
		array[ 84 ] = 8'h  08 ;
		array[ 85 ] = 8'h  0C ;
		array[ 86 ] = 8'h  76 ;
		array[ 87 ] = 8'h  12 ;
		array[ 88 ] = 8'h  BF ;
		array[ 89 ] = 8'h  72 ;
		array[ 90 ] = 8'h  13 ;
		array[ 91 ] = 8'h  47 ;
		array[ 92 ] = 8'h  9C ;
		array[ 93 ] = 8'h  B7 ;
		array[ 94 ] = 8'h  5D ;
		array[ 95 ] = 8'h  87 ;
		array[ 96 ] = 8'h 15 ;
		array[ 97 ] = 8'h  A1 ;
		array[ 98 ] = 8'h  96 ;
		array[ 99 ] = 8'h  29 ;
		array[ 100 ] = 8'h  10 ;
		array[ 101 ] = 8'h  7B ;
		array[ 102 ] = 8'h  9A ;
		array[ 103 ] = 8'h  C7 ;
		array[ 104 ] = 8'h  F3 ;
		array[ 105 ] = 8'h  91 ;
		array[ 106 ] = 8'h  78 ;
		array[ 107 ] = 8'h  6F ;
		array[ 108 ] = 8'h  9D ;
		array[ 109 ] = 8'h  9E ;
		array[ 110 ] = 8'h  B2 ;
		array[ 111 ] = 8'h  B1 ;
		array[ 112 ] = 8'h 32 ;
		array[ 113 ] = 8'h  75 ;
		array[ 114 ] = 8'h  19 ;
		array[ 115 ] = 8'h  3D ;
		array[ 116 ] = 8'h  FF ;
		array[ 117 ] = 8'h  35 ;
		array[ 118 ] = 8'h  8A ;
		array[ 119 ] = 8'h  7E ;
		array[ 120 ] = 8'h  6D ;
		array[ 121 ] = 8'h  54 ;
		array[ 122 ] = 8'h  C6 ;
		array[ 123 ] = 8'h  80 ;
		array[ 124 ] = 8'h  C3 ;
		array[ 125 ] = 8'h  BD ;
		array[ 126 ] = 8'h  0D ;
		array[ 127 ] = 8'h  57 ;
		array[ 128 ] = 8'h DF ;
		array[ 129 ] = 8'h  F5 ;
		array[ 130 ] = 8'h  24 ;
		array[ 131 ] = 8'h  A9 ;
		array[ 132 ] = 8'h  3E ;
		array[ 133 ] = 8'h  A8 ;
		array[ 134 ] = 8'h  43 ;
		array[ 135 ] = 8'h  C9 ;
		array[ 136 ] = 8'h  D7 ;
		array[ 137 ] = 8'h  79 ;
		array[ 138 ] = 8'h  D6 ;
		array[ 139 ] = 8'h  F6 ;
		array[ 140 ] = 8'h  7C ;
		array[ 141 ] = 8'h  22 ;
		array[ 142 ] = 8'h  B9 ;
		array[ 143 ] = 8'h  03 ;
		array[ 144 ] = 8'h E0 ;
		array[ 145 ] = 8'h  0F ;
		array[ 146 ] = 8'h  EC ;
		array[ 147 ] = 8'h  DE ;
		array[ 148 ] = 8'h  7A ;
		array[ 149 ] = 8'h  94 ;
		array[ 150 ] = 8'h  B0 ;
		array[ 151 ] = 8'h  BC ;
		array[ 152 ] = 8'h  DC ;
		array[ 153 ] = 8'h  E8 ;
		array[ 154 ] = 8'h  28 ;
		array[ 155 ] = 8'h  50 ;
		array[ 156 ] = 8'h  4E ;
		array[ 157 ] = 8'h  33 ;
		array[ 158 ] = 8'h  0A ;
		array[ 159 ] = 8'h  4A ;
		array[ 160 ] = 8'h A7 ;
		array[ 161 ] = 8'h  97 ;
		array[ 162 ] = 8'h  60 ;
		array[ 163 ] = 8'h  73 ;
		array[ 164 ] = 8'h  1E ;
		array[ 165 ] = 8'h  00 ;
		array[ 166 ] = 8'h  62 ;
		array[ 167 ] = 8'h  44 ;
		array[ 168 ] = 8'h  1A ;
		array[ 169 ] = 8'h  B8 ;
		array[ 170 ] = 8'h  38 ;
		array[ 171 ] = 8'h  82 ;
		array[ 172 ] = 8'h  64 ;
		array[ 173 ] = 8'h  9F ;
		array[ 174 ] = 8'h  26 ;
		array[ 175 ] = 8'h  41 ;
		array[ 176 ] = 8'h AD ;
		array[ 177 ] = 8'h  45 ;
		array[ 178 ] = 8'h  46 ;
		array[ 179 ] = 8'h  92 ;
		array[ 180 ] = 8'h  27 ;
		array[ 181 ] = 8'h  5E ;
		array[ 182 ] = 8'h  55 ;
		array[ 183 ] = 8'h  2F ;
		array[ 184 ] = 8'h  8C ;
		array[ 185 ] = 8'h  A3 ;
		array[ 186 ] = 8'h  A5 ;
		array[ 187 ] = 8'h  7D ;
		array[ 188 ] = 8'h  69 ;
		array[ 189 ] = 8'h  D5 ;
		array[ 190 ] = 8'h  95 ;
		array[ 191 ] = 8'h  3B ;
		array[ 192 ] = 8'h 07 ;
		array[ 193 ] = 8'h  58 ;
		array[ 194 ] = 8'h  B3 ;
		array[ 195 ] = 8'h  40 ;
		array[ 196 ] = 8'h  86 ;
		array[ 197 ] = 8'h  AC ;
		array[ 198 ] = 8'h  1D ;
		array[ 199 ] = 8'h  F7 ;
		array[ 200 ] = 8'h  30 ;
		array[ 201 ] = 8'h  37 ;
		array[ 202 ] = 8'h  6B ;
		array[ 203 ] = 8'h  E4 ;
		array[ 204 ] = 8'h  88 ;
		array[ 205 ] = 8'h  D9 ;
		array[ 206 ] = 8'h  E7 ;
		array[ 207 ] = 8'h  89 ;
		array[ 208 ] = 8'h E1 ;
		array[ 209 ] = 8'h  1B ;
		array[ 210 ] = 8'h  83 ;
		array[ 211 ] = 8'h  49 ;
		array[ 212 ] = 8'h  4C ;
		array[ 213 ] = 8'h  3F ;
		array[ 214 ] = 8'h  F8 ;
		array[ 215 ] = 8'h  FE ;
		array[ 216 ] = 8'h  8D ;
		array[ 217 ] = 8'h  53 ;
		array[ 218 ] = 8'h  AA ;
		array[ 219 ] = 8'h  90 ;
		array[ 220 ] = 8'h  CA ;
		array[ 221 ] = 8'h  D8 ;
		array[ 222 ] = 8'h  85 ;
		array[ 223 ] = 8'h  61 ;
		array[ 224 ] = 8'h 20 ;
		array[ 225 ] = 8'h  71 ;
		array[ 226 ] = 8'h  67 ;
		array[ 227 ] = 8'h  A4 ;
		array[ 228 ] = 8'h  2D ;
		array[ 229 ] = 8'h  2B ;
		array[ 230 ] = 8'h  09 ;
		array[ 231 ] = 8'h  5B ;
		array[ 232 ] = 8'h  CB ;
		array[ 233 ] = 8'h  9B ;
		array[ 234 ] = 8'h  25 ;
		array[ 235 ] = 8'h  D0 ;
		array[ 236 ] = 8'h  BE ;
		array[ 237 ] = 8'h  E5 ;
		array[ 238 ] = 8'h  6C ;
		array[ 239 ] = 8'h  52 ;
		array[ 240 ] = 8'h 59 ;
		array[ 241 ] = 8'h  A6 ;
		array[ 242 ] = 8'h  74 ;
		array[ 243 ] = 8'h  D2 ;
		array[ 244 ] = 8'h  E6 ;
		array[ 245 ] = 8'h  F4 ;
		array[ 246 ] = 8'h  B4 ;
		array[ 247 ] = 8'h  C0 ;
		array[ 248 ] = 8'h  D1 ;
		array[ 249 ] = 8'h  66 ;
		array[ 250 ] = 8'h  AF ;
		array[ 251 ] = 8'h  C2 ;
		array[ 252 ] = 8'h  39 ;
		array[ 253 ] = 8'h  4B ;
		array[ 254 ] = 8'h  63 ;
		array[ 255 ] = 8'h  B6 ;
	end
	
	assign output_bytes = array[input_bytes];
	
endmodule