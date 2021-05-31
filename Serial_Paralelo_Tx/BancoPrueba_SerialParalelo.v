/** 
* Se incluye el contenido de los archivos Recirculador_sintetizado.v 
* y Probador_Probador.v, los cuales contienen el modulo recirculador 
* y su probador
**/
`include "SerialParalelo_Tx.v"
//`include "SerialParalelo_Tx_sintetizado.v"
`include "Probador_SerialParalelo_Tx.v"
//`include "cmos_cells.v"

/**
* Modulo testbench para el Serial Paralelo transmisor diseñado
**/
module Testbench();

	/** 
	* Se declaran los wires que van a conectar cada una de las entradas
	* y salidas entre el modulo Recirculador_sintetizado y su probador
	**/
	wire clk;
	wire reset;
	wire [7:0] IDLE_in;
	wire IDLE_out;

	/** 
	* Se instancian los modulos del Recirculador_sintetizado y su probador,
	* y se conectan sus entradas y salidas a los correspondientes wires
	**/

	SerialParalelo_Tx sptx(.clk(clk), .reset(reset), .IDLE_in(IDLE_in), .IDLE_out(IDLE_out));
	Probador_SerialParalelo_Tx signals_generator(.clk_1(clk), .reset(reset), .IDLE_in(IDLE_in), .IDLE_out(IDLE_out));
endmodule