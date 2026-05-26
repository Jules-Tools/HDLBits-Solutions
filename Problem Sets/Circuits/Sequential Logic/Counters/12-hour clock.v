module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire ena_mm = (ena & ss == 8'h59) ? 1: 0;
    wire ena_hh = (ena_mm & mm == 8'h59) ? 1: 0;
    bcd_60_counter sbc(clk, reset, ena,  ss);
    bcd_60_counter mbc(clk, reset, ena_mm, mm);
    bcd_12_counter hbc(clk, reset, ena_hh, pm, hh);
endmodule

module bcd_12_counter (
    input clk,
    input reset,
    input enable,
    output pm,
    output [7:0] q);
    always @(posedge clk) begin
        if(reset) begin
            q <= 8'h12;
            pm <= 0;
        end
        else if(q == 8'h12 & enable) begin
            q <= 1;
        end
        else if(enable & q[3:0] == 4'h9)
            q <= {q[7:4] + 1, 4'h0};
        else if(enable)
            q <= q + 1;
        if (q == 8'h11 & enable)
            pm <= (pm) ? 0 : 1;
    end
endmodule

module bcd_60_counter (
    input clk,
    input reset,
    input enable,
    output [7:0] q);
    always @(posedge clk) begin
        if(reset)
            q <= 0;
        else if(q == 8'h59 & enable)
            q <= 0;
        else if(enable & q[3:0] == 4'h9)
            q <= {q[7:4] + 1, 4'h0};
        else if(enable)
            q <= q + 1;
    end
endmodule