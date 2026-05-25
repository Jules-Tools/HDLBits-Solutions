module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_sto;
    always @(posedge clk) begin
        pedge <= ~in_sto & in;
        in_sto <= in;
    end
endmodule