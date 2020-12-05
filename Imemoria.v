`timescale 1ns/1ns

module Imemoria(
input [31:0] pcDir,
output reg [31:0] instOut
);
//	Registro encargado de almacenar las instrucciones
reg [7:0] mem_inst [511:0];
//	Registros que me dice en que numero de indice voy
//	Ciclo encargado de mandar como una sola instruccion 4 celdas de memoria
always @(*)
begin
    instOut = {mem_inst[pcDir], mem_inst[pcDir + 1], mem_inst[pcDir + 2], mem_inst[pcDir + 3]};
end
initial 
begin
//000000_00000_00001_10100_00000_100000 SUMA $20 = $0+$1
mem_inst[0] = 8'b00000000;
mem_inst[1] = 8'b00000001; 
mem_inst[2] = 8'b10100000;
mem_inst[3] = 8'b00100000;
//000000_00101_00110_10101_00000_100010 RESTA $21 = $5-$6
mem_inst[4] = 8'b00000000;
mem_inst[5] = 8'b10100110; 
mem_inst[6] = 8'b10101000;
mem_inst[7] = 8'b00100010;
//000000_01010_01011_10110_00000_100100 AND $22 = $10 & $11
mem_inst[8] = 8'b00000001;
mem_inst[9] = 8'b01001011; 
mem_inst[10] = 8'b10110000;
mem_inst[11] = 8'b00100100;
//000000_01110_01111_10111_00000_100101 OR $23 = $14 | $15
mem_inst[12] = 8'b00000001;
mem_inst[13] = 8'b11001111; 
mem_inst[14] = 8'b10111000;
mem_inst[15] = 8'b00100101;
//000000_10010_10011_11000_00000_101010 SLT $24 = $18 < $17?1:0
mem_inst[16] = 8'b00000010;
mem_inst[17] = 8'b01010011; 
mem_inst[18] = 8'b11000000;
mem_inst[19] = 8'b00101010;
//000000_10011_01000_11001_00000_011000 MULTIPLICACION $25 = $19 * $8
mem_inst[20] = 8'b00000010;
mem_inst[21] = 8'b01101000; 
mem_inst[22] = 8'b11001000;
mem_inst[23] = 8'b00011000;
//000000_00011_00010_11010_00000_011010 DIVISION $26 = $3 / $2
mem_inst[24] = 8'b00000000;
mem_inst[25] = 8'b01100010; 
mem_inst[26] = 8'b11010000;
mem_inst[27] = 8'b00011010;
//000000_10010_10011_11011_00000_000000 NOP $27 = 0
mem_inst[28] = 8'b00000010;
mem_inst[29] = 8'b01010011; 
mem_inst[30] = 8'b11011000;
mem_inst[31] = 8'b00000000;
end
endmodule