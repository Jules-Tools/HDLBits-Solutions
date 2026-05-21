module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire[7:0] m1, m2, m3;
    my_dff8 ins1 (.clk(clk), .d(d), .q(m1));
    my_dff8 ins2 (.clk(clk), .d(m1), .q(m2));
    my_dff8 ins3 (.clk(clk), .d(m2), .q(m3));
    always @(*) begin
        case (sel[1:0])
          2'b00:  q = d;
          2'b01:  q = m1;
          2'b10:  q = m2;
          2'b11:  q = m3;
          default:  q = d;
    	endcase
	end
endmodule