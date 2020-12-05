`timescale 1ns/1ns
module tb_dataPathR();
reg clk = 0;

DataPathR DUV(.clk(clk));

always #100 clk = ~(clk);

initial
begin
#3300;
$stop;
end

endmodule
