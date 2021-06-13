`timescale 	1ns	/ 1ns

`include "Phy.v"
`include "Phy_synth.v"

`include "cmos_cells.v"
`include "Probador_PHY.v"

module BancoPrueba_Final;

	wire [7:0] dataIn0, dataIn1, dataIn2, dataIn3;
	wire validIn0, validIn1, validIn2, validIn3;

	wire clk_4f, clk_2f, clk_f, clk_32f, reset;

    wire [7:0] dataOutProbador0_cond, dataOutProbador1_cond, dataOutProbador2_cond, dataOutProbador3_cond;
    wire validOutProbador0_cond, validOutProbador1_cond, validOutProbador2_cond, validOutProbador3_cond;

    wire [7:0] dataOut0_cond, dataOut1_cond, dataOut2_cond, dataOut3_cond;
    wire validOut0_cond, validOut1_cond, validOut2_cond, validOut3_cond;

	wire [7:0] dataOutProbador0_synth, dataOutProbador1_synth, dataOutProbador2_synth, dataOutProbador3_synth;
    wire validOutProbador0_synth, validOutProbador1_synth, validOutProbador2_synth, validOutProbador3_synth;

    wire [7:0] dataOut0_synth, dataOut1_synth, dataOut2_synth, dataOut3_synth;
    wire validOut0_synth, validOut1_synth, validOut2_synth, validOut3_synth;

	
    Phy phy_cond(/*AUTOINST*/
		 // Outputs
		 .dataOut0_cond		(dataOut0_cond[7:0]),
		 .dataOut1_cond		(dataOut1_cond[7:0]),
		 .dataOut2_cond		(dataOut2_cond[7:0]),
		 .dataOut3_cond		(dataOut3_cond[7:0]),
		 .validOut0_cond	(validOut0_cond),
		 .validOut1_cond	(validOut1_cond),
		 .validOut2_cond	(validOut2_cond),
		 .validOut3_cond	(validOut3_cond),
		 .dataOutProbador0_cond	(dataOutProbador0_cond[7:0]),
		 .dataOutProbador1_cond	(dataOutProbador1_cond[7:0]),
		 .dataOutProbador2_cond	(dataOutProbador2_cond[7:0]),
		 .dataOutProbador3_cond	(dataOutProbador3_cond[7:0]),
		 .validOutProbador0_cond(validOutProbador0_cond),
		 .validOutProbador1_cond(validOutProbador1_cond),
		 .validOutProbador2_cond(validOutProbador2_cond),
		 .validOutProbador3_cond(validOutProbador3_cond),
		 // Inputs
		 .dataIn0		(dataIn0[7:0]),
		 .dataIn1		(dataIn1[7:0]),
		 .dataIn2		(dataIn2[7:0]),
		 .dataIn3		(dataIn3[7:0]),
		 .validIn0		(validIn0),
		 .validIn1		(validIn1),
		 .validIn2		(validIn2),
		 .validIn3		(validIn3),
		 .reset			(reset),
		 .clk_f			(clk_f),
		 .clk_2f		(clk_2f),
		 .clk_4f		(clk_4f),
		 .clk_32f		(clk_32f));


	Phy_synth phy_synth(/*AUTOINST*/
			    // Outputs
			    .dataOut0_synth	(dataOut0_synth[7:0]),
			    .dataOut1_synth	(dataOut1_synth[7:0]),
			    .dataOut2_synth	(dataOut2_synth[7:0]),
			    .dataOut3_synth	(dataOut3_synth[7:0]),
			    .dataOutProbador0_synth(dataOutProbador0_synth[7:0]),
			    .dataOutProbador1_synth(dataOutProbador1_synth[7:0]),
			    .dataOutProbador2_synth(dataOutProbador2_synth[7:0]),
			    .dataOutProbador3_synth(dataOutProbador3_synth[7:0]),
			    .validOut0_synth	(validOut0_synth),
			    .validOut1_synth	(validOut1_synth),
			    .validOut2_synth	(validOut2_synth),
			    .validOut3_synth	(validOut3_synth),
			    .validOutProbador0_synth(validOutProbador0_synth),
			    .validOutProbador1_synth(validOutProbador1_synth),
			    .validOutProbador2_synth(validOutProbador2_synth),
			    .validOutProbador3_synth(validOutProbador3_synth),
			    // Inputs
			    .clk_2f		(clk_2f),
			    .clk_32f		(clk_32f),
			    .clk_4f		(clk_4f),
			    .clk_f		(clk_f),
			    .dataIn0		(dataIn0[7:0]),
			    .dataIn1		(dataIn1[7:0]),
			    .dataIn2		(dataIn2[7:0]),
			    .dataIn3		(dataIn3[7:0]),
			    .reset		(reset),
			    .validIn0		(validIn0),
			    .validIn1		(validIn1),
			    .validIn2		(validIn2),
			    .validIn3		(validIn3));

	Probador_PHY 	probador( /*AUTOINST*/
				 // Outputs
				 .dataIn0		(dataIn0[7:0]),
				 .dataIn1		(dataIn1[7:0]),
				 .dataIn2		(dataIn2[7:0]),
				 .dataIn3		(dataIn3[7:0]),
				 .validIn0		(validIn0),
				 .validIn1		(validIn1),
				 .validIn2		(validIn2),
				 .validIn3		(validIn3),
				 .clk_4f		(clk_4f),
				 .clk_2f		(clk_2f),
				 .clk_f			(clk_f),
				 .clk_32f		(clk_32f),
				 .reset			(reset),
				 // Inputs
				 .dataOutProbador0_cond	(dataOutProbador0_cond[7:0]),
				 .dataOutProbador1_cond	(dataOutProbador1_cond[7:0]),
				 .dataOutProbador2_cond	(dataOutProbador2_cond[7:0]),
				 .dataOutProbador3_cond	(dataOutProbador3_cond[7:0]),
				 .validOutProbador0_cond(validOutProbador0_cond),
				 .validOutProbador1_cond(validOutProbador1_cond),
				 .validOutProbador2_cond(validOutProbador2_cond),
				 .validOutProbador3_cond(validOutProbador3_cond),
				 .dataOut0_Rx_cond	(dataOut0_cond[7:0]),
				 .dataOut1_Rx_cond	(dataOut1_cond[7:0]),
				 .dataOut2_Rx_cond	(dataOut2_cond[7:0]),
				 .dataOut3_Rx_cond	(dataOut3_cond[7:0]),
				 .validOut0_Rx_cond	(validOut0_cond),
				 .validOut1_Rx_cond	(validOut1_cond),
				 .validOut2_Rx_cond	(validOut2_cond),
				 .validOut3_Rx_cond	(validOut3_cond),
				 .dataOutProbador0_synth(dataOutProbador0_synth[7:0]),
				 .dataOutProbador1_synth(dataOutProbador1_synth[7:0]),
				 .dataOutProbador2_synth(dataOutProbador2_synth[7:0]),
				 .dataOutProbador3_synth(dataOutProbador3_synth[7:0]),
				 .validOutProbador0_synth(validOutProbador0_synth),
				 .validOutProbador1_synth(validOutProbador1_synth),
				 .validOutProbador2_synth(validOutProbador2_synth),
				 .validOutProbador3_synth(validOutProbador3_synth),
				 .dataOut0_Rx_synth	(dataOut0_synth[7:0]),
				 .dataOut1_Rx_synth	(dataOut1_synth[7:0]),
				 .dataOut2_Rx_synth	(dataOut2_synth[7:0]),
				 .dataOut3_Rx_synth	(dataOut3_synth[7:0]),
				 .validOut0_Rx_synth	(validOut0_synth),
				 .validOut1_Rx_synth	(validOut1_synth),
				 .validOut2_Rx_synth	(validOut2_synth),
				 .validOut3_Rx_synth	(validOut3_synth));
endmodule
