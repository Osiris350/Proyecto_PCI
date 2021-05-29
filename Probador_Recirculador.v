/** 
* Se incluye la directiva de compilar timescale para indicar el valor
* de cada unidad de tiempo.
* Unidad: 1ns
* Precision: 1ns
**/
`timescale 1ns/1ns

/**
* Modulo de prueba en el que se aplicaran las señales de entrada
* y se observaran las respuestas del modulo Recirculador
**/

module Probador_Recirculador(
	output reg clk_1,
	output reg [7:0]dataIn0,
	output reg[ 7:0]dataIn1,
	output reg [7:0]dataIn2,
	output reg [7:0]dataIn3,
	output reg validIn0,
    output reg validIn1,
    output reg validIn2,
    output reg validIn3,
	output reg selector_IDLE,
	input [7:0]dataOut0,
    input [7:0]dataOut1,
	input [7:0]dataOut2,
    input [7:0]dataOut3,
	input [7:0]dataOut4,
    input [7:0]dataOut5,
	input [7:0]dataOut6,
    input [7:0]dataOut7,
	input validOut0,
	input validOut1,
	input validOut2,
	input validOut3,
	input validOut4,
	input validOut5,
	input validOut6,
	input validOut7
	);

	reg clk_2, clk_3;
	/**
	* Los siguientes parameters serviran como entradas
	* de prueba para el recirculador
	**/

	parameter FF = 8'hFF;
	parameter BB = 8'hBB;
	parameter EE = 8'hEE;
	parameter AA = 8'hAA;
	parameter DD = 8'hDD;
	parameter x99 = 8'h99;
	parameter CC = 8'hCC;
	parameter x88 = 8'h88;
	parameter x77 = 8'h77;
	parameter X = 8'hx;

	initial 
		begin
			{clk_3, clk_2, selector_IDLE, validIn0, validIn1, validIn2, validIn3} = 0;
			clk_1 = 1;
		end

	always #2 clk_1 = ~clk_1;
	
	always@(posedge clk_1) clk_2 = ~clk_2;

	always@(posedge clk_2) clk_3 = ~clk_3;

	/** 
	* Se dispone de un initial block para estimular todas
	* las señales especificas en una sola prueba
	**/
	initial
		begin

			/**
			* Se define el nombre el archivo .vcd en cual se
			* guardaran todos los valores de las nets y regs que
			* cambian en la simulacion
			**/

			$dumpfile("Recirculador.vcd");
			$dumpvars; // Especificacion para que se guarden todas las variables en el archivo .vcd

			#2
			dataIn0 = FF;
			dataIn1 = EE;
			dataIn2 = DD;
			dataIn3 = CC;

			validIn0 = 1;
			validIn1 = 1;
			validIn2 = 1;
			validIn3 = 1;

			#4
			selector_IDLE = 1;

			#4
			dataIn0 = BB;
			dataIn1 = AA;
			dataIn2 = x99;
			dataIn3 = x88;

			#8
			dataIn0 = X;
			dataIn1 = X;
			dataIn2 = x77;
			dataIn3 = X;

			validIn0 = 0;
			validIn1 = 0;
			validIn3 = 0;

			#8
			dataIn2 = X;
			validIn2 = 0;

			/** 
			* Se dan 4 unidades de tiempo mas para poder
			* observar los resultados del ultima cambio
			* y se termina la simulacion con el keyword finish
			**/
			#4 $finish;
		end
endmodule
