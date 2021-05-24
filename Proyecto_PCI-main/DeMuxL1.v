`include "DeMux2x1.v"
module DeMuxL1(
    output [7:0]dataOut0,
    output [7:0]dataOut1,
    output [7:0]dataOut2,
    output [7:0]dataOut3,
    output validOut0,
    output validOut1,
    output validOut2,
    output validOut3,
    input [7:0]dataIn0,
    input [7:0]dataIn1,
    input validIn0,
    input validIn1,
    input selector,
    input clk,
    input reset);

    DeMux2x1 Demux1(
        //Outputs
        .dataOut0  (dataOut0[7:0]),
        .dataOut1  (dataOut1[7:0]),  
        .validOut0 (validOut0),
        .validOut1 (validOut1),
        //Inputs
        .dataIn    (dataIn0[7:0]),
        .validIn   (validIn0),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
    
    DeMux2x1 Demux2(
        //Outputs
        .dataOut0  (dataOut2[7:0]),
        .dataOut1  (dataOut3[7:0]),  
        .validOut0 (validOut2),
        .validOut1 (validOut3),
        //Inputs
        .dataIn    (dataIn1[7:0]),
        .validIn   (validIn1),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule