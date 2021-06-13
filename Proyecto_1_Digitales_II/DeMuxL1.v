`include "DeMux2x1.v"
module DeMuxL1(
    output [7:0]dataOut0_cond,
    output [7:0]dataOut1_cond,
    output [7:0]dataOut2_cond,
    output [7:0]dataOut3_cond,
    output validOut0_cond,
    output validOut1_cond,
    output validOut2_cond,
    output validOut3_cond,
    input [7:0]dataIn0,
    input [7:0]dataIn1,
    input validIn0,
    input validIn1,
    input clk,
    input reset);

    DeMux2x1 Demux1(
        //Outputs
        .dataOut0_cond  (dataOut0_cond[7:0]),
        .dataOut1_cond  (dataOut1_cond[7:0]),  
        .validOut0_cond (validOut0_cond),
        .validOut1_cond (validOut1_cond),
        //Inputs
        .dataIn    (dataIn0[7:0]),
        .validIn   (validIn0),
        .clk       (clk),
        .reset     (reset)
    );
    
    DeMux2x1 Demux2(
        //Outputs
        .dataOut0_cond  (dataOut2_cond[7:0]),
        .dataOut1_cond  (dataOut3_cond[7:0]),  
        .validOut0_cond (validOut2_cond),
        .validOut1_cond (validOut3_cond),
        //Inputs
        .dataIn    (dataIn1[7:0]),
        .validIn   (validIn1),
        .clk       (clk),
        .reset     (reset)
    );
endmodule
