module Recirculador(
	input clk,
	input [7:0]dataIn0,
	input [7:0]dataIn1,
	input [7:0]dataIn2,
	input [7:0]dataIn3,
	input validIn0,
    input validIn1,
    input validIn2,
    input validIn3,
	input selector_IDLE,
	output reg [7:0]dataOut0,	// Los dataOut de 0 a 3 son las salidas que van a la logica de muxes
    output reg [7:0]dataOut1,
	output reg [7:0]dataOut2,
    output reg [7:0]dataOut3,
	output reg [7:0]dataOut4,	// Los dataOut de 4 a 7 son las salidas que van devuelta al probador
    output reg [7:0]dataOut5,
	output reg [7:0]dataOut6,
    output reg [7:0]dataOut7,
	output reg validOut0,
	output reg validOut1,
	output reg validOut2,
	output reg validOut3,
	output reg validOut4,
	output reg validOut5,
	output reg validOut6,
	output reg validOut7
	);

	always@(*)
		begin
			if(selector_IDLE == 0)
				begin
					dataOut0 <= dataOut0;
					dataOut1 <= dataOut2;
					dataOut2 <= dataOut2;
					dataOut3 <= dataOut3;

					dataOut4 = dataIn0;
					dataOut5 = dataIn1;
					dataOut6 = dataIn2;
					dataOut7 = dataIn3;

					validOut0 <= validOut0;
					validOut1 <= validOut1;
					validOut2 <= validOut2;
					validOut3 <= validOut3;

					validOut4 = validIn0;
					validOut5 = validIn1;
					validOut6 = validIn2;
					validOut7 = validIn3;
				end

			if(selector_IDLE == 1)
				begin
					dataOut0 = dataIn0;
					dataOut1 = dataIn1;
					dataOut2 = dataIn2;
					dataOut3 = dataIn3;

					dataOut4 <= dataOut4;
					dataOut5 <= dataOut5;
					dataOut6 <= dataOut6;
					dataOut7 <= dataOut7;

					validOut0 = validIn0;
					validOut1 = validIn1;
					validOut2 = validIn2;
					validOut3 = validIn3;

					validOut4 <= validOut4;
					validOut5 <= validOut5;
					validOut6 <= validOut6;
					validOut7 <= validOut7;
				end
		end
endmodule