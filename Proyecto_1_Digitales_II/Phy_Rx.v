`include "DeMuxL1.v"
`include "DeMuxL2.v"
`include "SerialParalelo_PhyRX.v"
`include "ParaleloSerial_PhyRX.v"

module Phy_Rx(
    input SerialIn,
    input reset,
    input clk_f,
    input clk_2f,
    input clk_4f,
    input clk_32f,

    output  SerialOut_cond,
    output  [7:0] dataOut0_Rx_cond,
    output  [7:0] dataOut1_Rx_cond,
    output  [7:0] dataOut2_Rx_cond,
    output  [7:0] dataOut3_Rx_cond,
    output  validOut0_Rx_cond,
    output  validOut1_Rx_cond,
    output  validOut2_Rx_cond,
    output  validOut3_Rx_cond
    );

    wire [7:0] dataOut_PRx_cond;
    wire validOut_PRx_cond;
    wire active_cond;


    wire [7:0] dataOutDeL2_0_cond, dataOutDeL2_1_cond;
	wire validOut_DeL2_0_cond, validOut_DeL2_1_cond;

    SerialParalelo_PhyRX SerialParalelo_PhyRX_C( /*AUTOINST*/
												// Outputs
												.paralelo_cond   (dataOut_PRx_cond[7:0]),
												.validOut_cond   (validOut_PRx_cond),
												.active_cond     (active_cond),
												// Inputs
												.clk_4f     (clk_4f),
												.clk        (clk_32f),
												.serial     (SerialIn),
												.reset      (reset));

	ParaleloSerial_PhyRX ParaleloSerial_PhyRX_C( /*AUTOINST*/
												// Outputs
												.outputS_cond	(SerialOut_cond),
												// Inputs
												.clk			(clk_32f),
												.active_cond	(active_cond),
												.reset			(reset));

    DeMuxL2 DeL2( /*AUTOINST*/
				   // Outputs
				   .dataOut0_cond	(dataOutDeL2_0_cond[7:0]),
				   .dataOut1_cond	(dataOutDeL2_1_cond[7:0]),
				   .validOut0_cond	(validOut_DeL2_0_cond),
				   .validOut1_cond	(validOut_DeL2_1_cond),
				   // Inputs
				   .dataIn		    (dataOut_PRx_cond[7:0]),
				   .validIn		    (validOut_PRx_cond),
				   .clk			    (clk_4f),
				   .reset		    (reset));

    DeMuxL1	DeL1( /*AUTOINST*/
				   // Outputs
				   .dataOut0_cond	(dataOut0_Rx_cond[7:0]),
				   .dataOut1_cond	(dataOut1_Rx_cond[7:0]),
				   .dataOut2_cond	(dataOut2_Rx_cond[7:0]),
				   .dataOut3_cond	(dataOut3_Rx_cond[7:0]),
				   .validOut0_cond	(validOut0_Rx_cond),
				   .validOut1_cond	(validOut1_Rx_cond),
				   .validOut2_cond	(validOut2_Rx_cond),
				   .validOut3_cond	(validOut3_Rx_cond),
				   // Inputs
				   .dataIn0			(dataOutDeL2_0_cond[7:0]),
				   .dataIn1			(dataOutDeL2_1_cond[7:0]),
				   .validIn0		(validOut_DeL2_0_cond),
				   .validIn1		(validOut_DeL2_1_cond),
				   .clk				(clk_2f),
				   .reset			(reset));
endmodule
