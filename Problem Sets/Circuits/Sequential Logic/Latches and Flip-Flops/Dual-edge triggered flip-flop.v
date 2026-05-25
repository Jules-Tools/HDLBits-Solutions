module top_module (
    input clk,
    input d,
    output q
);
    wire im0, im1;
    always @(posedge clk) begin
        im0 <= d;
    end
    always @(negedge clk) begin
        im1 <= d;
    end
    assign q = (clk) ? im0: im1;
endmodule