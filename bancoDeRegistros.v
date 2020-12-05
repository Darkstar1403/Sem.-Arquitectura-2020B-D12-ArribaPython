`timescale 1ns/1ns
module Banco_registros(
input[4:0] dirL1, dirL2, dirW,
input wr,
input[31:0] datoIn,
output reg [31:0] dataOut1, dataOut2
);
reg [31:0]BRegistros[31:0];

initial
begin
BRegistros[0] = 32'd12;
BRegistros[1] = 32'd45;
BRegistros[2] = 32'd2;
BRegistros[3] = 32'd50;
BRegistros[4] = 32'd47;
BRegistros[5] = 32'd64;
BRegistros[6] = 32'd24;
BRegistros[7] = 32'd7;
BRegistros[8] = 32'd132;
BRegistros[9] = 32'd127;
BRegistros[10] = 32'd38;
BRegistros[11] = 32'd96;
BRegistros[12] = 32'd35;
BRegistros[13] = 32'd94;
BRegistros[14] = 32'd82;
BRegistros[15] = 32'd22;
BRegistros[16] = 32'd130;
BRegistros[17] = 32'd101;
BRegistros[18] = 32'd177;
BRegistros[19] = 32'd115;
end

always @(*)
begin

	if(wr == 1)
	begin
		BRegistros[dirW] = datoIn;
	end
	dataOut1 = BRegistros[dirL1];
	dataOut2 = BRegistros[dirL2]; 

end
endmodule
