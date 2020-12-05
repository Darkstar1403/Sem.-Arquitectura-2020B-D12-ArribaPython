`timescale 1ns/1ns
module MUX21PC(
input [31:0] shiftOut,addPcOut,
input sel,
output reg [31:0] dataOut
);

always @(*)
begin
	case(sel)
		1'b1:
		begin
			dataOut = shiftOut;
		end
		1'b0:
		begin
			dataOut = addPcOut;
		end
	endcase
end
endmodule
