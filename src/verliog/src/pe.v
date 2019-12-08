///////////////////////////////////////////////////////////////////////////////
// vim:set shiftwidth=4 softtabstop=4 expandtab:
// $Id: pe.v 916 2019-11-18 Moe $
//
// Module: pe.v
// Project: Reconfigurable Computing
// Description: Implementing PE
//
//
// Change history: 11/18/19 - Start implementing
//
///////////////////////////////////////////////////////////////////////////////

// pe = processing elements

module pe #(
    parameter data_size = 8
    ) (
    input wire clk,
    inout wire reset,

    input wire [data_size - 1 : 0] in_a,
    input wire [data_size - 1 : 0] in_b,
    input wire [data_size - 1 : 0] in_c,

    output reg [data_size - 1 : 0] out_a,
    output reg [data_size - 1 : 0] out_b,
    output reg [data_size - 1 : 0] out_c
    );

    always @(posedge clk) begin
        if (reset) begin
            out_a = 0;
            out_b = 0;
            out_c = 0;
        end else begin
            out_c = in_c + (in_a * in_b);
            out_a = in_a;
            out_b = in_b;
        end
    end

endmodule
