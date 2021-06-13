`include "Phy_Tx.v"
`include "Phy_Rx.v"

module Phy(
    input [7:0] dataIn0,
    input [7:0] dataIn1,
    input [7:0] dataIn2,
    input [7:0] dataIn3,
    input validIn0,
    input validIn1,
    input validIn2,
    input validIn3,

    input reset,
    input clk_f,
    input clk_2f,
    input clk_4f,
    input clk_32f,

    output [7:0] dataOut0_cond,
    output [7:0] dataOut1_cond,
    output [7:0] dataOut2_cond,
    output [7:0] dataOut3_cond,
    output validOut0_cond,
    output validOut1_cond,
    output validOut2_cond,
    output validOut3_cond, 

    output [7:0] dataOutProbador0_cond,
    output [7:0] dataOutProbador1_cond,
    output [7:0] dataOutProbador2_cond,
    output [7:0] dataOutProbador3_cond,
    output validOutProbador0_cond,
    output validOutProbador1_cond,
    output validOutProbador2_cond,
    output validOutProbador3_cond);

    wire SerialOutTx_cond, SerialOut_cond;

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

    Phy_Rx phyRx (/*AUTOINST*/
		  // Outputs
		  .SerialOut_cond	(SerialOut_cond),
		  .dataOut0_Rx_cond	(dataOut0_cond[7:0]),
		  .dataOut1_Rx_cond	(dataOut1_cond[7:0]),
		  .dataOut2_Rx_cond	(dataOut2_cond[7:0]),
		  .dataOut3_Rx_cond	(dataOut3_cond[7:0]),
		  .validOut0_Rx_cond	(validOut0_cond),
		  .validOut1_Rx_cond	(validOut1_cond),
		  .validOut2_Rx_cond	(validOut2_cond),
		  .validOut3_Rx_cond	(validOut3_cond),
		  // Inputs
		  .SerialIn		(SerialOutTx_cond),
		  .reset		(reset),
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  .clk_32f		(clk_32f));

endmodule
