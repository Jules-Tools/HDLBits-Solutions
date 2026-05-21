module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    fadd f0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0]));
    
	genvar i;
	generate
        for (i = 1; i < 100; i = i + 1) begin: full_adders
            fadd fs (.a(a[i]), .b(b[i]), .cin(cout[i-1]), .sum(sum[i]), .cout(cout[i]));
		end
	endgenerate
endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
	assign cout = (a & b & cin) | (a & b) | ( a & cin) | (b & cin);
    assign sum = a ^ b ^ cin;
endmodule