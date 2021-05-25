`timescale 	100ns	/ 1ns

`include "cmos_cells.v"
`include "mux_L1_synth.v"
`include "mux_L2_synth.v"
`include "demux_L1_synth.v"
`include "demux_L2_synth.v"
`include "probador_1.v"

module BancoPrueba_1;
	wire validIn0, validIn1, validIn2, validIn3;
	wire validOut0, validOut1, validOut2, validOut3,validOut4, validOut5, validOut6, validOut7, validOut8;
	wire [7:0] dataIn0, dataIn1, dataIn2, dataIn3;
	wire [7:0] dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8;
	wire clk_1, clk_2, clk_3,reset;
	wire selector0, selector1;

	mux_L1_synth	L1( /*AUTOINST*/
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
				   .selector		(selector0),
				   .clk			(clk_2),
				   .reset		(reset));

	mux_L2_synth 			L2( /*AUTOINST*/
				   // Outputs
				   .dataOut		(dataOut2[7:0]),
				   .validOut		(validOut2),
				   // Inputs
				   .dataIn0		(dataOut0[7:0]),
				   .dataIn1		(dataOut1[7:0]),
				   .validIn0		(validOut0),
				   .validIn1		(validOut1),
				   .selector		(selector1),
				   .clk			(clk_1),
				   .reset		(reset));
	
	demux_L2_synth 		DeL2( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut3[7:0]),
				   .dataOut1		(dataOut4[7:0]),
				   .validOut0		(validOut3),
				   .validOut1		(validOut4),
				   // Inputs
				   .dataIn		    (dataOut2[7:0]),
				   .validIn		    (validOut2),
				   .selector		(selector1),
				   .clk			    (clk_2),
				   .reset		    (reset));

	demux_L1_synth			DeL1( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOut5[7:0]),
				   .dataOut1		(dataOut6[7:0]),
				   .dataOut2		(dataOut7[7:0]),
				   .dataOut3		(dataOut8[7:0]),
				   .validOut0		(validOut5),
				   .validOut1		(validOut6),
				   .validOut2		(validOut7),
				   .validOut3		(validOut8),
				   // Inputs
				   .dataIn0		(dataOut3[7:0]),
				   .dataIn1		(dataOut4[7:0]),
				   .validIn0		(validOut3),
				   .validIn1		(validOut4),
				   .selector		(selector0),
				   .clk				(clk_3),
				   .reset			(reset));

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
						 .selector0		(selector0),
						 .selector1		(selector1),
						 .clk_1			(clk_1),
						 .clk_2			(clk_2),
						 .clk_3 		(clk_3),
						 .reset			(reset),
						 // Inputs
						 .dataOut0		(dataOut0[7:0]),
						 .dataOut1		(dataOut1[7:0]),
						 .dataOut2		(dataOut2[7:0]),
						 .dataOut3		(dataOut3[7:0]),
						 .dataOut4		(dataOut4[7:0]),
						 .dataOut5		(dataOut5[7:0]),
						 .dataOut6		(dataOut6[7:0]),
						 .dataOut7		(dataOut7[7:0]),
						 .dataOut8		(dataOut8[7:0]),
						 .validOut0		(validOut0),
						 .validOut1		(validOut1),
						 .validOut2		(validOut2),
						 .validOut3		(validOut3),
						 .validOut4		(validOut4),
						 .validOut5		(validOut5),
						 .validOut6		(validOut6),
						 .validOut7		(validOut7),
						 .validOut8		(validOut8)
						 );
endmodule
