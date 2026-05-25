module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
	reg [7:0] in_sto;
    always @(posedge clk) begin
        anyedge <= in_sto ^ in;
        in_sto <= in;
    end
endmodule