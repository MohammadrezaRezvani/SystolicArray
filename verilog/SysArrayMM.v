module PE(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  input  [31:0] io_in_c,
  output [31:0] io_out_a,
  output [31:0] io_out_b,
  output [31:0] io_out_c
);
  reg [31:0] a; // @[Systolic.scala 20:18]
  reg [31:0] _RAND_0;
  reg [31:0] b; // @[Systolic.scala 21:18]
  reg [31:0] _RAND_1;
  reg [31:0] c; // @[Systolic.scala 22:18]
  reg [31:0] _RAND_2;
  wire [63:0] _T; // @[Systolic.scala 25:27]
  wire [63:0] _GEN_0; // @[Systolic.scala 25:16]
  wire [63:0] _T_2; // @[Systolic.scala 25:16]
  assign _T = io_in_a * io_in_b; // @[Systolic.scala 25:27]
  assign _GEN_0 = {{32'd0}, io_in_c}; // @[Systolic.scala 25:16]
  assign _T_2 = _GEN_0 + _T; // @[Systolic.scala 25:16]
  assign io_out_a = a; // @[Systolic.scala 26:12]
  assign io_out_b = b; // @[Systolic.scala 27:12]
  assign io_out_c = c; // @[Systolic.scala 28:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  a = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  b = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  c = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      a <= 32'h0;
    end else begin
      a <= io_in_a;
    end
    if (reset) begin
      b <= 32'h0;
    end else begin
      b <= io_in_b;
    end
    if (reset) begin
      c <= 32'h0;
    end else begin
      c <= _T_2[31:0];
    end
  end
endmodule
module SysArrayMM(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_0,
  input  [31:0] io_in_a_1,
  input  [31:0] io_in_a_2,
  input  [31:0] io_in_b_0,
  input  [31:0] io_in_b_1,
  input  [31:0] io_in_b_2,
  output [31:0] io_out_c_0,
  output [31:0] io_out_c_1,
  output [31:0] io_out_c_2,
  output [31:0] io_out_c_3,
  output [31:0] io_out_c_4
);
  wire  pes_0_clock; // @[Systolic.scala 41:52]
  wire  pes_0_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_0_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_1_clock; // @[Systolic.scala 41:52]
  wire  pes_1_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_1_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_2_clock; // @[Systolic.scala 41:52]
  wire  pes_2_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_2_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_3_clock; // @[Systolic.scala 41:52]
  wire  pes_3_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_3_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_4_clock; // @[Systolic.scala 41:52]
  wire  pes_4_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_4_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_5_clock; // @[Systolic.scala 41:52]
  wire  pes_5_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_5_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_6_clock; // @[Systolic.scala 41:52]
  wire  pes_6_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_6_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_7_clock; // @[Systolic.scala 41:52]
  wire  pes_7_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_7_io_out_c; // @[Systolic.scala 41:52]
  wire  pes_8_clock; // @[Systolic.scala 41:52]
  wire  pes_8_reset; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_in_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_in_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_in_c; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_out_a; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_out_b; // @[Systolic.scala 41:52]
  wire [31:0] pes_8_io_out_c; // @[Systolic.scala 41:52]
  PE pes_0 ( // @[Systolic.scala 41:52]
    .clock(pes_0_clock),
    .reset(pes_0_reset),
    .io_in_a(pes_0_io_in_a),
    .io_in_b(pes_0_io_in_b),
    .io_in_c(pes_0_io_in_c),
    .io_out_a(pes_0_io_out_a),
    .io_out_b(pes_0_io_out_b),
    .io_out_c(pes_0_io_out_c)
  );
  PE pes_1 ( // @[Systolic.scala 41:52]
    .clock(pes_1_clock),
    .reset(pes_1_reset),
    .io_in_a(pes_1_io_in_a),
    .io_in_b(pes_1_io_in_b),
    .io_in_c(pes_1_io_in_c),
    .io_out_a(pes_1_io_out_a),
    .io_out_b(pes_1_io_out_b),
    .io_out_c(pes_1_io_out_c)
  );
  PE pes_2 ( // @[Systolic.scala 41:52]
    .clock(pes_2_clock),
    .reset(pes_2_reset),
    .io_in_a(pes_2_io_in_a),
    .io_in_b(pes_2_io_in_b),
    .io_in_c(pes_2_io_in_c),
    .io_out_a(pes_2_io_out_a),
    .io_out_b(pes_2_io_out_b),
    .io_out_c(pes_2_io_out_c)
  );
  PE pes_3 ( // @[Systolic.scala 41:52]
    .clock(pes_3_clock),
    .reset(pes_3_reset),
    .io_in_a(pes_3_io_in_a),
    .io_in_b(pes_3_io_in_b),
    .io_in_c(pes_3_io_in_c),
    .io_out_a(pes_3_io_out_a),
    .io_out_b(pes_3_io_out_b),
    .io_out_c(pes_3_io_out_c)
  );
  PE pes_4 ( // @[Systolic.scala 41:52]
    .clock(pes_4_clock),
    .reset(pes_4_reset),
    .io_in_a(pes_4_io_in_a),
    .io_in_b(pes_4_io_in_b),
    .io_in_c(pes_4_io_in_c),
    .io_out_a(pes_4_io_out_a),
    .io_out_b(pes_4_io_out_b),
    .io_out_c(pes_4_io_out_c)
  );
  PE pes_5 ( // @[Systolic.scala 41:52]
    .clock(pes_5_clock),
    .reset(pes_5_reset),
    .io_in_a(pes_5_io_in_a),
    .io_in_b(pes_5_io_in_b),
    .io_in_c(pes_5_io_in_c),
    .io_out_a(pes_5_io_out_a),
    .io_out_b(pes_5_io_out_b),
    .io_out_c(pes_5_io_out_c)
  );
  PE pes_6 ( // @[Systolic.scala 41:52]
    .clock(pes_6_clock),
    .reset(pes_6_reset),
    .io_in_a(pes_6_io_in_a),
    .io_in_b(pes_6_io_in_b),
    .io_in_c(pes_6_io_in_c),
    .io_out_a(pes_6_io_out_a),
    .io_out_b(pes_6_io_out_b),
    .io_out_c(pes_6_io_out_c)
  );
  PE pes_7 ( // @[Systolic.scala 41:52]
    .clock(pes_7_clock),
    .reset(pes_7_reset),
    .io_in_a(pes_7_io_in_a),
    .io_in_b(pes_7_io_in_b),
    .io_in_c(pes_7_io_in_c),
    .io_out_a(pes_7_io_out_a),
    .io_out_b(pes_7_io_out_b),
    .io_out_c(pes_7_io_out_c)
  );
  PE pes_8 ( // @[Systolic.scala 41:52]
    .clock(pes_8_clock),
    .reset(pes_8_reset),
    .io_in_a(pes_8_io_in_a),
    .io_in_b(pes_8_io_in_b),
    .io_in_c(pes_8_io_in_c),
    .io_out_a(pes_8_io_out_a),
    .io_out_b(pes_8_io_out_b),
    .io_out_c(pes_8_io_out_c)
  );
  assign io_out_c_0 = pes_6_io_out_c; // @[Systolic.scala 70:17]
  assign io_out_c_1 = pes_7_io_out_c; // @[Systolic.scala 70:17]
  assign io_out_c_2 = pes_8_io_out_c; // @[Systolic.scala 70:17]
  assign io_out_c_3 = pes_5_io_out_c; // @[Systolic.scala 83:39]
  assign io_out_c_4 = pes_2_io_out_c; // @[Systolic.scala 83:39]
  assign pes_0_clock = clock;
  assign pes_0_reset = reset;
  assign pes_0_io_in_a = io_in_a_0; // @[Systolic.scala 67:20]
  assign pes_0_io_in_b = io_in_b_0; // @[Systolic.scala 80:30]
  assign pes_0_io_in_c = 32'h0; // @[Systolic.scala 72:20 Systolic.scala 86:30]
  assign pes_1_clock = clock;
  assign pes_1_reset = reset;
  assign pes_1_io_in_a = io_in_a_1; // @[Systolic.scala 67:20]
  assign pes_1_io_in_b = pes_0_io_out_b; // @[Systolic.scala 57:34]
  assign pes_1_io_in_c = 32'h0; // @[Systolic.scala 72:20]
  assign pes_2_clock = clock;
  assign pes_2_reset = reset;
  assign pes_2_io_in_a = io_in_a_2; // @[Systolic.scala 67:20]
  assign pes_2_io_in_b = pes_1_io_out_b; // @[Systolic.scala 57:34]
  assign pes_2_io_in_c = 32'h0; // @[Systolic.scala 72:20]
  assign pes_3_clock = clock;
  assign pes_3_reset = reset;
  assign pes_3_io_in_a = pes_0_io_out_a; // @[Systolic.scala 53:34]
  assign pes_3_io_in_b = io_in_b_1; // @[Systolic.scala 80:30]
  assign pes_3_io_in_c = 32'h0; // @[Systolic.scala 86:30]
  assign pes_4_clock = clock;
  assign pes_4_reset = reset;
  assign pes_4_io_in_a = pes_1_io_out_a; // @[Systolic.scala 53:34]
  assign pes_4_io_in_b = pes_3_io_out_b; // @[Systolic.scala 57:34]
  assign pes_4_io_in_c = pes_0_io_out_c; // @[Systolic.scala 61:34]
  assign pes_5_clock = clock;
  assign pes_5_reset = reset;
  assign pes_5_io_in_a = pes_2_io_out_a; // @[Systolic.scala 53:34]
  assign pes_5_io_in_b = pes_4_io_out_b; // @[Systolic.scala 57:34]
  assign pes_5_io_in_c = pes_1_io_out_c; // @[Systolic.scala 61:34]
  assign pes_6_clock = clock;
  assign pes_6_reset = reset;
  assign pes_6_io_in_a = pes_3_io_out_a; // @[Systolic.scala 53:34]
  assign pes_6_io_in_b = io_in_b_2; // @[Systolic.scala 80:30]
  assign pes_6_io_in_c = 32'h0; // @[Systolic.scala 86:30]
  assign pes_7_clock = clock;
  assign pes_7_reset = reset;
  assign pes_7_io_in_a = pes_4_io_out_a; // @[Systolic.scala 53:34]
  assign pes_7_io_in_b = pes_6_io_out_b; // @[Systolic.scala 57:34]
  assign pes_7_io_in_c = pes_3_io_out_c; // @[Systolic.scala 61:34]
  assign pes_8_clock = clock;
  assign pes_8_reset = reset;
  assign pes_8_io_in_a = pes_5_io_out_a; // @[Systolic.scala 53:34]
  assign pes_8_io_in_b = pes_7_io_out_b; // @[Systolic.scala 57:34]
  assign pes_8_io_in_c = pes_4_io_out_c; // @[Systolic.scala 61:34]
endmodule
