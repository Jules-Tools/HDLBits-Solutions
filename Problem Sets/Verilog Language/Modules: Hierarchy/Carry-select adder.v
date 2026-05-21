module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire m1;
    wire[15:0] m2, m3;
    add16 ins1 (.cin(0), .a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(m1));
    add16 ins2 (.cin(0), .a(a[31:16]), .b(b[31:16]), .sum(m2));
    add16 ins3 (.cin(1), .a(a[31:16]), .b(b[31:16]), .sum(m3));
    always @(*) begin
        case (m1)
            1'b0:  sum[31:16] = m2;
            1'b1:  sum[31:16] = m3;
            default:  sum[31:16] = m2;
    	endcase
	end
endmodule