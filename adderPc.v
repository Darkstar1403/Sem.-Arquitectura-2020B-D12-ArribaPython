`timescale 1ns/1ns

module AdderPc(
    input [31:0] pcIn,
    output reg[31:0] dataOut
);
integer b4;
always@(*)begin
    b4 = 3'b100;
    case(b4)
	3'b100:	
		begin
    			dataOut = pcIn + b4;
		end
    endcase	
end

initial
begin
	dataOut = 32'd0;
end
endmodule