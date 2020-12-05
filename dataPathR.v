`timescale 1ns/1ns
module DataPathR(
input clk
);

wire [31:0] instOut;//Memoria de instrucciones a UC, BR, MUXBR, 
wire regWrite;//Unidad de Control a Banco de Registro
wire [31:0]RData1, RData2;//Banco de Registro a ALU y Mem, el segundo va al mux
wire [31:0]MuxBrOut;//MUX21BR a ALU
wire [2:0]UALUOp;//Unidad de Control a ALU Control
wire memWrite;//Unidad de Control a Mem para activar escritura
wire memReg;//Unidad de control a Mux21
wire [2:0] ALUCout;//ALU Control a ALU
wire [31:0] ResALU;//ALU a Mem y MUX21
wire [31:0] ReadData;//Mem a MUX
wire [31:0] MuxOut;//MUX a Banco de Registro
wire regDist;// Unidad de Control a MUX21InstMem
wire branch;//Unidad de Control a MUXPc
wire memRead;//Unidad de Control a Mem para activar lectura
wire ALUSrc;//Unidad de Control a MUX21BR
wire c1;//AND de branch y zeroflag
wire zeroF;
wire [31:0]Mux21Pc;//Mux21Pc a Pc
wire [31:0]adderOut;//adderPc a MUX21Pc
wire [31:0]pcOut;//Pc a memoria de instrucciones y adderPc
wire [4:0]muxInstOut;//MUXInstMem a banco de resgistros

Pc pc(
.dirIn(Mux21Pc), .clk(clk), .dirOut(pcOut)
);

Imemoria instMem(
.pcDir(pcOut), .instOut(instOut)
);

AdderPc add(
.pcIn(pcOut), .dataOut(adderOut)
);

UC UCDR(
.opCode(instOut[31:26]), .amemToReg(memReg), .regWrite(regWrite), 
.amemToWrite(memWrite),.branch(branch), .ALUSrc(ALUSrc), 
.amemToRead(memRead), .regDist(regDist), .aluOp(UALUOp)
);

MUX21 mux1(
.memOut(ReadData), .aluOut(ResALU), .sel(memReg), .dataOut(MuxOut)
);

MUX21INST muxInst(
.rtOut(instOut[20:16]), .rdOut(instOut[15:11]), .sel(regDist), .dataOut(muxInstOut)
);

MUX21PC muxPc(
.shiftOut(32'd0), .addPcOut(adderOut), .sel(32'd0), .dataOut(Mux21Pc)
);

Banco_registros BR
(
.dirL1(instOut[25:21]), .dirL2(instOut[20:16]),
.dirW(muxInstOut),.wr(regWrite), .datoIn(MuxOut),
.dataOut1(RData1), .dataOut2(RData2)
);

MUX21BR muxBr(
.signOut(32'd0), .brOut(RData2), .sel(ALUSrc), .dataOut(MuxBrOut)
);

assign c1= branch & zeroF; //assign de la compuerta and que se conecta al muxPc

ALU_Control ALUC(.func(instOut[5:0]), .sel(UALUOp), .aluF(ALUCout));

ALU alu (.A(RData1), .B(MuxBrOut), .SEL(ALUCout), .RESULTADO(ResALU), .ZF(zeroF));

AMem mem(.dir(ResALU), .dataIn(RData2), .wr(memWrite), .rd(memRead), .dataOut(ReadData));

endmodule