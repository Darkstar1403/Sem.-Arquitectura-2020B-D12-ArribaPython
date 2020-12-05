`timescale 1ns/1ns
module MUX21(
input [31:0] memOut,aluOut,
input sel,
output reg [31:0] dataOut
);

always @(*)
begin
	case(sel)
		1'b1:
		begin
			dataOut = memOut;
		end
		1'b0:
		begin
			dataOut = aluOut;
		end
	endcase
end
endmodule
