//`include "DeMux2x1.v"
module DeMuxL2(
    output [7:0]dataOut0_cond,
    output [7:0]dataOut1_cond,
    output validOut0_cond,
    output validOut1_cond,
    input [7:0]dataIn,
    input validIn,
    //input selector,
    input clk,
    input reset);

    DeMux2x1 Demux(
        //Outputs
        .dataOut0_cond  (dataOut0_cond[7:0]),
        .dataOut1_cond  (dataOut1_cond[7:0]),  
        .validOut0_cond (validOut0_cond),
        .validOut1_cond (validOut1_cond),
        //Inputs
        .dataIn    (dataIn[7:0]),
        .validIn   (validIn),
        //.selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule