`include "Mux2x1.v"

module MuxL1(
    output [7:0]dataOut0,
    output [7:0]dataOut1,
    output validOut0,
    output validOut1,
    input [7:0]dataIn0,
    input [7:0]dataIn1,
    input [7:0]dataIn2,
    input [7:0]dataIn3,
    input validIn0,
    input validIn1,
    input validIn2,
    input validIn3,
    input selector,
    input clk,
    input reset);

    Mux2x1 mux1(
        //Outputs
        .dataOut  (dataOut0[7:0]),
        .validOut (validOut0),
        //Inputs
        .dataIn0  (dataIn0[7:0]),
        .dataIn1  (dataIn1[7:0]),
        .validIn0 (validIn0),
        .validIn1 (validIn1),
        .selector (selector),
        .clk      (clk),
        .reset    (reset)
    );

    Mux2x1 mux2(
        //Outputs
        .dataOut  (dataOut1[7:0]),
        .validOut (validOut1),
        //Inputs
        .dataIn0  (dataIn2[7:0]),
        .dataIn1  (dataIn3[7:0]),
        .validIn0 (validIn2),
        .validIn1 (validIn3),
        .selector (selector),
        .clk      (clk),
        .reset    (reset)
    );
endmodule