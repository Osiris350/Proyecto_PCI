`timescale 	1ns	/ 1ns

`include "DeMuxL1.v"
`include "DeMuxL2.v"
`include "probador_2.v"

module BancoPrueba_2;
	wire validIn0, validIn1;
	wire validOut0, validOut1, validOut2, validOut3, validOut4, validOut5;
	wire [7:0] dataIn0, dataIn1;
	wire [7:0] dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5;
	wire clk_1, clk_2, reset;
	wire selector;

	DeMuxL1			L1( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut0[7:0]),
				   .dataOut1		(dataOut1[7:0]),
				   .dataOut2		(dataOut2[7:0]),
				   .dataOut3		(dataOut3[7:0]),
				   .validOut0		(validOut0),
				   .validOut1		(validOut1),
				   .validOut2		(validOut2),
				   .validOut3		(validOut3),
				   // Inputs
				   .dataIn0		(dataIn0[7:0]),
				   .dataIn1		(dataIn1[7:0]),
				   .validIn0		(validIn0),
				   .validIn1		(validIn1),
				   .selector		(selector),
				   .clk			(clk_1),
				   .reset		(reset));

	DeMuxL2 			L2( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut4[7:0]),
				   .dataOut1		(dataOut5[7:0]),
				   .validOut0		(validOut4),
				   .validOut1		(validOut5),
				   // Inputs
				   .dataIn		(dataIn0[7:0]),
				   .validIn		(validIn0),
				   .selector		(selector),
				   .clk			(clk_1),
				   .reset		(reset));

	probador_2 			probador( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut0[7:0]),
				   .dataOut1		(dataOut1[7:0]),
				   .dataOut2		(dataOut2[7:0]),
				   .dataOut3		(dataOut3[7:0]),
				   .dataOut4		(dataOut4[7:0]),
				   .dataOut5		(dataOut5[7:0]),
				   .validOut0		(validOut0),
				   .validOut1		(validOut1),
				   .validOut2		(validOut2),
				   .validOut3		(validOut3),
				   .validOut4		(validOut4),
				   .validOut5		(validOut5),
				   // Inputs
				   .dataIn0		(dataIn0[7:0]),
				   .dataIn1		(dataIn1[7:0]),
				   .validIn0		(validIn0),
				   .validIn1		(validIn1),
				   .selector		(selector),
				   .clk_1			(clk_1),
				   .clk_2			(clk_2),
				   .reset		(reset));
endmodule
