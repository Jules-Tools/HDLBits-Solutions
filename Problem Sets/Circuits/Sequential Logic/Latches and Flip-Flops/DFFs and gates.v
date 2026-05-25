module top_module (
    input clk,
    input x,
    output z
); 
    wire d0, d1, d2, q0, q1, q2;
    assign z = !(q0 | q1 | q2);
    assign d0 = x ^ q0;
    assign d1 = x & ~q1;
    assign d2 = x | ~q2;
    always @(posedge clk) begin
        q0 <= d0;
        q1 <= d1;
        q2 <= d2;
    end
endmodule