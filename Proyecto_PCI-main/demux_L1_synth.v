/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* src = "DeMux2x1.v:1" *)
module DeMux2x1(dataOut0, dataOut1, validOut0, validOut1, dataIn, validIn, selector, clk, reset);
  (* src = "DeMux2x1.v:36" *)
  wire _00_;
  (* src = "DeMux2x1.v:53" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "DeMux2x1.v:9" *)
  input clk;
  (* src = "DeMux2x1.v:6" *)
  input [7:0] dataIn;
  (* src = "DeMux2x1.v:2" *)
  output [7:0] dataOut0;
  (* src = "DeMux2x1.v:3" *)
  output [7:0] dataOut1;
  (* src = "DeMux2x1.v:10" *)
  input reset;
  (* src = "DeMux2x1.v:8" *)
  input selector;
  (* src = "DeMux2x1.v:7" *)
  input validIn;
  (* src = "DeMux2x1.v:4" *)
  output validOut0;
  (* src = "DeMux2x1.v:5" *)
  output validOut1;
  NOT _10_ (
    .A(reset),
    .Y(_08_)
  );
  NAND _11_ (
    .A(validOut0),
    .B(_08_),
    .Y(_09_)
  );
  NAND _12_ (
    .A(reset),
    .B(validIn),
    .Y(_02_)
  );
  NOT _13_ (
    .A(_02_),
    .Y(_03_)
  );
  NOR _14_ (
    .A(selector),
    .B(_02_),
    .Y(_04_)
  );
  NOT _15_ (
    .A(_04_),
    .Y(_05_)
  );
  NAND _16_ (
    .A(_09_),
    .B(_05_),
    .Y(_00_)
  );
  NAND _17_ (
    .A(_08_),
    .B(validOut1),
    .Y(_06_)
  );
  NAND _18_ (
    .A(selector),
    .B(_03_),
    .Y(_07_)
  );
  NAND _19_ (
    .A(_06_),
    .B(_07_),
    .Y(_01_)
  );
  (* src = "DeMux2x1.v:53" *)
  DFF _20_ (
    .C(clk),
    .D(_01_),
    .Q(validOut1)
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _21_ (
    .C(clk),
    .D(_00_),
    .Q(validOut0)
  );
  assign dataOut0 = 8'h00;
  assign dataOut1 = 8'h00;
endmodule

(* top =  1  *)
(* src = "demux_L1_synth.v:2" *)
module demux_L1_synth(dataOut0, dataOut1, dataOut2, dataOut3, validOut0, validOut1, validOut2, validOut3, dataIn0, dataIn1, validIn0, validIn1, selector, clk, reset);
  (* src = "demux_L1_synth.v:16" *)
  input clk;
  (* src = "demux_L1_synth.v:11" *)
  input [7:0] dataIn0;
  (* src = "demux_L1_synth.v:12" *)
  input [7:0] dataIn1;
  (* src = "demux_L1_synth.v:3" *)
  output [7:0] dataOut0;
  (* src = "demux_L1_synth.v:4" *)
  output [7:0] dataOut1;
  (* src = "demux_L1_synth.v:5" *)
  output [7:0] dataOut2;
  (* src = "demux_L1_synth.v:6" *)
  output [7:0] dataOut3;
  (* src = "demux_L1_synth.v:17" *)
  input reset;
  (* src = "demux_L1_synth.v:15" *)
  input selector;
  (* src = "demux_L1_synth.v:13" *)
  input validIn0;
  (* src = "demux_L1_synth.v:14" *)
  input validIn1;
  (* src = "demux_L1_synth.v:7" *)
  output validOut0;
  (* src = "demux_L1_synth.v:8" *)
  output validOut1;
  (* src = "demux_L1_synth.v:9" *)
  output validOut2;
  (* src = "demux_L1_synth.v:10" *)
  output validOut3;
  (* module_not_derived = 32'd1 *)
  (* src = "demux_L1_synth.v:19" *)
  DeMux2x1 Demux1 (
    .clk(clk),
    .dataIn(dataIn0),
    .dataOut0(dataOut0),
    .dataOut1(dataOut1),
    .reset(reset),
    .selector(selector),
    .validIn(validIn0),
    .validOut0(validOut0),
    .validOut1(validOut1)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "demux_L1_synth.v:33" *)
  DeMux2x1 Demux2 (
    .clk(clk),
    .dataIn(dataIn1),
    .dataOut0(dataOut2),
    .dataOut1(dataOut3),
    .reset(reset),
    .selector(selector),
    .validIn(validIn1),
    .validOut0(validOut2),
    .validOut1(validOut3)
  );
endmodule
