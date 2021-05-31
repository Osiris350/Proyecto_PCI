/** 
* Se incluye la directiva de compilar timescale para indicar el valor
* de cada unidad de tiempo.
* Unidad: 1ns
* Precision: 1ns
**/
`timescale 1ns/1ns

/**
* Modulo de prueba en el que se aplicaran las señales de entrada
* y se observaran las respuestas del modulo Serial Paralelo transmisor
**/

module Probador_SerialParalelo_Tx(
	output reg clk_1,
	output reg reset,
	output reg [7:0] IDLE_in,
	input IDLE_out
	);

	reg clk_2, clk_3;
	/**
	* Los siguientes parameters serviran como entradas
	* de prueba para el recirculador
	**/

	parameter x7C = 8'b01111100;
	parameter xBC = 8'b10111100;
	parameter X = 8'hx;

	initial 
		begin
			{clk_3, clk_2} = 0;
			{clk_1, reset} = 1;
			IDLE_in = X;
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

			$dumpfile("SerialParalelo_Tx.vcd");
			$dumpvars; // Especificacion para que se guarden todas las variables en el archivo .vcd

			#2
			reset = 1;
			IDLE_in = xBC;

			#16
			IDLE_in = x7C;

			#8
			reset = 0;

			/** 
			* Se dan 8 unidades de tiempo mas para poder
			* observar los resultados del ultima cambio
			* y se termina la simulacion con el keyword finish
			**/
			#8 $finish;
		end
endmodule
