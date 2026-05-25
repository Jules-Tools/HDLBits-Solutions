module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
	wire d, im0;
    assign im0 = (E) ? w: Q;
    assign d = (L) ? R: im0;
    always @(posedge clk) begin
        Q <= d;
    end
endmodule