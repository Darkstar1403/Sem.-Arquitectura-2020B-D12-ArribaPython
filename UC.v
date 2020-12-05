`timescale 1ns/1ns
module UC(
input [5:0] opCode,
output reg amemToReg, regWrite, amemToWrite,
output reg branch, ALUSrc, amemToRead, regDist,
output reg [2:0]aluOp
);

always @(*)
begin
	case(opCode)
	6'b000000://Istrucciones tipo R
	begin
	aluOp = 3'b000;
	amemToReg = 1'b0;
	amemToWrite = 1'b0;
	regWrite = 1'b1;
	branch = 1'b1;
	ALUSrc = 1'b0;
	amemToRead = 1'b0;
	regDist = 1'b1;
	end
	default//Instrucciones tipo ?
	begin
	aluOp = 3'b111;
	amemToReg = 1'b1;
	amemToWrite = 1'b1;
	regWrite = 1'b1;
	branch = 1'b0;
	ALUSrc = 1'b1;
	amemToRead = 1'b1;
	regDist = 1'b0;
	end
	endcase
end
endmodule
