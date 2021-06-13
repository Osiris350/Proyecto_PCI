`timescale 	1ns	/ 1ns

`include "Phy_Rx.v"
`include "Phy_Rx_synth.v"
`include "Phy_Tx.v"
`include "Phy_Tx_synth.v"

`include "cmos_cells.v"
`include "Probador_Entrega3.v"

module BancoPrueba_Final;

	wire [7:0] dataIn0, dataIn1, dataIn2, dataIn3;
	wire validIn0, validIn1, validIn2, validIn3;

	wire clk_4f, clk_2f, clk_f, clk_32f, reset;

    wire SerialOut_cond, SerialOutTx_cond;
    wire [7:0] dataOutProbador0_cond, dataOutProbador1_cond, dataOutProbador2_cond, dataOutProbador3_cond;
    wire validOutProbador0_cond, validOutProbador1_cond, validOutProbador2_cond, validOutProbador3_cond;

    wire [7:0] dataOut0_Rx_cond, dataOut1_Rx_cond, dataOut2_Rx_cond, dataOut3_Rx_cond;
    wire validOut0_Rx_cond, validOut1_Rx_cond, validOut2_Rx_cond, validOut3_Rx_cond;

	wire SerialOut_synth, SerialOutTx_synth;
    wire [7:0] dataOutProbador0_synth, dataOutProbador1_synth, dataOutProbador2_synth, dataOutProbador3_synth;
    wire validOutProbador0_synth, validOutProbador1_synth, validOutProbador2_synth, validOutProbador3_synth;

    wire [7:0] dataOut0_Rx_synth, dataOut1_Rx_synth, dataOut2_Rx_synth, dataOut3_Rx_synth;
    wire validOut0_Rx_synth, validOut1_Rx_synth, validOut2_Rx_synth, validOut3_Rx_synth;

	Phy_Tx phyTx (/*AUTOINST*/
		      // Outputs
		      .dataOutProbador0_cond(dataOutProbador0_cond[7:0]),
		      .dataOutProbador1_cond(dataOutProbador1_cond[7:0]),
		      .dataOutProbador2_cond(dataOutProbador2_cond[7:0]),
		      .dataOutProbador3_cond(dataOutProbador3_cond[7:0]),
		      .validOutProbador0_cond(validOutProbador0_cond),
		      .validOutProbador1_cond(validOutProbador1_cond),
		      .validOutProbador2_cond(validOutProbador2_cond),
		      .validOutProbador3_cond(validOutProbador3_cond),
		      .SerialOutTx_cond	(SerialOutTx_cond),
		      // Inputs
		      .dataIn0		(dataIn0[7:0]),
		      .dataIn1		(dataIn1[7:0]),
		      .dataIn2		(dataIn2[7:0]),
		      .dataIn3		(dataIn3[7:0]),
		      .validIn0		(validIn0),
		      .validIn1		(validIn1),
		      .validIn2		(validIn2),
		      .validIn3		(validIn3),
		      .active		(SerialOut_cond),
		      .reset		(reset),
		      .clk_f		(clk_f),
		      .clk_2f		(clk_2f),
		      .clk_4f		(clk_4f),
		      .clk_32f		(clk_32f));

	Phy_Tx_synth phyTx_s(/*AUTOINST*/
			     // Outputs
			     .SerialOutTx_synth	(SerialOutTx_synth),
			     .dataOutProbador0_synth(dataOutProbador0_synth[7:0]),
			     .dataOutProbador1_synth(dataOutProbador1_synth[7:0]),
			     .dataOutProbador2_synth(dataOutProbador2_synth[7:0]),
			     .dataOutProbador3_synth(dataOutProbador3_synth[7:0]),
			     .validOutProbador0_synth(validOutProbador0_synth),
			     .validOutProbador1_synth(validOutProbador1_synth),
			     .validOutProbador2_synth(validOutProbador2_synth),
			     .validOutProbador3_synth(validOutProbador3_synth),
			     // Inputs
			     .active		(SerialOut_synth),
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

    Phy_Rx phyRx (/*AUTOINST*/
		  // Outputs
		  .SerialOut_cond	(SerialOut_cond),
		  .dataOut0_Rx_cond	(dataOut0_Rx_cond[7:0]),
		  .dataOut1_Rx_cond	(dataOut1_Rx_cond[7:0]),
		  .dataOut2_Rx_cond	(dataOut2_Rx_cond[7:0]),
		  .dataOut3_Rx_cond	(dataOut3_Rx_cond[7:0]),
		  .validOut0_Rx_cond	(validOut0_Rx_cond),
		  .validOut1_Rx_cond	(validOut1_Rx_cond),
		  .validOut2_Rx_cond	(validOut2_Rx_cond),
		  .validOut3_Rx_cond	(validOut3_Rx_cond),
		  // Inputs
		  .SerialIn		(SerialOutTx_cond),
		  .reset		(reset),
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  .clk_32f		(clk_32f));

	Phy_Rx_synth phyRx_s(/*AUTOINST*/
			     // Outputs
			     .SerialOut_synth	(SerialOut_synth),
			     .dataOut0_Rx_synth	(dataOut0_Rx_synth[7:0]),
			     .dataOut1_Rx_synth	(dataOut1_Rx_synth[7:0]),
			     .dataOut2_Rx_synth	(dataOut2_Rx_synth[7:0]),
			     .dataOut3_Rx_synth	(dataOut3_Rx_synth[7:0]),
			     .validOut0_Rx_synth(validOut0_Rx_synth),
			     .validOut1_Rx_synth(validOut1_Rx_synth),
			     .validOut2_Rx_synth(validOut2_Rx_synth),
			     .validOut3_Rx_synth(validOut3_Rx_synth),
			     // Inputs
			     .SerialIn		(SerialOutTx_synth),
			     .clk_2f		(clk_2f),
			     .clk_32f		(clk_32f),
			     .clk_4f		(clk_4f),
			     .clk_f		(clk_f),
			     .reset		(reset));


	Probador_Entrega3 probador( /*AUTOINST*/
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
				   .clk_f		(clk_f),
				   .clk_32f		(clk_32f),
				   .reset		(reset),
				   // Inputs
				   .dataOutProbador0_cond(dataOutProbador0_cond[7:0]),
				   .dataOutProbador1_cond(dataOutProbador1_cond[7:0]),
				   .dataOutProbador2_cond(dataOutProbador2_cond[7:0]),
				   .dataOutProbador3_cond(dataOutProbador3_cond[7:0]),
				   .validOutProbador0_cond(validOutProbador0_cond),
				   .validOutProbador1_cond(validOutProbador1_cond),
				   .validOutProbador2_cond(validOutProbador2_cond),
				   .validOutProbador3_cond(validOutProbador3_cond),
				   .SerialOutTx_cond	(SerialOutTx_cond),
				   .SerialOut_cond	(SerialOut_cond),
				   .dataOut0_Rx_cond	(dataOut0_Rx_cond[7:0]),
				   .dataOut1_Rx_cond	(dataOut1_Rx_cond[7:0]),
				   .dataOut2_Rx_cond	(dataOut2_Rx_cond[7:0]),
				   .dataOut3_Rx_cond	(dataOut3_Rx_cond[7:0]),
				   .validOut0_Rx_cond	(validOut0_Rx_cond),
				   .validOut1_Rx_cond	(validOut1_Rx_cond),
				   .validOut2_Rx_cond	(validOut2_Rx_cond),
				   .validOut3_Rx_cond	(validOut3_Rx_cond),
				   .dataOutProbador0_synth(dataOutProbador0_synth[7:0]),
				   .dataOutProbador1_synth(dataOutProbador1_synth[7:0]),
				   .dataOutProbador2_synth(dataOutProbador2_synth[7:0]),
				   .dataOutProbador3_synth(dataOutProbador3_synth[7:0]),
				   .validOutProbador0_synth(validOutProbador0_synth),
				   .validOutProbador1_synth(validOutProbador1_synth),
				   .validOutProbador2_synth(validOutProbador2_synth),
				   .validOutProbador3_synth(validOutProbador3_synth),
				   .SerialOutTx_synth	(SerialOutTx_synth),
				   .SerialOut_synth	(SerialOut_synth),
				   .dataOut0_Rx_synth	(dataOut0_Rx_synth[7:0]),
				   .dataOut1_Rx_synth	(dataOut1_Rx_synth[7:0]),
				   .dataOut2_Rx_synth	(dataOut2_Rx_synth[7:0]),
				   .dataOut3_Rx_synth	(dataOut3_Rx_synth[7:0]),
				   .validOut0_Rx_synth	(validOut0_Rx_synth),
				   .validOut1_Rx_synth	(validOut1_Rx_synth),
				   .validOut2_Rx_synth	(validOut2_Rx_synth),
				   .validOut3_Rx_synth	(validOut3_Rx_synth));
endmodule
