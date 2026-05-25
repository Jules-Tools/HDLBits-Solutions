module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] in_sto;
    always @(posedge clk) begin
        if (reset)
            out <= 0;
        else
            out <= out | (in_sto & ~in);
        in_sto <= in;
    end
endmodule