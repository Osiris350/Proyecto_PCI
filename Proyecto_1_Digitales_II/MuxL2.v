//`include "Mux2x1.v"

module MuxL2(
    output [7:0]dataOut,
    output validOut,
    input [7:0]dataIn0,
    input [7:0]dataIn1,
    input validIn0,
    input validIn1,
    input clk,
    input reset);

    Mux2x1 mux1(
        //Outputs
        .dataOut  (dataOut[7:0]),
        .validOut (validOut),
        //Inputs
        .dataIn0  (dataIn1[7:0]),
        .dataIn1  (dataIn0[7:0]),
        .validIn0 (validIn1),
        .validIn1 (validIn0),
        .clk      (clk),
        .reset    (reset)
    );
endmodule