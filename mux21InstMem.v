`timescale 1ns/1ns
module MUX21INST(
input [4:0] rtOut,rdOut,
input sel,
output reg [4:0] dataOut
);

always @(*)
begin
	case(sel)
		1'b1:
		begin
			dataOut = rdOut;
		end
		1'b0:
		begin
			dataOut = rtOut;
		end
	endcase
end
endmodule
