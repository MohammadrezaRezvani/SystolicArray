///////////////////////////////////////////////////////////////////////////////
// vim:set shiftwidth=4 softtabstop=4 expandtab:
// $Id: SisArrayMM.v 916 2019-11-18 Moe $
//
// Module: pe.v
// Project: Reconfigurable Computing
// Description: Implementing Matrix Multiplication with Systolic Array
//
//
// Change history: 11/18/19 - Start implementing
//
///////////////////////////////////////////////////////////////////////////////

module SisArrayMM #(
    parameter data_size = 8;
    parameter grid_size = 3;
    ) (
    input  wire clk,
    input  wire reset,

    input  wire [data_size - 1 : 0] a1,
    input  wire [data_size - 1 : 0] a2,
    input  wire [data_size - 1 : 0] a3,

    input  wire [data_size - 1 : 0] b1,
    input  wire [data_size - 1 : 0] b2,
    input  wire [data_size - 1 : 0] b3,

    output wire [data_size - 1 : 0] c13,
    output wire [data_size - 1 : 0] c23,
    output wire [data_size - 1 : 0] c31,
    output wire [data_size - 1 : 0] c32,
    output wire [data_size - 1 : 0] c33
    );
    
    // Wires.
    wire [data_size - 1 : 0] a_in [grid_size : 0] [grid_size : 0];
    wire [data_size - 1 : 0] b_in [grid_size : 0] [grid_size : 0];
    wire [data_size - 1 : 0] c_in [grid_size : 0] [grid_size : 0];

    wire [data_size - 1 : 0] a_out [grid_size : 0] [grid_size : 0];
    wire [data_size - 1 : 0] b_out [grid_size : 0] [grid_size : 0];
    wire [data_size - 1 : 0] c_out [grid_size : 0] [grid_size : 0];

    // Connections between PEs.
    assign a_in [1][1] = a_out [1 - 1][1 - 0] /* input */;
    assign b_in [1][1] = b_out [1 - 0][1 - 1] /* input */;
    assign c_in [1][1] = c_out [1 - 1][1 - 1] /* input */;

    assign a_in [1][2] = a_out [1 - 1][2 - 0] /* input */;
    assign b_in [1][2] = b_out [1 - 0][2 - 1];
    assign c_in [1][2] = c_out [1 - 1][2 - 1] /* input */;

    assign a_in [1][3] = a_out [1 - 1][3 - 0] /* input */;
    assign b_in [1][3] = b_out [1 - 0][3 - 1];
    assign c_in [1][3] = c_out [1 - 1][3 - 1] /* input */;

    assign a_in [2][1] = a_out [2 - 1][1 - 0];
    assign b_in [2][1] = b_out [2 - 0][1 - 1] /* input */;
    assign c_in [2][1] = c_out [2 - 1][1 - 1] /* input */;

    assign a_in [2][2] = a_out [2 - 1][2 - 0];
    assign b_in [2][2] = b_out [2 - 0][2 - 1];
    assign c_in [2][2] = c_out [2 - 1][2 - 1];

    assign a_in [2][3] = a_out [2 - 1][3 - 0];
    assign b_in [2][3] = b_out [2 - 0][3 - 1];
    assign c_in [2][3] = c_out [2 - 1][3 - 1];

    assign a_in [3][1] = a_out [3 - 1][1 - 0];
    assign b_in [3][1] = b_out [3 - 0][1 - 1] /* input */;
    assign c_in [3][1] = c_out [3 - 1][1 - 1] /* input */;

    assign a_in [3][2] = a_out [3 - 1][2 - 0];
    assign b_in [3][2] = b_out [3 - 0][2 - 1];
    assign c_in [3][2] = c_out [3 - 1][2 - 1];

    assign a_in [3][3] = a_out [3 - 1][3 - 0];
    assign b_in [3][3] = b_out [3 - 0][3 - 1];
    assign c_in [3][3] = c_out [3 - 1][3 - 1];

    // Inputs.
    assign a_out [1 - 1][1 - 0] = a1;
    assign a_out [1 - 1][2 - 0] = a2;
    assign a_out [1 - 1][3 - 0] = a3;

    assign b_out [1 - 0][1 - 1] = b1;
    assign b_out [2 - 0][1 - 1] = b2;
    assign b_out [3 - 0][1 - 1] = b3;

    assign c_out [1 - 1][1 - 1] = 0;
    assign c_out [1 - 1][2 - 1] = 0;
    assign c_out [1 - 1][3 - 1] = 0;
    assign c_out [2 - 1][1 - 1] = 0;
    assign c_out [3 - 1][1 - 1] = 0;

    // Outputs.
    assign c13 = c_out [1][3];
    assign c23 = c_out [2][3];
    assign c31 = c_out [3][1];
    assign c32 = c_out [3][2];
    assign c33 = c_out [3][3];

    // PEs.
    pe pe11 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [1][1]),
                .in_b(b_in [1][1]),
                .in_c(c_in [1][1]),

                .out_a(a_out [1][1]),
                .out_b(b_out [1][1]),
                .out_c(c_out [1][1]),
            );

    pe pe12 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [1][2]),
                .in_b(b_in [1][2]),
                .in_c(c_in [1][2]),

                .out_a(a_out [1][2]),
                .out_b(b_out [1][2]),
                .out_c(c_out [1][2]),
            );

    pe pe13 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [1][3]),
                .in_b(b_in [1][3]),
                .in_c(c_in [1][3]),

                .out_a(a_out [1][3]),
                .out_b(b_out [1][3]),
                .out_c(c_out [1][3]),
            );

    pe pe21 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [2][1]),
                .in_b(b_in [2][1]),
                .in_c(c_in [2][1]),

                .out_a(a_out [2][1]),
                .out_b(b_out [2][1]),
                .out_c(c_out [2][1]),
            );

    pe pe22 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [2][2]),
                .in_b(b_in [2][2]),
                .in_c(c_in [2][2]),

                .out_a(a_out [2][2]),
                .out_b(b_out [2][2]),
                .out_c(c_out [2][2]),
            );

    pe pe23 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [2][3]),
                .in_b(b_in [2][3]),
                .in_c(c_in [2][3]),

                .out_a(a_out [2][3]),
                .out_b(b_out [2][3]),
                .out_c(c_out [2][3]),
            );

    pe pe31 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [3][1]),
                .in_b(b_in [3][1]),
                .in_c(c_in [3][1]),

                .out_a(a_out [3][1]),
                .out_b(b_out [3][1]),
                .out_c(c_out [3][1]),
            );

    pe pe32 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [3][2]),
                .in_b(b_in [3][2]),
                .in_c(c_in [3][2]),

                .out_a(a_out [3][2]),
                .out_b(b_out [3][2]),
                .out_c(c_out [3][2]),
            );

    pe pe33 (   .clk(clk),
                .reset(reset),

                .in_a(a_in [3][3]),
                .in_b(b_in [3][3]),
                .in_c(c_in [3][3]),

                .out_a(a_out [3][3]),
                .out_b(b_out [3][3]),
                .out_c(c_out [3][3]),
            );
endmodule
