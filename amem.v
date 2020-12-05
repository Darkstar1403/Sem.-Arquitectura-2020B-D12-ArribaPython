`timescale 1ns/1ns
module AMem(
input [31:0] dir,
input [31:0] dataIn,
input wr,rd,
output reg [31:0] dataOut
);
//Bloque de memoria o matriz
reg [31:0]bmem[31:0];
//always
always @(*)
begin
	if(wr == 1)
	begin
		bmem[dir] = dataIn;
	end
	if(rd == 1)
	begin
		dataOut = bmem[dir];
	end
end

endmodule
