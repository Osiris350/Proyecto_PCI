module SerialParalelo_Tx(
	input clk_1,
	input clk_2,
	input reset,
	input IDLE_in,
	output reg IDLE_out_cond
	);

	reg active;
	reg [2:0] contador_COM = 3'b000;
	reg x7C;
	reg [7:0] temporal;
	reg [2:0] selector = 3'b000;

	initial
		begin
			contador_COM = 3'b000;
		end

	always@(posedge clk_1)
		begin
			if(reset == 0)
				begin
					active = 0;
					contador_COM = 3'b000;
					x7C = 0;
					selector <= 3'b000;
				end

			else if(reset == 1)
				begin
					case (selector)
						3'b000: temporal[7] <= IDLE_in;       
						3'b001: temporal[6] <= IDLE_in;                 
						3'b010: temporal[5] <= IDLE_in;                  
						3'b011: temporal[4] <= IDLE_in;
						3'b100: temporal[3] <= IDLE_in;  
						3'b101: temporal[2] <= IDLE_in;          
						3'b110: temporal[1] <= IDLE_in;          
						3'b111: temporal[0] <= IDLE_in;
					endcase

					if(selector !=  3'b111) selector <= selector + 1; 
					else if(selector == 3'b111) 
						begin
							if((temporal[7] == 1) & (temporal[6] == 0)) contador_COM = contador_COM + 1;
							selector <= 3'b000;
						end
				end
		end

	always@(posedge clk_2)
		begin
			active = (contador_COM >= 4) ? 1 : 0;

			if(temporal  == 8'b01111100) x7C = 1;
			else x7C = 0;

			IDLE_out_cond = active & x7C;
		end 
endmodule
