module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
    reg cout[7:0];
    fAdder f0 (.a(a[0]), .b(b[0]), .cin(1'b0), .sum(s[0]), .cout(cout[0]));
    
	genvar i;
	generate
        for (i = 1; i < 8; i = i + 1) begin: full_adders
            fAdder fs (.a(a[i]), .b(b[i]), .cin(cout[i-1]), .sum(s[i]), .cout(cout[i]));
		end
	endgenerate
    
    assign overflow = (a[7] == b[7]) ? ((a[7] != s[7]) ? 1 : 0): 0;
endmodule

module fAdder( 
    input a, b, cin,
    output cout, sum );
	assign cout = (a & b & cin) | (a & b) | ( a & cin) | (b & cin);
    assign sum = a ^ b ^ cin;
endmodule