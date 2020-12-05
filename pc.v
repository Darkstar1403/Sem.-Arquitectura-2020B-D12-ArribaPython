`timescale 1ns/1ns
module Pc(
    input [31:0] dirIn,
    input clk,
    output reg [31:0] dirOut
);

reg [31:0] pc1;

always@(posedge clk)
begin
    if(clk == 1)
        begin
            dirOut = pc1;
            pc1 = dirIn;
        end
end
initial begin
    pc1 = 0;
end
endmodule
