module top_module ( input clk, input d, output q );
	wire m1, m2;
    my_dff instance1 (.clk(clk), .d(d), .q(m1));
    my_dff instance2 (.clk(clk), .d(m1), .q(m2));
    my_dff instance3 (.clk(clk), .d(m2), .q(q));
endmodule