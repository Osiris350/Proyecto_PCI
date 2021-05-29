/** 
* Se incluye el contenido de los archivos Recirculador_sintetizado.v 
* y Probador_Probador.v, los cuales contienen el modulo recirculador 
* y su probador
**/
`include "Recirculador.v"
`include "Recirculador_sintetizado.v"
`include "Probador_Recirculador.v"
`include "cmos_cells.v"

/**
* Modulo testbench para el recirculador diseñado
**/
module Testbench();

	/** 
	* Se declaran los wires que van a conectar cada una de las entradas
	* y salidas entre el modulo Recirculador_sintetizado y su probador
	**/
	wire clk;
	wire [7:0]dataIn0;
	wire [7:0]dataIn1;
	wire [7:0]dataIn2;
	wire [7:0]dataIn3;
	wire validIn0;
    wire validIn1;
    wire validIn2;
    wire validIn3;
	wire selector_IDLE;
    wire [7:0]dataOut0_cond;
    wire [7:0]dataOut1_cond;
	wire [7:0]dataOut2_cond;
    wire [7:0]dataOut3_cond;
	wire [7:0]dataOut4_cond;
    wire [7:0]dataOut5_cond;
	wire [7:0]dataOut6_cond;
    wire [7:0]dataOut7_cond;
	wire validOut0_cond;
	wire validOut1_cond;
	wire validOut2_cond;
	wire validOut3_cond;
	wire validOut4_cond;
	wire validOut5_cond;
	wire validOut6_cond;
	wire validOut7_cond;
    wire [7:0]dataOut0_synth;
    wire [7:0]dataOut1_synth;
	wire [7:0]dataOut2_synth;
    wire [7:0]dataOut3_synth;
	wire [7:0]dataOut4_synth;
    wire [7:0]dataOut5_synth;
	wire [7:0]dataOut6_synth;
    wire [7:0]dataOut7_synth;
	wire validOut0_synth;
	wire validOut1_synth;
	wire validOut2_synth;
	wire validOut3_synth;
	wire validOut4_synth;
	wire validOut5_synth;
	wire validOut6_synth;
	wire validOut7_synth;

	/** 
	* Se instancian los modulos del Recirculador_sintetizado y su probador,
	* y se conectan sus entradas y salidas a los correspondientes wires
	**/

	Recirculador recirculador_cond(/*AUTOINST*/
				       // Outputs
				       .dataOut0_cond	(dataOut0_cond[7:0]),
				       .dataOut1_cond	(dataOut1_cond[7:0]),
				       .dataOut2_cond	(dataOut2_cond[7:0]),
				       .dataOut3_cond	(dataOut3_cond[7:0]),
				       .dataOut4_cond	(dataOut4_cond[7:0]),
				       .dataOut5_cond	(dataOut5_cond[7:0]),
				       .dataOut6_cond	(dataOut6_cond[7:0]),
				       .dataOut7_cond	(dataOut7_cond[7:0]),
				       .validOut0_cond	(validOut0_cond),
				       .validOut1_cond	(validOut1_cond),
				       .validOut2_cond	(validOut2_cond),
				       .validOut3_cond	(validOut3_cond),
				       .validOut4_cond	(validOut4_cond),
				       .validOut5_cond	(validOut5_cond),
				       .validOut6_cond	(validOut6_cond),
				       .validOut7_cond	(validOut7_cond),
				       // Inputs
				       .clk		(clk),
				       .dataIn0		(dataIn0[7:0]),
				       .dataIn1		(dataIn1[7:0]),
				       .dataIn2		(dataIn2[7:0]),
				       .dataIn3		(dataIn3[7:0]),
				       .validIn0	(validIn0),
				       .validIn1	(validIn1),
				       .validIn2	(validIn2),
				       .validIn3	(validIn3),
				       .selector_IDLE	(selector_IDLE));

	Probador_Recirculador signals_generator_cond(
						     // Outputs
						     .clk_1			(clk),
						     .dataIn0		(dataIn0[7:0]),
						     .dataIn1		(dataIn1[7:0]),
						     .dataIn2		(dataIn2[7:0]),
						     .dataIn3		(dataIn3[7:0]),
						     .validIn0		(validIn0),
						     .validIn1		(validIn1),
						     .validIn2		(validIn2),
						     .validIn3		(validIn3),
						     .selector_IDLE	(selector_IDLE),
						     // Inputs
						     .dataOut0		(dataOut0_cond[7:0]),
						     .dataOut1		(dataOut1_cond[7:0]),
						     .dataOut2		(dataOut2_cond[7:0]),
						     .dataOut3		(dataOut3_cond[7:0]),
						     .dataOut4		(dataOut4_cond[7:0]),
						     .dataOut5		(dataOut5_cond[7:0]),
						     .dataOut6		(dataOut6_cond[7:0]),
						     .dataOut7		(dataOut7_cond[7:0]),
						     .validOut0		(validOut0_cond),
						     .validOut1		(validOut1_cond),
						     .validOut2		(validOut2_cond),
						     .validOut3		(validOut3_cond),
						     .validOut4		(validOut4_cond),
						     .validOut5		(validOut5_cond),
						     .validOut6		(validOut6_cond),
						     .validOut7		(validOut7_cond));

	Recirculador_sintetizado recirculador_synth(/*AUTOINST*/
						    // Outputs
						    .dataOut0_synth	(dataOut0_synth[7:0]),
						    .dataOut1_synth	(dataOut1_synth[7:0]),
						    .dataOut2_synth	(dataOut2_synth[7:0]),
						    .dataOut3_synth	(dataOut3_synth[7:0]),
						    .dataOut4_synth	(dataOut4_synth[7:0]),
						    .dataOut5_synth	(dataOut5_synth[7:0]),
						    .dataOut6_synth	(dataOut6_synth[7:0]),
						    .dataOut7_synth	(dataOut7_synth[7:0]),
						    .validOut0_synth	(validOut0_synth),
						    .validOut1_synth	(validOut1_synth),
						    .validOut2_synth	(validOut2_synth),
						    .validOut3_synth	(validOut3_synth),
						    .validOut4_synth	(validOut4_synth),
						    .validOut5_synth	(validOut5_synth),
						    .validOut6_synth	(validOut6_synth),
						    .validOut7_synth	(validOut7_synth),
						    // Inputs
						    .clk		(clk),
						    .dataIn0		(dataIn0[7:0]),
						    .dataIn1		(dataIn1[7:0]),
						    .dataIn2		(dataIn2[7:0]),
						    .dataIn3		(dataIn3[7:0]),
						    .selector_IDLE	(selector_IDLE),
						    .validIn0		(validIn0),
						    .validIn1		(validIn1),
						    .validIn2		(validIn2),
						    .validIn3		(validIn3));

    Probador_Recirculador signals_generator_synth(
						  // Outputs
						  .clk_1		(clk),
						  .dataIn0		(dataIn0[7:0]),
						  .dataIn1		(dataIn1[7:0]),
						  .dataIn2		(dataIn2[7:0]),
						  .dataIn3		(dataIn3[7:0]),
						  .validIn0		(validIn0),
						  .validIn1		(validIn1),
						  .validIn2		(validIn2),
						  .validIn3		(validIn3),
						  .selector_IDLE	(selector_IDLE),
						  // Inputs
						  .dataOut0		(dataOut0_synth[7:0]),
						  .dataOut1		(dataOut1_synth[7:0]),
						  .dataOut2		(dataOut2_synth[7:0]),
						  .dataOut3		(dataOut3_synth[7:0]),
						  .dataOut4		(dataOut4_synth[7:0]),
						  .dataOut5		(dataOut5_synth[7:0]),
						  .dataOut6		(dataOut6_synth[7:0]),
						  .dataOut7		(dataOut7_synth[7:0]),
						  .validOut0		(validOut0_synth),
						  .validOut1		(validOut1_synth),
						  .validOut2		(validOut2_synth),
						  .validOut3		(validOut3_synth),
						  .validOut4		(validOut4_synth),
						  .validOut5		(validOut5_synth),
						  .validOut6		(validOut6_synth),
						  .validOut7		(validOut7_synth));
endmodule
