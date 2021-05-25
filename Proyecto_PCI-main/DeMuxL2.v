//`include "DeMux2x1.v"
module DeMuxL2(
    output [7:0]dataOut0,
    output [7:0]dataOut1,
    output validOut0,
    output validOut1,
    input [7:0]dataIn,
    input validIn,
    input selector,
    input clk,
    input reset);

    DeMux2x1 Demux(
        //Outputs
        .dataOut0  (dataOut0[7:0]),
        .dataOut1  (dataOut1[7:0]),  
        .validOut0 (validOut0),
        .validOut1 (validOut1),
        //Inputs
        .dataIn    (dataIn[7:0]),
        .validIn   (validIn),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule
