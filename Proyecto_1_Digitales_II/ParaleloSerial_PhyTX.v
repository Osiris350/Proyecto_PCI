module ParaleloSerial_PhyTX(
	input clk,
	input validIn,
	input reset,
	input [7:0] inputP,
	output reg outputS_cond);
					

    reg[2:0] selector_cond; 

	initial begin
		selector_cond = 3'b000;
		outputS_cond  = 0;
	end

always @(posedge clk) begin
	if (reset == 0) begin
		selector_cond <= 3'b000;
	end
	else begin
		selector_cond <= selector_cond + 1;
	end
end

//Revisar entradas en cada flanco positivo del reloj
//Este modulo funciona como un Demux
always @(*) begin 
	if (reset == 0) begin
		outputS_cond  = 1'b0;
	end
	else if (validIn == 0) begin
		case(selector_cond) // si el valid es 0 pone un BC en la salida. 
			3'b000: outputS_cond = 1;        
			3'b001: outputS_cond = 0;          
			3'b010: outputS_cond = 1;                
			3'b011: outputS_cond = 1;  
			3'b100: outputS_cond = 1;        
			3'b101: outputS_cond = 1;                
			3'b110: outputS_cond = 0;                
			3'b111: outputS_cond = 0;                       
		endcase
	end
	else begin	
        // Si el valid es 1 salen los datos de la logica de muxes
		case(selector_cond)
			3'b000: outputS_cond = inputP[7];        
			3'b001: outputS_cond = inputP[6];                
			3'b010: outputS_cond = inputP[5];                
			3'b011: outputS_cond = inputP[4];  
			3'b100: outputS_cond = inputP[3];        
			3'b101: outputS_cond = inputP[2];                
			3'b110: outputS_cond = inputP[1];                
			3'b111: outputS_cond = inputP[0];                       
		endcase
	end
end
endmodule