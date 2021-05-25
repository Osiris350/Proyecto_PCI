/** 
* Se incluye el contenido de los archivos Recirculador_sintetizado.v 
* y Probador_Probador.v, los cuales contienen el modulo recirculador 
* y su probador
**/
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
	wire [7:0]dataOut0;
    wire [7:0]dataOut1;
	wire [7:0]dataOut2;
    wire [7:0]dataOut3;
	wire [7:0]dataOut4;
    wire [7:0]dataOut5;
	wire [7:0]dataOut6;
    wire [7:0]dataOut7;
	wire validOut0;
	wire validOut1;
	wire validOut2;
	wire validOut3;
	wire validOut4;
	wire validOut5;
	wire validOut6;
	wire validOut7;

	/** 
	* Se instancian los modulos del Recirculador_sintetizado y su probador,
	* y se conectan sus entradas y salidas a los correspondientes wires
	**/

	Recirculador_sintetizado recirculador(/*AUTOINST*/
                                  // Outputs
                                  .dataOut0             (dataOut0[7:0]),
                                  .dataOut1             (dataOut1[7:0]),
                                  .dataOut2             (dataOut2[7:0]),
                                  .dataOut3             (dataOut3[7:0]),
                                  .dataOut4             (dataOut4[7:0]),
                                  .dataOut5             (dataOut5[7:0]),
                                  .dataOut6             (dataOut6[7:0]),
                                  .dataOut7             (dataOut7[7:0]),
                                  .validOut0            (validOut0),
                                  .validOut1            (validOut1),
                                  .validOut2            (validOut2),
                                  .validOut3            (validOut3),
                                  .validOut4            (validOut4),
                                  .validOut5            (validOut5),
                                  .validOut6            (validOut6),
                                  .validOut7            (validOut7),
                                  // Inputs
                                  .clk                  (clk),
                                  .dataIn0              (dataIn0[7:0]),
                                  .dataIn1              (dataIn1[7:0]),
                                  .dataIn2              (dataIn2[7:0]),
                                  .dataIn3              (dataIn3[7:0]),
                                  .validIn0             (validIn0),
                                  .validIn1             (validIn1),
                                  .validIn2             (validIn2),
                                  .validIn3             (validIn3),
                                  .selector_IDLE        (selector_IDLE));

	Probador_Recirculador signals_generator(/*AUTOINST*/
                                  // Outputs
                                  .dataOut0             (dataOut0[7:0]),
                                  .dataOut1             (dataOut1[7:0]),
                                  .dataOut2             (dataOut2[7:0]),
                                  .dataOut3             (dataOut3[7:0]),
                                  .dataOut4             (dataOut4[7:0]),
                                  .dataOut5             (dataOut5[7:0]),
                                  .dataOut6             (dataOut6[7:0]),
                                  .dataOut7             (dataOut7[7:0]),
                                  .validOut0            (validOut0),
                                  .validOut1            (validOut1),
                                  .validOut2            (validOut2),
                                  .validOut3            (validOut3),
                                  .validOut4            (validOut4),
                                  .validOut5            (validOut5),
                                  .validOut6            (validOut6),
                                  .validOut7            (validOut7),
                                  // Inputs
                                  .clk                  (clk),
                                  .dataIn0              (dataIn0[7:0]),
                                  .dataIn1              (dataIn1[7:0]),
                                  .dataIn2              (dataIn2[7:0]),
                                  .dataIn3              (dataIn3[7:0]),
                                  .validIn0             (validIn0),
                                  .validIn1             (validIn1),
                                  .validIn2             (validIn2),
                                  .validIn3             (validIn3),
                                  .selector_IDLE        (selector_IDLE));
endmodule
