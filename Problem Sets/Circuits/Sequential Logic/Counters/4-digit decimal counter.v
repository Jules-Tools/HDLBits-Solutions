module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    assign ena[1] = (q[3:0] == 4'd9) ? 1: 0;
    assign ena[2] = (ena[1] & q[7:4] == 4'd9) ? 1: 0;
    assign ena[3] = (ena[1] & ena[2] & q[11:8] == 4'd9) ? 1: 0;
    decade_counter dc0 (clk, reset, 1, q[3:0]);
    decade_counter dc1 (clk, reset, ena[1], q[7:4]);
    decade_counter dc2 (clk, reset, ena[2], q[11:8]);
    decade_counter dc3 (clk, reset, ena[3], q[15:12]);
endmodule

module decade_counter (
    input clk,
    input reset,
    input enable,
    output [3:0] q);
    always @(posedge clk) begin
        if(reset)
            q <= 0;
        else if(q == 4'd9 & enable)
            q <= 0;
        else if(enable)
            q <= q + 1;
    end
endmodule
