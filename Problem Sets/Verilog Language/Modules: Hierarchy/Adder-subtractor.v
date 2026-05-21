module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire m1;
    wire[31:0] bm;
    always @(*) begin
        case(sub)
            1'b1: bm = b ^ {32{sub}}; 
            1'b0: bm = b;
        endcase
    end
    add16 ins1 (.cin(sub), .a(a[15:0]), .b(bm[15:0]), .sum(sum[15:0]), .cout(m1));
    add16 ins2 (.cin(m1), .a(a[31:16]), .b(bm[31:16]), .sum(sum[31:16]));
endmodule