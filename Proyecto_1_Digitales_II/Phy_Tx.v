`include "Recirculador.v"
`include "MuxL1.v"
`include "MuxL2.v"
`include "ParaleloSerial_PhyTX.v"
`include "SerialParalelo_PhyTX.v"

module Phy_Tx(
    input [7:0] dataIn0,
    input [7:0] dataIn1,
    input [7:0] dataIn2,
    input [7:0] dataIn3,
    input validIn0,
    input validIn1,
    input validIn2,
    input validIn3,
    input active,

    input reset,
    input clk_f,
    input clk_2f,
    input clk_4f,
    input clk_32f,

    output  [7:0] dataOutProbador0_cond,
    output  [7:0] dataOutProbador1_cond,
    output  [7:0] dataOutProbador2_cond,
    output  [7:0] dataOutProbador3_cond,
    output  validOutProbador0_cond,
    output  validOutProbador1_cond,
    output  validOutProbador2_cond,
    output  validOutProbador3_cond,

    output  SerialOutTx_cond);

    wire [7:0] dataOut0_cond, dataOut1_cond, dataOut2_cond, dataOut3_cond;
	wire validOut0_cond, validOut1_cond, validOut2_cond, validOut3_cond;

    wire [7:0] dataOutL1_0, dataOutL1_1, dataOutL2;
	wire validOutL1_0, validOutL1_1, validOutL2;

    wire IDLE_out;

    Recirculador recirculador(/*AUTOINST*/
		//Outputs
		//Logica Muxes
		.dataOut0_cond (dataOut0_cond[7:0]),
		.dataOut1_cond (dataOut1_cond[7:0]),
		.dataOut2_cond (dataOut2_cond[7:0]),
		.dataOut3_cond (dataOut3_cond[7:0]),
		//Probador
		.dataOut4_cond (dataOutProbador0_cond[7:0]),
		.dataOut5_cond (dataOutProbador1_cond[7:0]),
		.dataOut6_cond (dataOutProbador2_cond[7:0]),
		.dataOut7_cond (dataOutProbador3_cond[7:0]),
		//Logica Muxes
		.validOut0_cond (validOut0_cond),
		.validOut1_cond (validOut1_cond),
		.validOut2_cond (validOut2_cond),
		.validOut3_cond (validOut3_cond),
		//Probador
		.validOut4_cond (validOutProbador0_cond),
		.validOut5_cond (validOutProbador1_cond),
		.validOut6_cond (validOutProbador2_cond),
		.validOut7_cond (validOutProbador3_cond),
		//Inputs
		.clk           (clk_32f),
		.dataIn0       (dataIn0[7:0]),
		.dataIn1       (dataIn1[7:0]), 
		.dataIn2       (dataIn2[7:0]),
		.dataIn3       (dataIn3[7:0]),
		.validIn0      (validIn0),
		.validIn1	   (validIn1),
		.validIn2	   (validIn2),
		.validIn3	   (validIn3),
		.reset         (reset),
		.selector_IDLE (IDLE_out));

    MuxL1	L1( /*AUTOINST*/
				   // Outputs
				   .dataOut0		(dataOutL1_0[7:0]),
				   .dataOut1		(dataOutL1_1[7:0]),
				   .validOut0		(validOutL1_0),
				   .validOut1		(validOutL1_1),
				   // Inputs
				   .dataIn0		(dataOut0_cond[7:0]),
				   .dataIn1		(dataOut1_cond[7:0]),
				   .dataIn2		(dataOut2_cond[7:0]),
				   .dataIn3		(dataOut3_cond[7:0]),
				   .validIn0		(validOut0_cond),
				   .validIn1		(validOut1_cond),
				   .validIn2		(validOut2_cond),
				   .validIn3		(validOut3_cond),
				   .clk			    (clk_2f),
				   .reset		    (reset));

	MuxL2 	L2( /*AUTOINST*/
				   // Outputs
				   .dataOut		(dataOutL2[7:0]),
				   .validOut		(validOutL2),
				   // Inputs
				   .dataIn0		(dataOutL1_0[7:0]),
				   .dataIn1		(dataOutL1_1[7:0]),
				   .validIn0		(validOutL1_0),
				   .validIn1		(validOutL1_1),
				   .clk			    (clk_4f),
				   .reset		    (reset));
    
    ParaleloSerial_PhyTX ParaleloSerial_PhyTX_C(/*AUTOINST*/
		//Outputs
		.outputS_cond	(SerialOutTx_cond),
		//Inputs
		.clk			(clk_32f),
		.validIn        (validOutL2),
		.reset          (reset),
        .inputP         (dataOutL2[7:0]));

    SerialParalelo_PhyTX SerialParalelo_Tx_C(/*AUTOINST*/
		//outputs
		.IDLE_out_cond (IDLE_out),
		//Inputs
		.clk_1         (clk_32f),
		.clk_2         (clk_4f),
		.reset         (reset),
		.IDLE_in       (active));

endmodule
