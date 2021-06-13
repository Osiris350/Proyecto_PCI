module Mux2x1(
    output reg [7:0]dataOut,
    output reg validOut,
    input [7:0]dataIn0,
    input [7:0]dataIn1,
    input validIn0,
    input validIn1,
    input clk,
    input reset);

    reg [7:0]out;
    reg validMux;
    reg selector;

    always @(posedge clk)begin
        if (reset == 0)begin
            selector <= 1;
        end
        else begin
            selector <= selector + 1;
        end
    end

    //Mux de entrada el que escoge entre dataIn1 y dataIn0 a partir del selector
    always @(*)
        begin
            out = dataOut;
            validMux = validOut;
            if(selector==0) begin
                out = dataIn0;
                validMux = validIn0;
            end
            else if (selector==1)begin
                out = dataIn1;
                validMux = validIn1;
            end
        end
    // Flop que guarda lo que sea que este ee el cable out que conecta el mux con el flop
    always @(posedge clk)
        begin
            if (reset == 0)begin
                dataOut <= 8'b00000000;
                validOut <= 0;
            end
            else begin
                if (validMux == 1)begin
                    dataOut <= out;
                    validOut <= validMux;
                    end
                else begin
                    dataOut <= dataOut; 
                    validOut <= validMux;   
                end
            end
        end
endmodule