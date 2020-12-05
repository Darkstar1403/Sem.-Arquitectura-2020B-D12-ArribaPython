`timescale 1ns/1ns
module ALU_Control(
input [5:0]func,
input [2:0] sel,
output reg [2:0] aluF
);

always @(*)
begin
	case(sel)
	3'b000:
		begin
		case(func)
			6'b100000:
				begin
					aluF = 3'b000;//SUMA
				end
			6'b100010:
				begin
					aluF = 3'b001;//RESTA
				end
			6'b100100:
				begin
					aluF = 3'b010;//AND
				end
			6'b100101:
				begin
					aluF = 3'b011;//OR
				end
			6'b101010:
				begin
					aluF = 3'b100;//SLT
				end
			6'b011000:
				begin
					aluF = 3'b101;//MULT
				end
			6'b011010:
				begin
					aluF = 3'b110;//DIV
				end
			6'b000000:
				begin
					aluF = 3'b111;//NOP
				end
		endcase
		end
	endcase
end
endmodule
