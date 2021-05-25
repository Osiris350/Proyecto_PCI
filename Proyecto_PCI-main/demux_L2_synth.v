/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* src = "DeMux2x1.v:1" *)
module DeMux2x1x(dataOut0, dataOut1, validOut0, validOut1, dataIn, validIn, selector, clk, reset);
  (* src = "DeMux2x1.v:36" *)
  wire [7:0] _000_;
  (* src = "DeMux2x1.v:36" *)
  wire _001_;
  (* src = "DeMux2x1.v:36" *)
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
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
  NOT _045_ (
    .A(reset),
    .Y(_003_)
  );
  NOT _046_ (
    .A(validIn),
    .Y(_004_)
  );
  NOT _047_ (
    .A(selector),
    .Y(_005_)
  );
  NOR _048_ (
    .A(_004_),
    .B(selector),
    .Y(_006_)
  );
  NOR _049_ (
    .A(_003_),
    .B(_006_),
    .Y(_007_)
  );
  NOR _050_ (
    .A(validOut0),
    .B(reset),
    .Y(_008_)
  );
  NOR _051_ (
    .A(_007_),
    .B(_008_),
    .Y(_001_)
  );
  NOR _052_ (
    .A(_004_),
    .B(_005_),
    .Y(_009_)
  );
  NAND _053_ (
    .A(validIn),
    .B(selector),
    .Y(_010_)
  );
  NOR _054_ (
    .A(dataOut1[0]),
    .B(_009_),
    .Y(_011_)
  );
  NOR _055_ (
    .A(dataIn[0]),
    .B(_010_),
    .Y(_012_)
  );
  NOT _056_ (
    .A(_012_),
    .Y(_013_)
  );
  NAND _057_ (
    .A(reset),
    .B(_013_),
    .Y(_014_)
  );
  NOR _058_ (
    .A(_011_),
    .B(_014_),
    .Y(_000_[0])
  );
  NOR _059_ (
    .A(dataOut1[1]),
    .B(_009_),
    .Y(_015_)
  );
  NOR _060_ (
    .A(dataIn[1]),
    .B(_010_),
    .Y(_016_)
  );
  NOT _061_ (
    .A(_016_),
    .Y(_017_)
  );
  NAND _062_ (
    .A(reset),
    .B(_017_),
    .Y(_018_)
  );
  NOR _063_ (
    .A(_015_),
    .B(_018_),
    .Y(_000_[1])
  );
  NOR _064_ (
    .A(dataOut1[2]),
    .B(_009_),
    .Y(_019_)
  );
  NOR _065_ (
    .A(dataIn[2]),
    .B(_010_),
    .Y(_020_)
  );
  NOT _066_ (
    .A(_020_),
    .Y(_021_)
  );
  NAND _067_ (
    .A(reset),
    .B(_021_),
    .Y(_022_)
  );
  NOR _068_ (
    .A(_019_),
    .B(_022_),
    .Y(_000_[2])
  );
  NOR _069_ (
    .A(dataOut1[3]),
    .B(_009_),
    .Y(_023_)
  );
  NOR _070_ (
    .A(dataIn[3]),
    .B(_010_),
    .Y(_024_)
  );
  NOT _071_ (
    .A(_024_),
    .Y(_025_)
  );
  NAND _072_ (
    .A(reset),
    .B(_025_),
    .Y(_026_)
  );
  NOR _073_ (
    .A(_023_),
    .B(_026_),
    .Y(_000_[3])
  );
  NOR _074_ (
    .A(dataOut1[4]),
    .B(_009_),
    .Y(_027_)
  );
  NOR _075_ (
    .A(dataIn[4]),
    .B(_010_),
    .Y(_028_)
  );
  NOT _076_ (
    .A(_028_),
    .Y(_029_)
  );
  NAND _077_ (
    .A(reset),
    .B(_029_),
    .Y(_030_)
  );
  NOR _078_ (
    .A(_027_),
    .B(_030_),
    .Y(_000_[4])
  );
  NOR _079_ (
    .A(dataOut1[5]),
    .B(_009_),
    .Y(_031_)
  );
  NOR _080_ (
    .A(dataIn[5]),
    .B(_010_),
    .Y(_032_)
  );
  NOT _081_ (
    .A(_032_),
    .Y(_033_)
  );
  NAND _082_ (
    .A(reset),
    .B(_033_),
    .Y(_034_)
  );
  NOR _083_ (
    .A(_031_),
    .B(_034_),
    .Y(_000_[5])
  );
  NOR _084_ (
    .A(dataOut1[6]),
    .B(_009_),
    .Y(_035_)
  );
  NOR _085_ (
    .A(dataIn[6]),
    .B(_010_),
    .Y(_036_)
  );
  NOT _086_ (
    .A(_036_),
    .Y(_037_)
  );
  NAND _087_ (
    .A(reset),
    .B(_037_),
    .Y(_038_)
  );
  NOR _088_ (
    .A(_035_),
    .B(_038_),
    .Y(_000_[6])
  );
  NOR _089_ (
    .A(dataOut1[7]),
    .B(_009_),
    .Y(_039_)
  );
  NOR _090_ (
    .A(dataIn[7]),
    .B(_010_),
    .Y(_040_)
  );
  NOT _091_ (
    .A(_040_),
    .Y(_041_)
  );
  NAND _092_ (
    .A(reset),
    .B(_041_),
    .Y(_042_)
  );
  NOR _093_ (
    .A(_039_),
    .B(_042_),
    .Y(_000_[7])
  );
  NOR _094_ (
    .A(_003_),
    .B(_009_),
    .Y(_043_)
  );
  NOR _095_ (
    .A(reset),
    .B(validOut1),
    .Y(_044_)
  );
  NOR _096_ (
    .A(_043_),
    .B(_044_),
    .Y(_002_)
  );
  (* src = "DeMux2x1.v:61" *)
  DFF _097_ (
    .C(clk),
    .D(_002_),
    .Q(validOut1)
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _098_ (
    .C(clk),
    .D(_000_[0]),
    .Q(dataOut1[0])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _099_ (
    .C(clk),
    .D(_000_[1]),
    .Q(dataOut1[1])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _100_ (
    .C(clk),
    .D(_000_[2]),
    .Q(dataOut1[2])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _101_ (
    .C(clk),
    .D(_000_[3]),
    .Q(dataOut1[3])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _102_ (
    .C(clk),
    .D(_000_[4]),
    .Q(dataOut1[4])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _103_ (
    .C(clk),
    .D(_000_[5]),
    .Q(dataOut1[5])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _104_ (
    .C(clk),
    .D(_000_[6]),
    .Q(dataOut1[6])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _105_ (
    .C(clk),
    .D(_000_[7]),
    .Q(dataOut1[7])
  );
  (* src = "DeMux2x1.v:36" *)
  DFF _106_ (
    .C(clk),
    .D(_001_),
    .Q(validOut0)
  );
  assign dataOut0 = 8'h00;
endmodule

(* top =  1  *)
(* src = "demux_L2_synth.v:2" *)
module demux_L2_synth(dataOut0, dataOut1, validOut0, validOut1, dataIn, validIn, selector, clk, reset);
  (* src = "demux_L2_synth.v:10" *)
  input clk;
  (* src = "demux_L2_synth.v:7" *)
  input [7:0] dataIn;
  (* src = "demux_L2_synth.v:3" *)
  output [7:0] dataOut0;
  (* src = "demux_L2_synth.v:4" *)
  output [7:0] dataOut1;
  (* src = "demux_L2_synth.v:11" *)
  input reset;
  (* src = "demux_L2_synth.v:9" *)
  input selector;
  (* src = "demux_L2_synth.v:8" *)
  input validIn;
  (* src = "demux_L2_synth.v:5" *)
  output validOut0;
  (* src = "demux_L2_synth.v:6" *)
  output validOut1;
  (* module_not_derived = 32'd1 *)
  (* src = "demux_L2_synth.v:13" *)
  DeMux2x1 Demux (
    .clk(clk),
    .dataIn(dataIn),
    .dataOut0(dataOut0),
    .dataOut1(dataOut1),
    .reset(reset),
    .selector(selector),
    .validIn(validIn),
    .validOut0(validOut0),
    .validOut1(validOut1)
  );
endmodule
