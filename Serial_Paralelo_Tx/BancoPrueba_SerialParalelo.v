/** 
* Se incluye el contenido de los archivos Recirculador_sintetizado.v 
* y Probador_Probador.v, los cuales contienen el modulo recirculador 
* y su probador
**/
`include "SerialParalelo_Tx.v"
`include "SerialParalelo_Tx_sintetizado.v"
`include "Probador_SerialParalelo_Tx.v"
`include "cmos_cells.v"

/**
* Modulo testbench para el Serial Paralelo transmisor diseñado
**/
module Testbench();

	/** 
	* Se declaran los wires que van a conectar cada una de las entradas
	* y salidas entre el modulo Recirculador_sintetizado y su probador
	**/
	wire clk_1;
	wire clk_2;
	wire reset;
	wire IDLE_in;
	wire IDLE_out_cond;
	wire IDLE_out_synth;

	/** 
	* Se instancian los modulos del Recirculador_sintetizado y su probador,
	* y se conectan sus entradas y salidas a los correspondientes wires
	**/

	SerialParalelo_Tx sptx_cond(/*AUTOINST*/
				    // Outputs
				    .IDLE_out_cond	(IDLE_out_cond),
				    // Inputs
				    .clk_1		(clk_1),
				    .clk_2		(clk_2),
				    .reset		(reset),
				    .IDLE_in		(IDLE_in));
	Probador_SerialParalelo_Tx signals_generator_cond(clk_1, clk_2, reset, IDLE_in, IDLE_out_cond);

	SerialParalelo_Tx_sintetizado sptx_synth(/*AUTOINST*/
						 // Outputs
						 .IDLE_out_synth	(IDLE_out_synth),
						 // Inputs
						 .IDLE_in		(IDLE_in),
						 .clk_1			(clk_1),
						 .clk_2			(clk_2),
						 .reset			(reset));
	Probador_SerialParalelo_Tx signals_generator_synth(clk_1, clk_2, reset, IDLE_in, IDLE_out_synth);
endmodule
