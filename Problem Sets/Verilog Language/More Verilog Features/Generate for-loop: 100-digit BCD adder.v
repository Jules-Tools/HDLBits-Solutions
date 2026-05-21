module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] c;
    
    bcd_fadd bf0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c[0]));
    
	genvar i;
	generate
        for (i = 1; i < 100; i = i + 1) begin: full_adders
            bcd_fadd bfs (.a(a[i*4+3:i*4]), .b(b[i*4+3:i*4]), .cin(c[i-1]), .sum(sum[i*4+3:i*4]), .cout(c[i]));
		end
	endgenerate
    
    assign cout = c[99];
endmodule