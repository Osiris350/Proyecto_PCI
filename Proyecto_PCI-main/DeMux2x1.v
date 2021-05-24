module DeMux2x1(
    output reg [7:0]dataOut0,
    output reg [7:0]dataOut1,
    output reg validOut0,
    output reg validOut1,
    input [7:0]dataIn,
    input validIn,
    input selector,
    input clk,
    input reset);

    reg [7:0]out0;
    reg [7:0]out1;
    reg validDeMux0;
    reg validDeMux1;


    //Mux de entrada el que escoge entre dataIn1 y dataIn0 a partir del selector
    always @(*)
        begin
            if(selector == 1) begin
                out1 = dataIn;
                validDeMux1 = validIn;
            end
            else if (selector == 0)begin
                out0 = dataIn;
                validDeMux0 = validIn;
            end
        end
    // Flop que guarda lo que sea que este ee el cable out que conecta el mux con el flop
    always @(posedge clk)
        begin
            if (reset == 0)begin
                dataOut0 <= 8'b00000000;
                dataOut1 <= 8'b00000000;
            end
            else begin
                if (validDeMux0 == 1)begin
                    dataOut0 <= out0;
                    validOut0 <= validDeMux0;
                    end
                else if (validDeMux0 == 0) begin
                    dataOut0 <= dataOut0; 
                    validOut0 <= validDeMux0;   
                end
            end
        end
    always @(posedge clk) 
        begin
            if (reset == 0)begin
                    dataOut0 <= 8'b00000000;
                    dataOut1 <= 8'b00000000;
                end
            else begin
                if (validDeMux1 == 1)begin
                    dataOut1 <= out1;
                    validOut1 <= validDeMux1;
                    end
                else if (validDeMux1 == 0) begin
                    dataOut1 <= dataOut1; 
                    validOut1 <= validDeMux1;   
                end
            end
        end
endmodule