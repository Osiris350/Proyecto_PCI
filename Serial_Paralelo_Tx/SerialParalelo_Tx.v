module SerialParalelo_Tx(
	input 				clk,
	input 				reset,
	input [7:0] 		IDLE_in,
	output reg	 		IDLE_out
	);

	reg active;
	reg [2:0]contador_COM = 0;
	reg x7C;

	always@(posedge clk)
		begin
			if(reset == 0)
				begin
					active = 0;
					contador_COM = 3'b000;
					x7C = 0;
				end

			else if(reset == 1)
				begin
					if(IDLE_in == 8'b10111100) contador_COM += 1;
					active = (contador_COM >= 4) ? 1 : 0;

					if(IDLE_in  == 8'b01111100) x7C = 1;
					else x7C = 0;
				end

			IDLE_out = active & x7C;
		end
endmodule
