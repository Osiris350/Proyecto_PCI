`timescale 	1ns	/ 1ns
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
	input reset,
	output reg [7:0]dataOut0_cond,	// Los dataOut de 0 a 3 son las salidas que van a la logica de muxes
    output reg [7:0]dataOut1_cond,
	output reg [7:0]dataOut2_cond,
    output reg [7:0]dataOut3_cond,
	output reg [7:0]dataOut4_cond,	// Los dataOut de 4 a 7 son las salidas que van devuelta al probador
    output reg [7:0]dataOut5_cond,
	output reg [7:0]dataOut6_cond,
    output reg [7:0]dataOut7_cond,
	output reg validOut0_cond,
	output reg validOut1_cond,
	output reg validOut2_cond,
	output reg validOut3_cond,
	output reg validOut4_cond,
	output reg validOut5_cond,
	output reg validOut6_cond,
	output reg validOut7_cond
	);

	always@(posedge clk)
		begin
			if(reset == 0)
				begin
					dataOut0_cond = 0;
					dataOut1_cond = 0;
					dataOut2_cond = 0;
					dataOut3_cond = 0;

					dataOut4_cond = 0;
					dataOut5_cond = 0;
					dataOut6_cond = 0;
					dataOut7_cond = 0;

					validOut0_cond = 0;
					validOut1_cond = 0;
					validOut2_cond = 0;
					validOut3_cond = 0;

					validOut4_cond = 0;
					validOut5_cond = 0;
					validOut6_cond = 0;
					validOut7_cond = 0;
				end

			else if(reset == 1)
				begin
					if(selector_IDLE == 0)
						begin
							dataOut0_cond <= dataOut0_cond;
							dataOut1_cond <= dataOut2_cond;
							dataOut2_cond <= dataOut2_cond;
							dataOut3_cond <= dataOut3_cond;

							dataOut4_cond = dataIn0;
							dataOut5_cond = dataIn1;
							dataOut6_cond = dataIn2;
							dataOut7_cond = dataIn3;

							validOut0_cond <= validOut0_cond;
							validOut1_cond <= validOut1_cond;
							validOut2_cond <= validOut2_cond;
							validOut3_cond <= validOut3_cond;

							validOut4_cond = validIn0;
							validOut5_cond = validIn1;
							validOut6_cond = validIn2;
							validOut7_cond = validIn3;
						end

					if(selector_IDLE == 1)
						begin
							dataOut0_cond = dataIn0;
							dataOut1_cond = dataIn1;
							dataOut2_cond = dataIn2;
							dataOut3_cond = dataIn3;

							dataOut4_cond <= dataOut4_cond;
							dataOut5_cond <= dataOut5_cond;
							dataOut6_cond <= dataOut6_cond;
							dataOut7_cond <= dataOut7_cond;

							validOut0_cond = validIn0;
							validOut1_cond = validIn1;
							validOut2_cond = validIn2;
							validOut3_cond = validIn3;

							validOut4_cond <= 0;
							validOut5_cond <= 0;
							validOut6_cond <= 0;
							validOut7_cond <= 0;
						end
				end
		end
always@(posedge selector_IDLE)
	begin
		dataOut4_cond <= dataIn0;
		dataOut5_cond <= dataIn1;
		dataOut6_cond <= dataIn2;
		dataOut7_cond <= dataIn3;
	end

endmodule
