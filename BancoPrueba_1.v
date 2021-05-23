`timescale 	1ns	/ 1ns

`include "MuxL1.v"
`include "MuxL2.v"
`include "probador_1.v"

module BancoPrueba_1;
	wire validIn0, validIn1, validIn2, validIn3;
	wire validOut0, validOut1, validOut2;
	wire [7:0] dataIn0, dataIn1, dataIn2, dataIn3;
	wire [7:0] dataOut0, dataOut1, dataOut2;
	wire clk_1, clk_2, reset;
	wire selector;

	MuxL1			L1( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut0[7:0]),
				   .dataOut1		(dataOut1[7:0]),
				   .validOut0		(validOut0),
				   .validOut1		(validOut1),
				   // Inputs
				   .dataIn0		(dataIn0[7:0]),
				   .dataIn1		(dataIn1[7:0]),
				   .dataIn2		(dataIn2[7:0]),
				   .dataIn3		(dataIn3[7:0]),
				   .validIn0		(validIn0),
				   .validIn1		(validIn1),
				   .validIn2		(validIn2),
				   .validIn3		(validIn3),
				   .selector		(selector),
				   .clk			(clk_1),
				   .reset		(reset));

	MuxL2 			L2( /*AUTOINST*/
				   // Outputs
				   .dataOut		(dataOut2[7:0]),
				   .validOut		(validOut2),
				   // Inputs
				   .dataIn0		(dataIn0[7:0]),
				   .dataIn1		(dataIn1[7:0]),
				   .validIn0		(validIn0),
				   .validIn1		(validIn1),
				   .selector		(selector),
				   .clk			(clk_1),
				   .reset		(reset));

	probador_1 			probador( /*AUTOINST*/
						 // Outputs
						 .dataIn0		(dataIn0[7:0]),
						 .dataIn1		(dataIn1[7:0]),
						 .dataIn2		(dataIn2[7:0]),
						 .dataIn3		(dataIn3[7:0]),
						 .validIn0		(validIn0),
						 .validIn1		(validIn1),
						 .validIn2		(validIn2),
						 .validIn3		(validIn3),
						 .selector		(selector),
						 .clk_1			(clk_1),
						 .clk_2			(clk_2),
						 .reset			(reset),
						 // Inputs
						 .dataOut0		(dataOut0[7:0]),
						 .dataOut1		(dataOut1[7:0]),
						 .dataOut2		(dataOut2[7:0]),
						 .validOut0		(validOut0),
						 .validOut1		(validOut1),
						 .validOut2		(validOut2));
endmodule
