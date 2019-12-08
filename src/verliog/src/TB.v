//===================================
`timescale 1ns/1ps
//----------------------------------------------------------------
module sam3(
    a_row0,
    a_row1,
    a_row2, //matrix a inputs
    b_col0,
    b_col1,
    b_col2, //matrix b inputs
    c_row0,
    c_row1,
    c_row2, //output matrix c
    en,
    reset,
    clock,
    mult_over);//control signals

    output reg [9:0] c_row0,c_row1,c_row2;
    output reg mult_over;
    //output mult_over;

    input [3:0] a_row0,a_row1,a_row2,b_col0,b_col1,b_col2;
    input en,reset,clock;
    reg [3:0] aa_row0[2:0],aa_row1[2:0],aa_row2[2:0],bb_col0[2:0],bb_col1[2:0],bb_col2[2:0];//memory to hold matrix a and b;a:rowwise;b:columnwise
    reg [9:0] out_reg00,out_reg01,out_reg02,out_reg10,out_reg11,out_reg12,out_reg20,out_reg21,out_reg22;//output registers to hold matrix c
    //reg [9:0] cc_row0[2:0],cc_row1[2:0],cc_row2[2:0];
    //reg mult_over,all_over;

    reg [3:0] q;
    //wire [3:0] q;
    wire [9:0] cc_row_00,cc_row_01,cc_row_02,cc_row_10,cc_row_11,cc_row_12,cc_row_20,cc_row_21,cc_row_22;

    //===========================================================
    always @(posedge clock) begin
        if(en & !reset)
            q <= q + 1;
        else
            q <= 0;

        if(q>=11)
            mult_over=1;
        else
            mult_over=0; //multiplication is over after 11 clock cycles

    //5+3 clock cycles to fill the systolic processor pipeline stage
    //3 clock cycle for multiplication
    end

    //============================================================
    //count_clock clock_counter(.en(en),.reset(reset),.clock(clock),.q(q),.mult_over(mult_over));
    //============================================================
    //============================================================
    always @(posedge clock) begin
        if((!en) & reset) begin
            aa_row0[0]<=0;aa_row0[1]<=0;aa_row0[2]<=0;
            aa_row1[0]<=0;aa_row1[1]<=0;aa_row1[2]<=0;
            aa_row2[0]<=0;aa_row2[1]<=0;aa_row2[2]<=0;
            bb_col0[0]<=0;bb_col0[1]<=0;bb_col0[2]<=0;
            bb_col1[0]<=0;bb_col1[1]<=0;bb_col1[2]<=0;
            bb_col2[0]<=0;bb_col2[1]<=0;bb_col2[2]<=0;
            out_reg00<=0;out_reg01<=0;out_reg02<=0;
            out_reg10<=0;out_reg11<=0;out_reg12<=0;
            out_reg20<=0;out_reg21<=0;out_reg22<=0;
            c_row0<=0;
            c_row1<=0;
            c_row2<=0;
        end else begin
            aa_row0[0]<=a_row0;aa_row0[1]<=aa_row0[0];aa_row0[2]<=aa_row0[1];
            aa_row1[0]<=a_row1;aa_row1[1]<=aa_row1[0];aa_row1[2]<=aa_row1[1];
            aa_row2[0]<=a_row2;aa_row2[1]<=aa_row2[0];aa_row2[2]<=aa_row2[1];
            bb_col0[0]<=b_col0;bb_col0[1]<=bb_col0[0];bb_col0[2]<=bb_col0[1];
            bb_col1[0]<=b_col1;bb_col1[1]<=bb_col1[0];bb_col1[2]<=bb_col1[1];
            bb_col2[0]<=b_col2;bb_col2[1]<=bb_col2[0];bb_col2[2]<=bb_col2[1];
    //end
            if(!mult_over) //if multiplication is over send result to output one by one
            begin //else update output registers with accumulated results
                c_row0<=0;
                c_row1<=0;
                c_row2<=0;
                out_reg00<=cc_row_00;
                out_reg01<=cc_row_01;
                out_reg02<=cc_row_02;

                out_reg10<=cc_row_10;
                out_reg11<=cc_row_11;
                out_reg12<=cc_row_12;
                out_reg20<=cc_row_20;
                out_reg21<=cc_row_21;
                out_reg22<=cc_row_22;
            end else begin
    c_row0<=out_reg00;out_reg00<=out_reg01;out_reg01<=out_reg02;
    c_row1<=out_reg10;out_reg10<=out_reg11;out_reg11<=out_reg12;
    c_row2<=out_reg20;out_reg20<=out_reg21;out_reg21<=out_reg22;
    end
    end
    end //end of if-else loop
    //==============================================================
    //instantiate macs
    //===================================================================
    mac mac00(.row_element(aa_row0[0]),.col_element(bb_col0[0]),.mac_out(cc_row_00),.reset(reset),.clock(clock));
    mac mac01(.row_element(aa_row0[1]),.col_element(bb_col1[0]),.mac_out(cc_row_01),.reset(reset),.clock(clock));
    mac mac02(.row_element(aa_row0[2]),.col_element(bb_col2[0]),.mac_out(cc_row_02),.reset(reset),.clock(clock));
    mac mac10(.row_element(aa_row1[0]),.col_element(bb_col0[1]),.mac_out(cc_row_10),.reset(reset),.clock(clock));
    mac mac11(.row_element(aa_row1[1]),.col_element(bb_col1[1]),.mac_out(cc_row_11),.reset(reset),.clock(clock));
    mac mac12(.row_element(aa_row1[2]),.col_element(bb_col2[1]),.mac_out(cc_row_12),.reset(reset),.clock(clock));
    mac mac20(.row_element(aa_row2[0]),.col_element(bb_col0[2]),.mac_out(cc_row_20),.reset(reset),.clock(clock));
    mac mac21(.row_element(aa_row2[1]),.col_element(bb_col1[2]),.mac_out(cc_row_21),.reset(reset),.clock(clock));
    mac mac22(.row_element(aa_row2[2]),.col_element(bb_col2[2]),.mac_out(cc_row_22),.reset(reset),.clock(clock));
endmodule
