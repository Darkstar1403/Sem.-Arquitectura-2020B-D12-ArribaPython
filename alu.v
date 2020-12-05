`timescale 1ns/1ns
module ALU(
input [31:0]A, B,
input [2:0] SEL,
output reg [31:0]RESULTADO,
output reg ZF
);
wire [31:0]SUMA, RESTA, AND, OR, SLT, MULTI, DIV;

assign SUMA = A + B;
assign RESTA = A - B;
assign AND = A & B;
assign OR = A | B;
assign MULTI = A * B;
assign DIV = A / B;



always @(*)
begin
	case(SEL)
		3'b000:
			begin
				RESULTADO = SUMA;
			end
		3'b001:
			begin
				RESULTADO = RESTA;
			end
		3'b010:
			begin
				RESULTADO = AND;
			end
		3'b011:
			begin
				RESULTADO = OR;
			end
		3'b100:
			begin
			if(A < B)
				begin
				RESULTADO = 32'd1;
				end
			else
				begin
				RESULTADO = 32'd0;
				end
			end
		3'b101:
			begin
				RESULTADO = MULTI;
			end
		3'b110:
			begin
				RESULTADO = DIV;
			end
		3'b111:
			begin
				RESULTADO = 32'd0;
			end

	endcase
	if(RESULTADO == 0)
	begin
		ZF = 1;
	end
	else
	begin
		ZF = 0;
	end
end
endmodule