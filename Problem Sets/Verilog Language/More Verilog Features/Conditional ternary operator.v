module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] im1, im2;
    assign im1 = (a < b) ? a: b;
    assign im2 = (c < d) ? c: d;
    assign min = (im1 < im2) ? im1: im2;
endmodule