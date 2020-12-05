`timescale 1ns/1ns
module MUX21BR(
input [31:0] signOut,brOut,
input sel,
output reg [31:0] dataOut
);

always @(*)
begin
	case(sel)
		1'b1:
		begin
			dataOut = signOut;
		end
		1'b0:
		begin
			dataOut = brOut;
		end
	endcase
end
endmodule
